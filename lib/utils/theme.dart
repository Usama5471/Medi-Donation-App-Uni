import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData leafGuardTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.green.shade700,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
    bodyMedium: const TextStyle(fontSize: 16, color: Colors.black87),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade800,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green.shade700,
    foregroundColor: Colors.white,
    titleTextStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
  ),
);
