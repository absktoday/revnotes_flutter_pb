import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, brightness: Brightness.light),
      useMaterial3: true,
      textTheme: GoogleFonts.figtreeTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }

  static ThemeData dartTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: GoogleFonts.figtreeTextTheme(
        Theme.of(context).primaryTextTheme,
      ),
    );
  }
}
