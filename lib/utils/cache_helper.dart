import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  String get({required String key});
  Future<void> set({required String key, required String value});
  Future<void> delete({required String key});
}

class CacheHelperImplementation extends CacheHelper {
  final SharedPreferences sharedPreferences;

  CacheHelperImplementation({required this.sharedPreferences});

  @override
  String get({required String key}) {
    return sharedPreferences.getString(key) ?? 'en';
  }

  @override
  Future<void> set({required String key, required String value}) async {
    sharedPreferences.setString(key, value);
  }

  @override
  Future<void> delete({required String key}) async {
    sharedPreferences.remove(key);
  }
}
