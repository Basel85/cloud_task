import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.suffixIcon,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: AppThemes.fontFamilyPoppinsColor0xCC300759FontSize13FontWeightW400,
        contentPadding: EdgeInsets.only(
            left: 25 * SizeConfig.horizontalBlock,
            top: 14 * SizeConfig.verticalBlock,
            bottom: 15 * SizeConfig.verticalBlock),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
