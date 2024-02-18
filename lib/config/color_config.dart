import 'dart:ui';

import 'package:flutter/widgets.dart';

class ColorConfig {
  ColorConfig._();

  static const LIGHT_BACKGROUND = "#f9f9f9";
  static const DARK_BACKGROUND = "#191919";
  static const DIVIDER_COLOR = "#ECEBEB";

  static const LIGHT_PRIMARY_RED = "#E62B1E";
  static const LIGHT_10_RED = "#D5100A";
  static const LIGHT_20_RED = "#DB1A12";
  static const LIGHT_30_RED = "#DF2016";
  static const LIGHT_40_RED = "#E3261A";
  static const LIGHT_50_RED = "#E62B1E";
  static const LIGHT_60_RED = "#EA4B40";
  static const LIGHT_70_RED = "#EE6B62";
  static const LIGHT_80_RED = "#F3958F";
  static const LIGHT_90_RED = "#F8BFBC";
  static const LIGHT_100_RED = "#ffffff";

  static const DARK_PRIMARY_RED = "#d92c2f";
  static const DARK_10_RED = "#c3282a";
  static const DARK_20_RED = "#ae2326";
  static const DARK_30_RED = "#981f21";
  static const DARK_40_RED = "#821a1c";
  static const DARK_50_RED = "#6d1618";
  static const DARK_60_RED = "#571213";
  static const DARK_70_RED = "#410d0e";
  static const DARK_80_RED = "#2b0909";
  static const DARK_90_RED = "#160405";
  static const DARK_100_RED = "#000000";
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));

  static Color toColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'HEX color must be #rrggbb or #rrggbbaa');

    return Color(getColorFromHex(hex));
  }

  static Color toDarker(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color toLighten(Color color, [double amount = .5]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

extension HexColorStringExt on String {
  Color toColor() {
    return HexColor.toColor(this);
  }

  int toHex() {
    return HexColor.getColorFromHex(this);
  }
}

extension HexColorColorExt on Color {
  String toHex() => '#${value.toRadixString(16)}';
}
