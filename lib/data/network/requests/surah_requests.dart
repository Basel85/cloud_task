import 'package:quran_app/constants/end_points.dart';
import 'package:quran_app/data/data_providers/remote/http_helper.dart';
import 'package:quran_app/data/models/ayah_model.dart';
import 'package:quran_app/data/models/surah_model.dart';
import 'package:quran_app/utils/app_custom_exception.dart';

class SurahRequests {
  static const _surahsUrl = '${baseUrl}surah';
  static late Map<String, dynamic> _data;

  static Future<List<SurahModel>> getListOfSurahs() async {
    _data = await HttpHelper.get(_surahsUrl);
    if (_data['code'] == 200) {
      return _data['data']
          .map((surah) => SurahModel.getListOfSurahFromJson(surah))
          .toList()
          .cast<SurahModel>();
    } else {
      throw AppCustomException(_data['status']);
    }
  }

  static Future<List<AyahModel>> getSurahAyahs(int surahNumber) async {
    _data = await HttpHelper.get(
        "$_surahsUrl/$surahNumber");
    if (_data['code'] == 200) {
      return _data['data']['ayahs']
          .map((ayah) => AyahModel.fromJson(ayah))
          .toList()
          .cast<AyahModel>();
    } else {
      throw AppCustomException(_data['status']);
    }
  }
}
