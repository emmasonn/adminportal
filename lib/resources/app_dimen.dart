class PageBreaks {
  static double get largePhone => 550;
  static double get tabletPortrait => 768;
  static double get tabletLandscape => 1024;
  static double get desktop => 1440;
}

class BreakPoints {
  static const double start = 0;
  static const double mobile = 450;
  static const double tablet = 800;
  static const double desktop = 1920;
}

class Sizes {
  static double get sm => 15;
  static double get md => 20;
  static double get lg => 25;
  static double get vlg => 40;
}

class FontSizes {
  static double s8 = 8;

  static double s10 = 10;

  static double s11 = 11;

  static double s12 = 12;

  static double s13 = 13;

  static double s14 = 14;

  static double s16 = 16;

  static double s18 = 18;

  static double s20 = 20;

  static double s24 = 24;

  static double s36 = 36;

  static double s40 = 40;

  static double s48 = 48;
}

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 700);
  static const Duration verySlow = Duration(microseconds: 1200);
  static const Duration pageTransition = Duration(microseconds: 200);
}

class Corners {
  static const double vsm = 3.0;
  static const double sm = 6.0;
  static const double md = 8.0;
  static const double lg = 32.0;
  static const double vLg = 40.0;
}

class Insets {
  static const double _scale = 1;

  static double xxs = 4 * _scale;

  static double xs = 8 * _scale;

  static double sm = 16 * _scale;

  static double md = 24 * _scale;

  static double lg = 32 * _scale;

  static double xl = 48 * _scale;

  static double xxl = 56 * _scale;

  static double offset = 80 * _scale;
}
