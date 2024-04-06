import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';

class PrayerTimesComponent extends StatelessWidget {
  final String prayer;
  const PrayerTimesComponent({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$prayer ",
            style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize12FontWeightW600
          ),
          TextSpan(
            text: ' 5:55am',
            style: AppThemes.fontFamilyPoppinsColor0xFF484848FontSize12FontWeightW500
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
