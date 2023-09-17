import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/screen/home_page.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/screen/hostel_details.dart';
import 'package:hostelfinder_v2/src/utils/bindings/app_bindings.dart';
import 'package:hostelfinder_v2/src/utils/themes/app_theme.dart';

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
  const MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (_, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(),
        initialBinding: AppBindings(),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => HostelFinderHome()),
          GetPage(name: "/hostelDetails", page: () => const HostelDetails())
        ],
      ),
    );
  }
}
