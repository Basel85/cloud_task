import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_states.dart';
import 'package:quran_app/data/network/requests/shared_preferences_requests.dart';
import 'package:quran_app/utils/app_execption_messages.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit() : super(LastReadInitialState());
  late int ayahNumber;
  late int surahNumber;
  late String surahEnglishName;
  late String surahEnglishNameTranslation;
  late int numberOfAyahs;
  static LastReadCubit get(context) => BlocProvider.of(context);

  Future<void> getValues() async {
    try {
      emit(LastReadLoadingState());
      ayahNumber = await SharedPreferencesRequests.getAyahNumber();
      surahNumber = await SharedPreferencesRequests.getSurahNumber();
      surahEnglishName = await SharedPreferencesRequests.getSurahEnglishName();
      surahEnglishNameTranslation =
          await SharedPreferencesRequests.getSurahEnglishNameTranslation();
      numberOfAyahs = await SharedPreferencesRequests.getNumberOfAyahs();
      emit(LastReadSuccessState(
          ayahNumber: ayahNumber,
          surahNumber: surahNumber,
          surahEnglishName: surahEnglishName,
          surahEnglishNameTranslation: surahEnglishNameTranslation,numberOfAyahs: numberOfAyahs));
    } on TimeoutException catch (_) {
      emit(LastReadErrorState(
          errorMessage: AppExceptionMessages.timeOutExceptionMessage));
    } on SocketException catch (_) {
      emit(LastReadErrorState(
          errorMessage: AppExceptionMessages.socketExceptionMessage));
    } catch (_) {
      emit(LastReadErrorState(
          errorMessage: AppExceptionMessages.unexpectedExceptionMessage));
    }
  }
}
