import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String firstTime = 'first_time';
  static const String languageCode = 'language_code';
  static const String apiTokenKey = 'api_token';
}

class SharedPrefsStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static dynamic get(String key) {
    try {
      return _prefs.get(key);
    } catch (e) {
      return null;
    }
  }

  static Future<void> set(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    }
  }

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
