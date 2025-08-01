import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDarkTheme {
  // Color palette
  static const Color base = Color(0xFF0A0A1F);
  static const Color primary = Color(0xFF3C9EFF);
  static const Color accent = Color(0xFF9BD9E5);
  static const Color background = Color(0xFF111214);
  static const Color card = Color(0xFF18191B); // glassmorphic effect
  static const Color bodyText = Color(0xFFE0E0E0);
  static const Color headerText = Color(0xFFFFFFFF);
  static const Color border = Color(0x22FFFFFF);

  // Typography
  static final TextTheme textTheme = GoogleFonts.poppinsTextTheme().copyWith(
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: headerText),
    headlineMedium: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: headerText),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, color: bodyText),
    labelLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: accent),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    cardColor: card,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: base,
      foregroundColor: headerText,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: accent,
      background: background,
      surface: card,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: border)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: border)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: accent, width: 2)),
      filled: true,
      fillColor: card,
      labelStyle: TextStyle(color: bodyText),
      hintStyle: TextStyle(color: bodyText.withOpacity(0.7)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: headerText,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accent,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: const BorderSide(color: accent),
      ),
    ),
    iconTheme: const IconThemeData(color: accent),
    // TODO: Add glassmorphism, neumorphism, and animation extensions
  );
} 