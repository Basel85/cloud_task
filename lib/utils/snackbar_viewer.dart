import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';

mixin SnackBarViewer{
  void showSnackBar({required BuildContext context,required Color backgroundColor,required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message,style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW600,),backgroundColor: backgroundColor,)
    );
  }
}