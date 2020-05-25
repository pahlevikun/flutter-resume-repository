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
        headline: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        title: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
        subtitle:
            TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
        body1: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
        button: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));

  static ThemeData getTheme() {
    return defaultTheme;
  }
}
