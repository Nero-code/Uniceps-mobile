import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Global instance for easy access
final logger = _AppLogger();

class _AppLogger {
  late Logger _logger;

  _AppLogger() {
    _logger = Logger(
      level: kDebugMode ? Level.all : Level.error,
      printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        dateTimeFormat: DateTimeFormat.dateAndTime, // Show timestamp
      ),
    );
  }

  /// Log a message at level [Level.trace]
  void t(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug]
  void d(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info]
  void i(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning]
  void w(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error]
  void e(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal]
  void f(dynamic message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }
}
