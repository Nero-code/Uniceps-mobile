import 'dart:convert';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:uniceps/app/presentation/auxiliary/screens/file_import_screen.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/injection_dependency.dart';

class FileHandlerService {
  static final FileHandlerService _instance = FileHandlerService._internal();
  factory FileHandlerService() => _instance;
  FileHandlerService._internal();

  final _appLinks = AppLinks();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const _platform = MethodChannel('com.trioverse.uniceps/content_resolver');

  bool _isAppReady = false;
  Uri? _pendingUri;

  void init() {
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) _processFile(uri);
    });

    _appLinks.uriLinkStream.listen((uri) {
      _processFile(uri);
    });
  }

  void setAppReady() {
    _isAppReady = true;
    if (_pendingUri != null) {
      _processFile(_pendingUri!);
      _pendingUri = null;
    }
  }

  void _processFile(Uri uri) async {
    if (!_isAppReady) {
      _pendingUri = uri;
      debugPrint("App not ready, storing pending URI: $uri");
      return;
    }

    try {
      String? content;
      String? fileName;

      if (uri.scheme == 'content') {
        // Fetch the actual display name from the native side (handles hashes from WhatsApp)
        fileName = await _platform.invokeMethod('getFileName', {'uri': uri.toString()});

        // Use Uri.decodeFull to handle Arabic/URL-encoded characters
        if (fileName != null) fileName = Uri.decodeFull(fileName);

        final Uint8List? bytes = await _platform.invokeMethod('readContentUri', {'uri': uri.toString()});
        if (bytes != null) {
          content = utf8.decode(bytes);
        }
      } else {
        final String filePath = uri.toFilePath();
        final file = File(filePath);
        if (await file.exists()) {
          fileName = Uri.decodeFull(p.basename(filePath));
          content = await file.readAsString();
        }
      }

      // Fallback filename
      fileName ??= Uri.decodeFull(p.basename(uri.path));

      if (content != null) {
        debugPrint("File opened successfully");

        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => RoutinesWithHeatBloc(sl()),
              child: FileImportScreen(fileName: fileName!, fileContent: content!),
            ),
            settings: const RouteSettings(name: AppRoutes.fileImport),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error handling file: $e");
    }
  }
}
