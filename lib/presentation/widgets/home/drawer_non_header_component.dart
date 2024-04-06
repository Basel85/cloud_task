import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class NonHeaderDrawerComponent extends StatelessWidget {
  final void Function() onTap;
  final IconData nonHeaderDrawerIcon;
  final String nonHeaderDrawerText;
  const NonHeaderDrawerComponent(
      {super.key,
      required this.onTap,
      required this.nonHeaderDrawerIcon,
      required this.nonHeaderDrawerText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: 34 * SizeConfig.horizontalBlock,
            bottom: 33 * SizeConfig.verticalBlock),
        child: Row(
          children: [
            Icon(
              nonHeaderDrawerIcon,
              color: AppThemes.color0xFF300759,
              size: 26 * SizeConfig.textRatio,
            ),
            SizedBox(
              width: 23.6 * SizeConfig.horizontalBlock,
            ),
            Text(
              nonHeaderDrawerText,
              style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize15FontWeitghtW500,
            )
          ],
        ),
      ),
    );
  }
}
