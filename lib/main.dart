import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/screen/home_page.dart';


void main() {
   SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.dark),
    );
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375,812),
      builder:(_, child)=> GetMaterialApp(
        
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lighTheme(),
        darkTheme: darkTheme(),
        home:HostelFinderHome(),
      ),
    );
  }

  ThemeData lighTheme() {
    return ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF11a6a1)),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall:  GoogleFonts.poppins(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp),

          bodyMedium: GoogleFonts.poppins(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
          bodyLarge:  GoogleFonts.poppins(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp)

        ),
        iconTheme: const IconThemeData(
          color: AppColors.secondaryColor
        )
      );
  }
  ThemeData darkTheme() {
    return ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF11a6a1)),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall:  GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp),

          bodyMedium: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
          bodyLarge:  GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp)

        ),
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor
        )
      );
  }
}