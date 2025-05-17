import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  /// Ensure SharedPreferences is initialized
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Save int value
  static Future<bool> setInt(String key, int value) async {
    await init();
    return _prefs!.setInt(key, value);
  }

  /// Save string value
  static Future<bool> setString(String key, String value) async {
    await init();
    return _prefs!.setString(key, value);
  }

  /// Save bool value
  static Future<bool> setBool(String key, bool value) async {
    await init();
    return _prefs!.setBool(key, value);
  }

  /// Save double value
  static Future<bool> setDouble(String key, double value) async {
    await init();
    return _prefs!.setDouble(key, value);
  }

  /// Save list of strings
  static Future<bool> setStringList(String key, List<String> value) async {
    await init();
    return _prefs!.setStringList(key, value);
  }

  /// Get int value
  static Future<int?> getInt(String key) async {
    await init();
    return _prefs!.getInt(key);
  }

  /// Get string value
  static Future<String?> getString(String key) async {
    await init();
    return _prefs!.getString(key);
  }

  /// Get bool value
  static Future<bool?> getBool(String key) async {
    await init();
    return _prefs!.getBool(key);
  }

  /// Get double value
  static Future<double?> getDouble(String key) async {
    await init();
    return _prefs!.getDouble(key);
  }

  /// Get list of strings
  static Future<List<String>?> getStringList(String key) async {
    await init();
    return _prefs!.getStringList(key);
  }

  /// Remove a key
  static Future<bool> remove(String key) async {
    await init();
    return _prefs!.remove(key);
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    await init();
    return _prefs!.containsKey(key);
  }

  /// Clear all shared preferences (use with caution)
  static Future<bool> clearAll() async {
    await init();
    return _prefs!.clear();
  }
}
