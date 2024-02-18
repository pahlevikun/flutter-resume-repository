import 'dart:ui';

import 'package:pahlevikun.github.io/config/color_config.dart';

class AppConfig {
  AppConfig._();
  static final Color primaryColor = HexColor("8f9779");
  static final Color secondaryColor = HexColor("98585c");
  static final Color backgroundColor = HexColor("f5ecd7");
  static final Color backgroundCard = HexColor("b1a994");
  static final Color backgroundNestedCard = HexColor("bfbdb7");
  static final Color textColor = HexColor("f7f7f7");

  static const MIN_TABLET_SIZE = 1100;
  static const MAX_MOBILE_SIZE = 480;
}
