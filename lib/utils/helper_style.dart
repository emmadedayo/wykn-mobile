import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelperStyle {
  HelperStyle._();

  static TextStyle textStyle({
    required Color color,
    required double fontSize,
    required FontWeight weight,
    double letterSpacing = 0.1,
    bool isJustify = false,
    bool underline = false, // Added parameter for underline
  }) {
    final TextStyle baseStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: weight,
        letterSpacing: letterSpacing,
      ),
    );

    // Apply underline style if underline parameter is true
    return underline ? baseStyle.copyWith(decoration: TextDecoration.underline) : baseStyle;
  }
}
