import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

import '../../../utils/keys.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isHome;
  final bool isNotMainUserScreenAndNonBottomNavigationBarScreens;
  final IconData? actionsIcon;
  final Future<void> Function()? asyncFunctionInvokeInBackButtonOnTap;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.actionsIcon,
      this.isHome = true,
      this.isNotMainUserScreenAndNonBottomNavigationBarScreens = false,
      this.asyncFunctionInvokeInBackButtonOnTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: AppThemes.color0xFFDAD0E1,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 32 * SizeConfig.horizontalBlock,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isHome) ...[
                  if (!isNotMainUserScreenAndNonBottomNavigationBarScreens) ...[
                    GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: SvgPicture.asset(
                          AppAssets.menuIcon,
                          width: 21 * SizeConfig.horizontalBlock,
                          height: 15 * SizeConfig.verticalBlock,
                        ))
                  ]
                ] else ...[
                  GestureDetector(
                    onTap: () async {
                      if (asyncFunctionInvokeInBackButtonOnTap != null) {
                        await asyncFunctionInvokeInBackButtonOnTap!();
                      }
                      debugPrint("Messi is the best in the world");
                      Navigator.pop(Keys.navigatorKey.currentContext!);
                    },
                    child: SvgPicture.asset(
                      AppAssets.backIcon,
                      width: 25 * SizeConfig.horizontalBlock,
                      height: 25.02 * SizeConfig.verticalBlock,
                    ),
                  ),
                ],
                if (!isNotMainUserScreenAndNonBottomNavigationBarScreens) ...[
                  SizedBox(
                    width: 18 * SizeConfig.horizontalBlock,
                  ),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppThemes
                        .fontFamilyPoppinsColor0xFF300759FontSize24FontWeightW700,
                  ),
                ),
                if (actionsIcon != null) ...[
                  Icon(
                    actionsIcon,
                    size: 16 * SizeConfig.horizontalBlock,
                  )
                ]
              ]),
        ),
      ),
    );
  }
}
