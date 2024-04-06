import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class SettingsComponent extends StatelessWidget {
  final String settingsComponentName;
  final List<Widget> contents;
  const SettingsComponent(
      {super.key, required this.settingsComponentName, required this.contents});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  insetPadding: EdgeInsets.symmetric(
                      horizontal: 40 * SizeConfig.horizontalBlock),
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20 * SizeConfig.horizontalBlock,
                        vertical: 20 * SizeConfig.verticalBlock),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          settingsComponentName,
                          textAlign: TextAlign.center,
                          style:
                              AppThemes.fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW500,
                        ),
                        SizedBox(
                          height: 30 * SizeConfig.verticalBlock,
                        ),
                        for (int index = 0; index < contents.length; index++)
                          contents[index],
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 40 * SizeConfig.horizontalBlock,
            right: 40 * SizeConfig.horizontalBlock,
            bottom: 30 * SizeConfig.verticalBlock),
        padding: EdgeInsets.symmetric(
            horizontal: 20 * SizeConfig.horizontalBlock,
            vertical: 20 * SizeConfig.verticalBlock),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          settingsComponentName,
          textAlign: TextAlign.center,
          style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW500,
        ),
      ),
    );
  }
}
