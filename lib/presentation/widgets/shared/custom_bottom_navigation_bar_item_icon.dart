import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class CustomBottomNavigationBarItemIcon extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  const CustomBottomNavigationBarItemIcon(
      {super.key, required this.isSelected, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSelected
          ? 66 * SizeConfig.horizontalBlock
          : 48 * SizeConfig.horizontalBlock,
      height: isSelected
          ? 66 * SizeConfig.verticalBlock
          : 48 * SizeConfig.verticalBlock,
      decoration: ShapeDecoration(
        color:
            isSelected ? AppThemes.color0xFF300759 : AppThemes.color0xFFE5B6F2,
        shape: const OvalBorder(),
      ),
      alignment: Alignment.center,
      child: FaIcon(iconData),
    );
  }
}
