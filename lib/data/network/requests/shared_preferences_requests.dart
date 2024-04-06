import 'package:quran_app/data/data_providers/local/shared_preferences_helper.dart';

class SharedPreferencesRequests {
  static const String _surahEnglishNameKey = 'surahEnglishName';
  static const String _ayahNumberKey = 'ayahNumber';
  static const String _surahNumberKey = 'surahNumber';
  static const String _surahEnglishNameTranslationKey =
      'surahEnglishNameTranslation';
  static const String _numberOfAyahsKey = 'numberOfAyahs';

  static Future<void> setValues(
      {required String surahEnglishName,
      required int ayahNumber,
      required int surahNumber,
      required String surahEnglishNameTranslation, required int numberOfAyahs}) async {
    SharedPreferencesHelper.setString(_surahEnglishNameKey, surahEnglishName);
    SharedPreferencesHelper.setInt(_ayahNumberKey, ayahNumber);
    SharedPreferencesHelper.setInt(_surahNumberKey, surahNumber);
    SharedPreferencesHelper.setString(_surahEnglishNameTranslationKey, surahEnglishNameTranslation);
    SharedPreferencesHelper.setInt(_numberOfAyahsKey, numberOfAyahs);
  }

  static Future<String> getSurahEnglishName() {
    return SharedPreferencesHelper.getString(
        _surahEnglishNameKey, 'Al-Faatiha');
  }

  static Future<int> getAyahNumber() {
    return SharedPreferencesHelper.getInt(_ayahNumberKey, 1);
  }

  static Future<int> getSurahNumber() {
    return SharedPreferencesHelper.getInt(_surahNumberKey, 1);
  }

  static Future<String> getSurahEnglishNameTranslation() {
    return SharedPreferencesHelper.getString(
        _surahEnglishNameTranslationKey, 'The Opening');
  }

  static Future<int> getNumberOfAyahs() {
    return SharedPreferencesHelper.getInt(_numberOfAyahsKey, 7);
  }
}
