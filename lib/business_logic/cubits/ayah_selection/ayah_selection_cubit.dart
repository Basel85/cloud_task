import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_states.dart';
import 'package:quran_app/data/network/requests/shared_preferences_requests.dart';
import 'package:quran_app/utils/app_execption_messages.dart';

class AyahSelectionCubit extends Cubit<AyahSelectionState> {
  late int currentAyahNumber;
  late String currentSurahEnglishName;
  AyahSelectionCubit() : super(AyahSelectionInitialState());

  static AyahSelectionCubit get(context) => BlocProvider.of(context);

  void selectAyah(
      {required int ayahNumber,
      required String surahEnglishName,
      required int surahNumber,
      required surahEnglishNameTranslation,
      required int numberOfAyahs}) async {
    try {
      currentAyahNumber = await SharedPreferencesRequests.getAyahNumber();
      currentSurahEnglishName =
          await SharedPreferencesRequests.getSurahEnglishName();
      if (!(ayahNumber == currentAyahNumber &&
          surahEnglishName == currentSurahEnglishName)) {
        debugPrint("Hi");
        await SharedPreferencesRequests.setValues(
            ayahNumber: ayahNumber,
            surahEnglishName: surahEnglishName,
            surahNumber: surahNumber,
            surahEnglishNameTranslation: surahEnglishNameTranslation,
            numberOfAyahs: numberOfAyahs);
        debugPrint(
            "currentAyahNumber: $currentAyahNumber ayahNumber: $ayahNumber");
        emit(AyahSelectionSuccessState(
          currentAyahNumber: ayahNumber,
          currentSurahEnglishName: surahEnglishName,
        ));
      }
    } catch (_) {
      emit(AyahSelectionErrorState(
          errorMessage: AppExceptionMessages.unexpectedExceptionMessage));
    }
  }
}
