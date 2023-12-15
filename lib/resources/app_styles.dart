//all available fonts
import 'package:adminportal/resources/app_dimen.dart';
import 'package:flutter/material.dart';

class Fonts {
  static const String lato = 'Lato';

  static const String poppins = 'Poppins';

  static const String poly = 'Poly';

  static const String roboto = 'Roboto';
}

class TextStyles {
  
  static const TextStyle lato = TextStyle(
    fontFamily: Fonts.lato,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
  );

  static const TextStyle poppins = TextStyle(
    fontFamily: Fonts.poppins,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle poly = TextStyle(
    fontFamily: Fonts.poly,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle roboto = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get appTitle => _createTextStyle(
        style: poppins,
        weight: FontWeight.w700,
        fontSize: FontSizes.s40,
        height: .5,
      );

  static TextStyle get appTitle1 => _createTextStyle(
        style: poppins,
        weight: FontWeight.bold,
        fontSize: FontSizes.s24,
        height: .5,
      );

  static TextStyle get t1 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s20,
        weight: FontWeight.bold,
        letterSpacing: -.32,
        height: 0.5,
      );

  static TextStyle get t2 => _createTextStyle(
        style: poppins,
        weight: FontWeight.w500,
        fontSize: FontSizes.s16,
        letterSpacing: -.32,
      );

  static TextStyle get t3 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s14,
        weight: FontWeight.w500,
        letterSpacing: -.32,
      );

  static TextStyle get h1 => _createTextStyle(
        style: poppins,
        weight: FontWeight.w500,
        fontSize: FontSizes.s48,
      );

  static TextStyle get h2 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s24,
      );

  static TextStyle get h3 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s18,
      );

  static TextStyle get h4 => _createTextStyle(
        style: poppins,
        letterSpacing: -.5,
        fontSize: FontSizes.s16,
      );

  static TextStyle get body1 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s14,
      );

  static TextStyle get body2 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s12,
      );

  static TextStyle get body3 => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s11,
      );

  static TextStyle get callout => _createTextStyle(
        style: poppins,
        fontSize: FontSizes.s14,
        letterSpacing: 1.75,
      );

  static TextStyle get calloutFocus => _createTextStyle(
        style: callout,
        weight: FontWeight.bold,
        fontSize: FontSizes.s14,
      );

  static TextStyle get btnStyle => _createTextStyle(
        style: poppins,
        weight: FontWeight.w500,
        fontSize: FontSizes.s16,
      );

  static TextStyle get caption => _createTextStyle(
        style: lato,
        fontSize: FontSizes.s11,
        letterSpacing: .3,
      );

  static TextStyle _createTextStyle({
    required TextStyle style,
    required double fontSize,
    FontWeight? weight,
    double? letterSpacing,
    double? height,
  }) {
    return style.copyWith(
      fontSize: fontSize,
      fontWeight: weight ?? style.fontWeight,
      letterSpacing: letterSpacing ?? style.letterSpacing,
      height: height ?? style.height,
    );
  }
}
