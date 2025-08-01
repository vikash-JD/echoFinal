import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color palette
  static const Color primary = Color(0xFF2563eb);
  static const Color accent = Color(0xFF38bdf8);
  static const Color backgroundLight = Color(0xFFe3f0ff);
  static const Color backgroundDark = Color(0xFF181A20);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF23262F);
  static const Color glass = Color(0x80FFFFFF); // 50% white for glassmorphism

  // Typography
  static final TextTheme textTheme = GoogleFonts.poppinsTextTheme().copyWith(
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: primary),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
    labelLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: accent),
  );

  // Light theme
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,
    cardColor: cardLight,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: accent,
      background: backgroundLight,
      surface: cardLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      filled: true,
      fillColor: glass,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: const BorderSide(color: primary),
      ),
    ),
    // TODO: Add glassmorphism, neumorphism, and animation extensions
  );

  // Dark theme
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    cardColor: cardDark,
    textTheme: textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: accent,
      background: backgroundDark,
      surface: cardDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      filled: true,
      fillColor: glass,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
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
    // TODO: Add glassmorphism, neumorphism, and animation extensions
  );
} 