import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final _sharedPreferences = SharedPreferences.getInstance();

  static void setString(String key, String value) {
    _sharedPreferences.then((sharedPreference) {
      sharedPreference.setString(key, value);
    });
  }

  static void setInt (String key, int value) {
    _sharedPreferences.then((sharedPreference) {
      sharedPreference.setInt(key, value);
    });
  }

  static Future<String> getString(String key,String defaultValue) {
    return _sharedPreferences
        .then((sharedPreference) => sharedPreference.getString(key) ?? defaultValue);
  }

  static Future<int> getInt(String key, int defaultValue) {
    return _sharedPreferences
        .then((sharedPreference) => sharedPreference.getInt(key) ?? defaultValue);
  }
}
