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

/// FileHandlerService manages the lifecycle of shared files passed to the application.
///
/// It listens for incoming deep links and file intents using the AppLinks package.
/// Since shared files from apps like WhatsApp or Google Drive use "content://" URIs
/// that Dart cannot read directly, this service bridges the gap via a native MethodChannel.
class FileHandlerService {
  static final FileHandlerService _instance = FileHandlerService._internal();
  factory FileHandlerService() => _instance;
  FileHandlerService._internal();

  final _appLinks = AppLinks();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Native channel to communicate with MainActivity.kt for ContentResolver operations.
  static const _platform = MethodChannel('com.trioverse.uniceps/content_resolver');

  /// Tracks if the application UI is ready to navigate to the import screen.
  bool _isAppReady = false;

  /// Stores a URI if it arrives before the app is fully initialized (e.g., during cold start).
  String? _pendingUriString;

  /// Initializes the listeners for incoming file intents.
  ///
  /// Uses String-based streams instead of Uri-based streams to prevent Dart's
  /// Uri parser from crashing on malformed percent-encodings or special Arabic characters.
  void init() {
    // Handle the file that triggered the app launch (Cold Start)
    _appLinks.getInitialLinkString().then((uriString) {
      if (uriString != null) _processFile(uriString);
    });

    // Handle files shared while the app is already running (Warm Start)
    _appLinks.stringLinkStream.listen((uriString) {
      _processFile(uriString);
    });
  }

  /// Notifies the service that the app UI (Navigator) is ready to handle redirections.
  void setAppReady() {
    _isAppReady = true;
    if (_pendingUriString != null) {
      _processFile(_pendingUriString!);
      _pendingUriString = null;
    }
  }

  /// Processes a URI string representing a shared file.
  ///
  /// [uriString] can be a "content://" URI (from sharing apps) or a "file://" URI.
  void _processFile(String uriString) async {
    // If the Navigator is not ready, store the URI for later processing.
    if (!_isAppReady) {
      _pendingUriString = uriString;
      debugPrint("App not ready, storing pending URI: $uriString");
      return;
    }

    try {
      String? content;
      String? fileName;

      /**
       * Scenario 1: Content URIs (Standard for Android File Sharing)
       * These require native code access via the ContentResolver.
       */
      if (uriString.startsWith('content://')) {
        // Fetch the filename using native code (handles Arabic/Metadata correctly)
        fileName = await _platform.invokeMethod('getFileName', {'uri': uriString});

        // Read the actual file bytes from the native side
        final Uint8List? bytes = await _platform.invokeMethod('readContentUri', {'uri': uriString});
        if (bytes != null) {
          // Decode bytes to String (Assumes UTF-8 for .unx files)
          content = utf8.decode(bytes);
        }
      }
      /**
       * Scenario 2: Standard File URIs
       * These can be read directly by Dart's IO library.
       */
      else {
        String path = uriString;
        if (path.startsWith('file://')) {
          // toFilePath() handles the conversion of file:// scheme to local OS paths
          path = Uri.parse(uriString).toFilePath();
        }

        final file = File(path);
        if (await file.exists()) {
          fileName = p.basename(path);
          content = await file.readAsString();
        }
      }

      /**
       * Final Filename Cleanup
       * We attempt to decode the filename in case it is still percent-encoded.
       * We wrap this in a try-catch to prevent "Illegal percent encoding" crashes
       * if the filename contains raw '%' characters.
       */
      if (fileName != null) {
        try {
          fileName = Uri.decodeFull(fileName);
        } catch (e) {
          debugPrint("Filename decoding failed (probably raw %): $e");
          // Fallback to the raw fileName from the native side
        }
      }

      // If we successfully retrieved both name and content, proceed to the Import Screen
      if (content != null && fileName != null) {
        debugPrint("File opened successfully: $fileName");

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
