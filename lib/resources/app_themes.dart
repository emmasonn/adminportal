import 'package:adminportal/resources/app_colors.dart';
import 'package:flutter/material.dart';

enum ThemeType { none }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.none;

  final ThemeType type;
  final bool isDark;
  final Color accent1;
  final Color accent2;
  final Color grey;
  final Color greyLight;
  final Color greyStrong;
  final Color greyStronger;

  ///Theme adjusted text color. will be black in light mode and white in dark mode
  late Color bgColor;
  late Color mainTextColor;
  late Color inverseTextColor;

  AppTheme({
    required this.type,
    required this.isDark,
    required this.accent1,
    required this.accent2,
    required this.grey,
    required this.greyLight,
    required this.greyStrong,
    required this.greyStronger,
  }) {
    bgColor = isDark ? AppColors.bgBlack : AppColors.bgWhite;
    mainTextColor = isDark ? Colors.white : Colors.black;
    inverseTextColor = isDark ? Colors.black : Colors.white;
  }

  //Creates an AppTheme from a provided type
  factory AppTheme.fromType(ThemeType t, {bool isDark = false}) {
    switch (t) {
      case ThemeType.none:
        return AppTheme(
          type: t,
          isDark: isDark,
          accent1: AppColors.accent1,
          accent2: AppColors.accent1,
          grey: AppColors.greyColor,
          greyLight: AppColors.greyLight,
          greyStrong: AppColors.greyStrong,
          greyStronger: AppColors.greyStronger,
        );

      default:
        return AppTheme(
          type: t,
          isDark: isDark,
          accent1: AppColors.accent1,
          accent2: AppColors.accent1,
          grey: AppColors.greyColor,
          greyLight: AppColors.greyLight,
          greyStrong: AppColors.greyStrong,
          greyStronger: AppColors.greyStronger,
        );
    }
  }

  //Converts AppTheme into a Material Theme data
  ThemeData toThemeData() {
    var t = ThemeData.from(
        textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
        colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: accent1,
          onPrimary: AppColors.onAccent,
          secondary: accent1,
          onSecondary: AppColors.onAccent,
          error: AppColors.errorColor,
          onError: AppColors.onAccent,
          background: bgColor,
          onBackground: inverseTextColor,
          surface: mainTextColor,
          onSurface: inverseTextColor,
        ));

    t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accent1,
        selectionHandleColor: Colors.transparent,
        selectionColor: accent1,
      ),
      highlightColor: AppColors.accent1Light,
    );

    return t;
  }
}
