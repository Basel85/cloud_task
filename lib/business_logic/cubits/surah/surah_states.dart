import 'package:quran_app/data/models/ayah_model.dart';
import 'package:quran_app/data/models/surah_model.dart';

abstract class SurahState {}

class SurahInitialState extends SurahState {}

class SurahGetListOfSurahsLoadingState extends SurahState {}

class SurahGetSurahAyahsLoadingState extends SurahState {}

class SurahGetListOfSurahsSuccessState extends SurahState {
  final List<SurahModel> surahs;
  
  SurahGetListOfSurahsSuccessState({required this.surahs});
}

class SurahGetSurahAyahsSuccessState extends SurahState {
  final List<AyahModel> surahAyahs;
  SurahGetSurahAyahsSuccessState({required this.surahAyahs});
}

class SurahGetListOfSurahsErrorState extends SurahState {
  final String errorMessage;
  SurahGetListOfSurahsErrorState({required this.errorMessage});
}

class SurahGetSurahAyahsErrorState extends SurahState {
  final String errorMessage;
  SurahGetSurahAyahsErrorState({required this.errorMessage});
}
