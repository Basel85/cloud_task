abstract class AyahSelectionState {}

class AyahSelectionInitialState extends AyahSelectionState {}

class AyahSelectionSuccessState extends AyahSelectionState {
  final int currentAyahNumber;
  final String currentSurahEnglishName;
  AyahSelectionSuccessState(
      {required this.currentSurahEnglishName, required this.currentAyahNumber});
}

class AyahSelectionErrorState extends AyahSelectionState {
  final String errorMessage;
  AyahSelectionErrorState({required this.errorMessage});
}
