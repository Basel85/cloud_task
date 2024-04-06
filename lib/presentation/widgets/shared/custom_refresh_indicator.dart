import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final double paddingLeft;
  final double paddingRight;
  final Widget Function(BuildContext, int) itemBuilder ;
  final int itemCount;
  const CustomRefreshIndicator(
      {super.key, required this.onRefresh, this.paddingLeft = 0, this.paddingRight = 0, required this.itemBuilder, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppThemes.color0xFFDAD0E1,
      color: AppThemes.color0xFF300759,
      strokeWidth: 2 * SizeConfig.horizontalBlock,
      displacement: 40 * SizeConfig.verticalBlock,
      onRefresh: onRefresh,
      child: ListView.builder(padding: EdgeInsets.only(left: paddingLeft,right: paddingRight),itemBuilder: itemBuilder,itemCount: itemCount,),
    );
  }
}
