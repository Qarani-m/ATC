import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF11a6a1)),
        useMaterial3: true,
        textTheme: TextTheme(
            bodySmall: GoogleFonts.poppins(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp),
            bodyMedium: GoogleFonts.poppins(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
            bodyLarge: GoogleFonts.poppins(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp)),
        iconTheme: const IconThemeData(color: AppColors.secondaryColor));
  }
}
