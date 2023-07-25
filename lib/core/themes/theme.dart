//theme
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
