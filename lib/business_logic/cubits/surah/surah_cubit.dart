import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_states.dart';
import 'package:quran_app/data/network/requests/surah_requests.dart';
import 'package:quran_app/utils/app_custom_exception.dart';
import 'package:quran_app/utils/app_execption_messages.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitialState());

  static SurahCubit get(context) => BlocProvider.of(context);

  Future<void> getListOfSurahs() async {
    try {
      emit(SurahGetListOfSurahsLoadingState());
      final surahs = await SurahRequests.getListOfSurahs();
      emit(SurahGetListOfSurahsSuccessState(surahs: surahs));
    } on TimeoutException catch (_) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage: AppExceptionMessages.timeOutExceptionMessage));
    } on AppCustomException catch (exception) {
      emit(SurahGetListOfSurahsErrorState(errorMessage: exception.message));
    } on SocketException catch (_) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage:
              AppExceptionMessages.socketExceptionMessage));
    } catch (_) {
      emit(SurahGetListOfSurahsErrorState(
          errorMessage: AppExceptionMessages.unexpectedExceptionMessage));
    }
  }
  Future<void> getSurahAyahs({required int surahNumber}) async {
    try {
      emit(SurahGetSurahAyahsLoadingState());
      final ayahs = await SurahRequests.getSurahAyahs(surahNumber);
      emit(SurahGetSurahAyahsSuccessState(surahAyahs: ayahs));
    } on TimeoutException catch (_) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage: AppExceptionMessages.timeOutExceptionMessage));
    } on AppCustomException catch (exception) {
      emit(SurahGetSurahAyahsErrorState(errorMessage: exception.message));
    } on SocketException catch (_) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage:
              AppExceptionMessages.socketExceptionMessage));
    } catch (e) {
      emit(SurahGetSurahAyahsErrorState(
          errorMessage: AppExceptionMessages.unexpectedExceptionMessage));
    }
  }
}
