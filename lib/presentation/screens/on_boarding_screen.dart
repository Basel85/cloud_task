import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 113 * SizeConfig.verticalBlock,
          ),
          Text(
            "Quran App",
            style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize24FontWeightW700,
          ),
          SizedBox(
            height: 6 * SizeConfig.verticalBlock,
          ),
          Text(
            "Learn Quran every day and\n recite once everyday",
            style: AppThemes.fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW700,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 41 * SizeConfig.verticalBlock,
          ),
          Stack(
            children: [
              Container(
                  height: 437 * SizeConfig.verticalBlock,
                  margin: EdgeInsets.only(
                      left: 32 * SizeConfig.horizontalBlock,
                      right: 32 * SizeConfig.horizontalBlock,
                      bottom: 25 * SizeConfig.verticalBlock),
                  padding: EdgeInsets.only(
                      top: 82 * SizeConfig.verticalBlock,
                      bottom: 37 * SizeConfig.horizontalBlock,
                      left: 14 * SizeConfig.horizontalBlock,
                      right: 14 * SizeConfig.horizontalBlock),
                  decoration: ShapeDecoration(
                    color: AppThemes.color0xFF300759,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: AppThemes.color0x3F300759,
                        blurRadius: 20,
                        offset: Offset(4, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.mosqueImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: (32 + 56) * SizeConfig.horizontalBlock,
                  right: (32 + 57) * SizeConfig.horizontalBlock,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40 * SizeConfig.horizontalBlock,
                          vertical: 12 * SizeConfig.verticalBlock),
                      decoration: ShapeDecoration(
                        color: AppThemes.color0xFF9D1DF2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style:
                            AppThemes.fontFamilyPoppinsColor0xFFDAD0E1FontSize18FontWeightW600,
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
