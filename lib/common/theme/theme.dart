import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum PahleviThemeOption { DEFAULT }

class PahleviThemePicker {
  static final ThemeData defaultTheme = ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.black87,
      backgroundColor: Colors.amber,
      brightness: Brightness.light,
      hintColor: Colors.black54,
      focusColor: Colors.amber,
      fontFamily: GoogleFonts.openSans().fontFamily,
      textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black87),
          headline2: TextStyle(color: Colors.black87),
          headline3: TextStyle(color: Colors.black87),
          headline4: TextStyle(color: Colors.black87),
          headline5: TextStyle(color: Colors.black87),
          headline6: TextStyle(color: Colors.black87),
          subtitle1:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
          subtitle2:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
          bodyText1: TextStyle(color: Colors.black54),
          bodyText2: TextStyle(color: Colors.black54),
          button: TextStyle(color: Colors.white)));

  static ThemeData getTheme() {
    return defaultTheme;
  }
}
