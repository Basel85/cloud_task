class AyahModel {
  final int ayahNumberInSurah;
  final String ayahText;
  AyahModel({required this.ayahNumberInSurah, required this.ayahText});
  factory AyahModel.fromJson(Map<String, dynamic> ayahJson) {
    return AyahModel(
        ayahNumberInSurah: ayahJson['numberInSurah'], ayahText: ayahJson['text']);
  }
}
