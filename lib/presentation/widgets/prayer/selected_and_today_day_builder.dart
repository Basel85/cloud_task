import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class SelectedAndTodayDayBuilder extends StatelessWidget {
  final bool isToday;
  final DateTime day;
  const SelectedAndTodayDayBuilder(
      {super.key, this.isToday = true, required this.day});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 8 * SizeConfig.horizontalBlock,
            vertical: 5 * SizeConfig.verticalBlock),
        decoration: ShapeDecoration(
          color: isToday ? AppThemes.color0xFFDAD0E1 : AppThemes.pureWhite,
          shape: const OvalBorder(),
        ),
        child: Text(
          day.day.toString(),
          textAlign: TextAlign.center,
          style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW500,
        ),
      ),
    );
  }
}
