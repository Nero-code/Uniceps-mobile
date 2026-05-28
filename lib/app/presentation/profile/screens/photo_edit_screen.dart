import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_cubit.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class PhotoEditScreen extends StatefulWidget {
  final String imagePath;

  const PhotoEditScreen({super.key, required this.imagePath});

  @override
  State<PhotoEditScreen> createState() => _PhotoEditScreenState();
}

class _PhotoEditScreenState extends State<PhotoEditScreen> {
  final ValueNotifier<Matrix4> _matrixNotifier = ValueNotifier<Matrix4>(Matrix4.identity());

  // Create a GlobalKey to capture the raw screen painting pixels
  final GlobalKey _boundaryKey = GlobalKey();

  Matrix4 _startMatrix = Matrix4.identity();
  Offset _startFocalPoint = Offset.zero;
  double _currentScale = 1.0;
  double _startScale = 1.0;

  final double _cropBoxSize = 300.0;
  ui.Image? _uiImage;
  bool _isImageLoaded = false;
  bool _isMatrixInitialized = false;

  bool loadingDialogActive = false;
  bool _isPopping = false;

  @override
  void initState() {
    super.initState();
    _loadImageFromFile();
  }

  @override
  void dispose() {
    _matrixNotifier.dispose();
    super.dispose();
  }

  Future<void> _loadImageFromFile() async {
    try {
      final Uint8List bytes = await File(widget.imagePath).readAsBytes();
      final ui.Image image = await decodeImageFromList(bytes);

      if (mounted) {
        setState(() {
          _uiImage = image;
          _isImageLoaded = true;
        });
      }
    } catch (e) {
      debugPrint("Error loading image file: $e");
    }
  }

  // PIXEL-PERFECT SNAPSHOT METHOD
  // This takes an absolute frame capture of the custom paint canvas exactly as the user sees it.
  Future<Uint8List?> _prepareCroppedImage(Size screenSize) async {
    try {
      // 1. Find the rendering context of our RepaintBoundary widget
      final RenderRepaintBoundary boundary = _boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

      // 2. Extract the current frame as a high-fidelity image snapshot
      // pixelRatio balances screen scaling factors across different device screens
      final double pixelRatio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
      final ui.Image fullImage = await boundary.toImage(pixelRatio: pixelRatio);

      // 3. Compute crop box positions translated into real physical pixel spaces
      final double cropLeft = ((screenSize.width - _cropBoxSize) / 2) * pixelRatio;
      final double cropTop = ((screenSize.height - _cropBoxSize) / 2) * pixelRatio;
      final double physicalCropSize = _cropBoxSize * pixelRatio;

      // 4. Set up a sub-canvas to crop the exact 300x300 bounding box area
      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final ui.Canvas canvas = ui.Canvas(recorder);

      canvas.drawImageRect(
        fullImage,
        ui.Rect.fromLTWH(cropLeft, cropTop, physicalCropSize, physicalCropSize), // Source box coordinates
        ui.Rect.fromLTWH(0, 0, _cropBoxSize, _cropBoxSize), // Rescale output neatly to 300x300
        ui.Paint()..filterQuality = ui.FilterQuality.high,
      );

      final ui.Picture picture = recorder.endRecording();
      final ui.Image croppedUiImage = await picture.toImage(_cropBoxSize.toInt(), _cropBoxSize.toInt());

      final ByteData? byteData = await croppedUiImage.toByteData(format: ui.ImageByteFormat.png);

      // Free rendering engine pointers instantly
      fullImage.dispose();
      picture.dispose();
      croppedUiImage.dispose();

      if (byteData != null) {
        return byteData.buffer.asUint8List();
      }
    } catch (e) {
      debugPrint("Snapshot error: $e");
    }
    return null;
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _startMatrix = _matrixNotifier.value.clone();
    _startFocalPoint = details.localFocalPoint;
    _startScale = _currentScale;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details, Size screenSize) {
    if (!_isImageLoaded || _uiImage == null || details.scale == 0) return;

    final double cropLeft = (screenSize.width - _cropBoxSize) / 2;
    final double cropTop = (screenSize.height - _cropBoxSize) / 2;
    final double cropRight = cropLeft + _cropBoxSize;
    final double cropBottom = cropTop + _cropBoxSize;

    final double minScaleX = _cropBoxSize / _uiImage!.width.toDouble();
    final double minScaleY = _cropBoxSize / _uiImage!.height.toDouble();
    final double minScale = math.max(minScaleX, minScaleY);

    double targetScale = _startScale * details.scale;
    if (targetScale < minScale) {
      targetScale = minScale;
    }

    final double factor = targetScale / _startScale;

    Matrix4 updatedMatrix = _startMatrix.clone();
    final Offset localizedFocalPoint = details.localFocalPoint - _startFocalPoint;

    updatedMatrix.translateByVector3(vector_math.Vector3(_startFocalPoint.dx, _startFocalPoint.dy, 0.0));
    updatedMatrix.scaleByVector3(vector_math.Vector3(factor, factor, 1.0));
    updatedMatrix.translateByVector3(vector_math.Vector3(-_startFocalPoint.dx, -_startFocalPoint.dy, 0.0));
    updatedMatrix.translateByVector3(vector_math.Vector3(localizedFocalPoint.dx, localizedFocalPoint.dy, 0.0));

    final double scaledWidth = _uiImage!.width.toDouble() * targetScale;
    final double scaledHeight = _uiImage!.height.toDouble() * targetScale;

    final vector_math.Vector3 translation = updatedMatrix.getTranslation();
    double tx = translation.x;
    double ty = translation.y;

    double maxTx = cropLeft;
    double minTx = cropRight - scaledWidth;
    double maxTy = cropTop;
    double minTy = cropBottom - scaledHeight;

    if (minTx > maxTx) minTx = maxTx;
    if (minTy > maxTy) minTy = maxTy;

    tx = tx.clamp(minTx, maxTx);
    ty = ty.clamp(minTy, maxTy);

    updatedMatrix.setTranslation(vector_math.Vector3(tx, ty, 0.0));

    if (!tx.isNaN && !ty.isNaN) {
      _currentScale = targetScale;
      _matrixNotifier.value = updatedMatrix;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _isPopping = true;
          context.read<ProfileCubit>().getProfile();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Edit Photo', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) => state.when(
                initial: () {
                  return null;
                },
                loading: () {
                  if (loadingDialogActive || _isPopping) return null;

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const LoadingIndicator(elevated: false),
                  );
                  loadingDialogActive = true;
                  return null;
                },
                loaded: (_) {
                  if (_isPopping) return null;
                  _isPopping = true;
                  Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.profile);
                  return null;
                },
                error: (e) {
                  if (loadingDialogActive) {
                    Navigator.pop(context);
                    loadingDialogActive = false;
                  }
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(l10n.errNoInternet), backgroundColor: Colors.red));
                  return null;
                },
              ),
              buildWhen: (_, current) => current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (innerContext, state) {
                final p = state.whenOrNull(loaded: (p) => p);
                return TextButton(
                  onPressed: () async {
                    final RenderBox? box = context.findRenderObject() as RenderBox?;
                    if (box != null) {
                      final Size widgetSize = Size(box.size.width, box.size.height);

                      // Captures exactly what is being painted within the boundary
                      final Uint8List? croppedBytes = await _prepareCroppedImage(widgetSize);

                      if (croppedBytes != null && context.mounted) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text('Perfect crop saved! Ready for storage.'),
                        //     backgroundColor: Colors.green,
                        //   ),
                        // );
                        // final res = await FileHelper.saveToInternalStorage(croppedBytes);

                        // Navigator.pop(context, croppedBytes);
                        if (p != null) {
                          context.read<ProfileCubit>().uploadProfilePic(p, croppedBytes);
                        }
                      }
                    }
                  },
                  child: Text(
                    l10n.save,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                );
              },
            ),
          ],
        ),
        body: !_isImageLoaded
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : LayoutBuilder(
                builder: (context, constraints) {
                  final Size screenSize = Size(constraints.maxWidth, constraints.maxHeight);

                  if (!_isMatrixInitialized) {
                    final double cropLeft = (screenSize.width - _cropBoxSize) / 2;
                    final double cropTop = (screenSize.height - _cropBoxSize) / 2;

                    final double initScaleX = _cropBoxSize / _uiImage!.width.toDouble();
                    final double initScaleY = _cropBoxSize / _uiImage!.height.toDouble();
                    final double initScale = math.max(initScaleX, initScaleY);

                    final Matrix4 initMatrix = Matrix4.identity();
                    initMatrix.translateByVector3(vector_math.Vector3(cropLeft, cropTop, 0.0));
                    initMatrix.scaleByVector3(vector_math.Vector3(initScale, initScale, 1.0));

                    _currentScale = initScale;
                    _matrixNotifier.value = initMatrix;
                    _isMatrixInitialized = true;
                  }

                  return GestureDetector(
                    onScaleStart: _handleScaleStart,
                    onScaleUpdate: (details) => _handleScaleUpdate(details, screenSize),
                    child: Stack(
                      children: [
                        // CRITICAL: RepaintBoundary holds the key that reads painted raster pixels
                        RepaintBoundary(
                          key: _boundaryKey,
                          child: ValueListenableBuilder<Matrix4>(
                            valueListenable: _matrixNotifier,
                            builder: (context, currentMatrix, _) {
                              return CustomPaint(
                                size: Size.infinite,
                                painter: ImageCanvasPainter(image: _uiImage!, transformMatrix: currentMatrix),
                              );
                            },
                          ),
                        ),
                        const Positioned.fill(
                          child: IgnorePointer(child: RepaintBoundary(child: StaticCropOverlay(cropBoxSize: 300.0))),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class ImageCanvasPainter extends CustomPainter {
  final ui.Image image;
  final Matrix4 transformMatrix;

  ImageCanvasPainter({required this.image, required this.transformMatrix});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.transform(transformMatrix.storage);
    canvas.drawImage(image, Offset.zero, Paint()..filterQuality = ui.FilterQuality.low);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ImageCanvasPainter oldDelegate) {
    return oldDelegate.transformMatrix != transformMatrix;
  }
}

class StaticCropOverlay extends StatelessWidget {
  final double cropBoxSize;
  const StaticCropOverlay({super.key, required this.cropBoxSize});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: CropOverlayPainter(cropBoxSize: cropBoxSize));
  }
}

class CropOverlayPainter extends CustomPainter {
  final double cropBoxSize;
  CropOverlayPainter({required this.cropBoxSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.7);
    final double left = (size.width - cropBoxSize) / 2;
    final double top = (size.height - cropBoxSize) / 2;
    final double right = left + cropBoxSize;
    final double bottom = top + cropBoxSize;

    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, top), paint);
    canvas.drawRect(Rect.fromLTRB(0, top, left, size.height), paint);
    canvas.drawRect(Rect.fromLTRB(right, top, size.width, size.height), paint);
    canvas.drawRect(Rect.fromLTRB(left, bottom, right, size.height), paint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
