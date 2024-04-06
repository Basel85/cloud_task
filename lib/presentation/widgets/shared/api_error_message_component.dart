import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';

class ApiErrorMessageComponent extends StatelessWidget {
  final String errorMessage;
  final void Function() onTap;
  const ApiErrorMessageComponent(
      {super.key, required this.errorMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$errorMessage\n",
              style: AppThemes
                  .fontFamilyPoppinsColor0xFF300759FontSize14FontWeightW700,
            ),
            TextSpan(
                text: "Tap to reload",
                style: AppThemes
                    .fontFamilyPoppinsColor0xFF0E17F6FontSize13FontWeightW700,
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
