import 'package:get_it/get_it.dart';
import 'package:quran_app/utils/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;
Future<void> initDependency() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(
      () => CacheHelperImplementation(sharedPreferences: sharedPreferences));
}
