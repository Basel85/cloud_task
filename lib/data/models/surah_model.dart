class SurahModel {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final int numberOfAyahs;
  SurahModel({
    required this.surahNumber,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahEnglishNameTranslation,
    required this.numberOfAyahs,
  });
  factory SurahModel.getListOfSurahFromJson(Map<String, dynamic> surahJson) {
    return SurahModel(
      surahNumber: surahJson['number'],
      surahName: surahJson['name'],
      surahEnglishName: surahJson['englishName'],
      surahEnglishNameTranslation: surahJson['englishNameTranslation'],
      numberOfAyahs: surahJson['numberOfAyahs'],
    );
  }
}
