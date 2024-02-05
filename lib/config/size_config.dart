import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static const double TINY_SIZE = 4;
  static const double TINY_LARGE_SIZE = 6;
  static const double SMALL_SIZE = 8;
  static const double SMALL_LARGE_SIZE = 12;
  static const double MEDIUM_SMALL_SIZE = 14;
  static const double MEDIUM_SIZE = 16;
  static const double MEDIUM_LARGE_SIZE = 18;
  static const double MEDIUM_EXTRA_LARGE_SIZE = 20;
  static const double LARGE_SMALL_SIZE = 24;
  static const double LARGE_SIZE = 32;
  static const double LARGE_MEDIUM_SIZE = 48;
  static const double BIG_SIZE = 64;
  static const double BIG_ULTRA_SIZE = 112;
  static const double ULTRA_SIZE = 128;

  static const double EXPERTISE_BOX_SIZE = 260;

  static const double VERTICAL_PADDING_SIZE = 54;
  static const double HORIZONTAL_PADDING_SIZE = 48;
  static const PAGE_CONTENT_PADDING = EdgeInsets.symmetric(
    vertical: VERTICAL_PADDING_SIZE,
    horizontal: HORIZONTAL_PADDING_SIZE,
  );

  static const double HEADER_FONT_SIZE = 54;
  static const double SUB_HEADER_FONT_SIZE = 15;
  static const double SUB_TITLE_1_FONT_SIZE = 22;
  static const double SUB_TITLE_2_FONT_SIZE = 20;
  static const double BODY_1_FONT_SIZE = 12;
  static const double BODY_2_FONT_SIZE = 14;
  static const double BODY_3_FONT_SIZE = 16;

  SizeConfig? init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    return SizeConfig();
  }

  double getFont(int block) {
    return safeBlockHorizontal! * block;
  }

  double getHorizontal(int block) {
    return safeBlockHorizontal! * block;
  }

  double getVertical(int block) {
    return safeBlockVertical! * block;
  }

  double? getScreenHeight() => screenHeight;
}