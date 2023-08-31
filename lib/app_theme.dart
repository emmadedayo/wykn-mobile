import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wykn/utils/color.dart';

class AppTheme {
  static ThemeData get lightMode => ThemeData(
      splashColor: Colors.transparent,
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      primarySwatch: AppColors.primarySwatch,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        displayMedium: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        displaySmall: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        titleSmall: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ));

  static ThemeData get darkTheme => ThemeData(
      splashColor: Colors.transparent,
      colorScheme: ColorScheme.dark(primary: AppColors.mainColor),
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.mainColor,
      primarySwatch: AppColors.primarySwatch,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        displayMedium: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        displaySmall: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        titleSmall: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ));
}
