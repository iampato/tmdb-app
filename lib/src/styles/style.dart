import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_app/src/utils/extensions.dart';

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);

  static const Duration fast = Duration(milliseconds: 250);

  static const Duration medium = Duration(milliseconds: 350);

  static const Duration slow = Duration(milliseconds: 700);

  static const Duration slower = Duration(milliseconds: 1000);

  static const Duration pagination = Duration(milliseconds: 1500);
}

// class Fonts {
//   static const String lato = "Lato";

//   static const String quicksand = "Quicksand";

//   static const String emoji = "OpenSansEmoji";
// }

class PageBreaks {
  static double get largePhone => 550;

  static double get tabletPortrait => 768;

  static double get tabletLandscape => 1024;

  static double get desktop => 1440;
}

class Insets {
  static double gutterScale = 1;

  static const double scale = 1;

  /// Dynamic insets, may get scaled with the device size
  static double mGutter = m * gutterScale;

  static double lGutter = l * gutterScale;

  static const double xs = 2 * scale;

  static const double sm = 6 * scale;

  static const double m = 12 * scale;

  static const double l = 24 * scale;

  static const double xl = 36 * scale;
}

class FontSizes {
  static const double scale = 1;

  static const double s11 = 11 * scale;

  static const double s12 = 12 * scale;

  static const double s14 = 14 * scale;

  static const double s16 = 16 * scale;

  static const double s18 = 18 * scale;
}

class Sizes {
  static const double hitScale = 1;

  static const double hit = 40 * hitScale;

  static const double iconMed = 20;

  static const double sideBarSm = 150 * hitScale;

  static const double sideBarMed = 200 * hitScale;

  static const double sideBarLg = 290 * hitScale;
}

class TextStyles {
  // static const TextStyle lato = TextStyle(
  //   fontWeight: FontWeight.w400,
  //   letterSpacing: 0,
  //   height: 1,
  // );

  // static const TextStyle quicksand = TextStyle(
  //   fontFamily: Fonts.quicksand,
  //   fontWeight: FontWeight.w400,
  //   fontFamilyFallback: [
  //     Fonts.emoji,
  //   ],
  // );
  static TextStyle montserrat = GoogleFonts.montserrat();

  static TextStyle get t1 =>
      montserrat.bold.size(FontSizes.s14).letterSpace(.7);

  static TextStyle get t2 =>
      montserrat.bold.size(FontSizes.s12).letterSpace(.4);

  static TextStyle get h1 => montserrat.bold.size(FontSizes.s14);

  static TextStyle get h2 => montserrat.bold.size(FontSizes.s12);

  static TextStyle get body1 => montserrat.size(FontSizes.s14);

  static TextStyle get body2 => montserrat.size(FontSizes.s12);

  static TextStyle get body3 => montserrat.size(FontSizes.s11);

  static TextStyle get callout =>
      montserrat.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get calloutFocus => callout.bold;

  static TextStyle get btn =>
      montserrat.bold.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get btnSelected =>
      montserrat.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get footnote => montserrat.bold.size(FontSizes.s11);

  static TextStyle get caption =>
      montserrat.size(FontSizes.s11).letterSpace(.3);
}

class Shadows {
  static bool enabled = true;

  static double get mRadius => 8;

  static List<BoxShadow> m(Color color, [double opacity = 0]) {
    return enabled
        ? [
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: mRadius,
              spreadRadius: mRadius / 2,
              offset: const Offset(1, 0),
            ),
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: mRadius / 2,
              spreadRadius: mRadius / 4,
              offset: const Offset(1, 0),
            )
          ]
        : const <BoxShadow>[];
  }
}

class Corners {
  static const double btn = s5;

  static const double dialog = 12;

  /// Xs
  static const double s3 = 3;

  static BorderRadius get s3Border => BorderRadius.all(s3Radius);

  static Radius get s3Radius => const Radius.circular(s3);

  /// Small
  static const double s5 = 5;

  static BorderRadius get s5Border => BorderRadius.all(s5Radius);

  static Radius get s5Radius => const Radius.circular(s5);

  /// Medium
  static const double s8 = 8;

  static const BorderRadius s8Border = BorderRadius.all(s8Radius);

  static const Radius s8Radius = Radius.circular(s8);

  /// Large
  static const double s10 = 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => const Radius.circular(s10);
}
