import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // COLORS
  static const Color color0xFFE5B6F2 = Color(0xFFE5B6F2);
  static const Color color0xFFCD77F2 = Color(0xFFCD77F2);
  static const Color color0xFF7B15BF = Color(0xFF7B15BF);
  static const Color color0xFF9D1DF2 = Color(0xFF9D1DF2);
  static const Color color0xFF300759 = Color(0xFF300759);
  static const Color color0x3F300759 = Color(0x3F300759);
  static const Color color0xFFDAD0E1 = Color(0xFFDAD0E1);
  static const Color color0xCC300759 = Color(0xCC300759);
  static const Color color0xFF0E17F6 = Color(0xFF0E17F6);
  static const Color color0x3F000000 = Color(0x3F000000);
  static const Color pureWhite = Colors.white;
  static const Color color0xFF484848 = Color(0xFF484848);
  static const Color color0xE00E17F6 = Color(0xE00E17F6);
  static const Color pureBlack = Colors.black;
  static late double _textRatio;

  static void init(double textRatio) {
    _textRatio = textRatio;
  }

  // DECORATIONS
  static Decoration color0xFFE5B6F2BorderRadius10 = ShapeDecoration(
    color: color0xFFE5B6F2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  static Decoration color0xFFE5B6F2BorderRadiusTopLeft20BottomRight20 =
      const ShapeDecoration(
    color: AppThemes.color0xFFE5B6F2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
  );
  // TEXT STYLES
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize24FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 24 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF9D1DF2,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFFDAD0E1FontSize18FontWeightW600 =
      GoogleFonts.poppins(
    color: color0xFFDAD0E1,
    fontSize: 18 * _textRatio,
    fontWeight: FontWeight.w600,
  );
  static TextStyle fontFamilyPoppinsColor0xFF9D1DF2FontSize14FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF9D1DF2,
    fontSize: 14 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xCC300759FontSize13FontWeightW400 =
      GoogleFonts.poppins(
    color: color0xCC300759,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW600 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w600,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW400 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW400 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontFamilyPoppinsColor0xFF0E17F6FontSize11FontWeightW400 =
      GoogleFonts.poppins(
    color: color0xFF0E17F6,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 18 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF9D1DF2,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize15FontWeitghtW500 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 15 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW500 =
      GoogleFonts.poppins(
          color: color0xFF300759,
          fontSize: 18 * _textRatio,
          fontWeight: FontWeight.w500);
  static TextStyle fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF484848,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xE00E17F6FontSize11FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xE00E17F6,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF484848FontSize18FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF484848,
    fontSize: 18 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsPureBlackFontSize11FontWeightW500 =
      GoogleFonts.poppins(
    color: pureBlack,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 11 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize12FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 12 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize12FontWeightW600 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 12 * _textRatio,
    fontWeight: FontWeight.w600,
  );
  static TextStyle fontFamilyPoppinsColor0xFF484848FontSize12FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF484848,
    fontSize: 12 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyLateefColor0xFF300759FontSize24FontWeightW400 =
      GoogleFonts.lateef(
    color: color0xFF300759,
    fontSize: 24 * _textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize14FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 14 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF0E17F6FontSize13FontWeightW700 =
      GoogleFonts.poppins(
    color: color0xFF0E17F6,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w700,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 13 * _textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontFamilyPoppinsColor0xFF300759FontSize10FontWeightW500 =
      GoogleFonts.poppins(
    color: color0xFF300759,
    fontSize: 10 * _textRatio,
    fontWeight: FontWeight.w500,
  );
}
