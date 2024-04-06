import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';

class QuranMetaDataComponent extends StatelessWidget {
  final bool isHome;
  final Widget? trailing;
  final String surahEnglishName;
  final int numberOfAyahs;
  final String surahEnglishNameTranslation;
  const QuranMetaDataComponent(
      {super.key,
      this.isHome = true,
      this.trailing,
      required this.surahEnglishName,
      required this.numberOfAyahs,
      required this.surahEnglishNameTranslation});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahEnglishName,
              style: isHome
                  ? AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize14FontWeightW700
                  : AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW700,
              textAlign: TextAlign.center,
            ),
            Text(
              "Verse $numberOfAyahs",
              style: isHome
                  ? AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW500
                  : AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW500,
              textAlign: TextAlign.center,
            ),
            Text(
              "($surahEnglishNameTranslation)",
              style: isHome
                  ? AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW500
                  : AppThemes
                      .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW500,
              textAlign: TextAlign.center,
            )
          ],
        ),
        if(trailing!=null)...[
        trailing!,
        ]
      ],
    );
  }
}
