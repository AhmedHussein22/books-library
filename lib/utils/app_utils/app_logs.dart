import 'dart:developer';
import 'package:flutter/foundation.dart';

class AppLogs {
  AppLogs._();

  static String get _getCurrentTime {
    final DateTime now = DateTime.now();
    return '${now.minute}:${now.second}:${now.millisecond}';
  }

  static const String _resetColor = '\x1B[0m';
  static const String _successColor = '\x1B[32m'; // Green
  static const String _debugColor = '\x1B[37m'; // Blue
  static const String _infoColor = '\x1B[36m'; // Cyan
  static const String _errorColor = '\x1B[31m'; // Red

  static void _log(String message, String tag, String color, int level) {
    if (kDebugMode) {
      log(
        '$color$tag: $message$_resetColor',
        name: '$tag $_getCurrentTime',
        level: level,
      );
    }
  }

  //* Success
  static void successLog(String message, [String tag = 'Success']) {
    _log(message, tag, _successColor, 0);
  }

  //* Debug
  static void debugLog(String message, [String tag = 'Debug']) {
    _log(message, tag, _debugColor, 1);
  }

  //* Info
  static void infoLog(String message, [String tag = 'Info']) {
    _log(message, tag, _infoColor, 2);
  }

  //* Error
  static void errorLog(String message, [String tag = 'Error']) {
    _log(message, tag, _errorColor, 3);
  }
}