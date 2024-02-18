import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/color_config.dart';

class StyleConfig {
  StyleConfig._();

  static final textStyleHeader = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 54,
    color: AppConfig.textColor,
  );

  static final textStyleSubHeader = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 17,
    color: AppConfig.textColor,
  );

  static final textStyleCta = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppConfig.textColor,
  );

  static final textStylePageTitle = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: AppConfig.textColor,
  );

  static final textStylePageSubTitle = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppConfig.textColor,
  );

  static final textStylePageBodyTitle = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: AppConfig.textColor,
  );

  static final textStylePageBodyContent = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 17,
    color: AppConfig.textColor,
  );

  static final textStylePageInfoItem = GoogleFonts.lato().copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppConfig.textColor,
  );
}
