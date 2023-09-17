import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/authentication/screens/forgot_password.dart';
import 'package:atc/src/features/authentication/screens/login.dart';
import 'package:atc/src/features/authentication/screens/signup.dart';
import 'package:atc/src/features/hostel_finder/screen/home_page.dart';
import 'package:atc/src/features/hostel_finder/screen/hostel_details.dart';
import 'package:atc/src/features/hostel_finder/screen/review_page.dart';
import 'package:atc/src/utils/bindings/app_bindings.dart';
import 'package:atc/src/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


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
        initialRoute: "/forgotPassword",
        getPages: [
          GetPage(name: "/", page: () => HostelFinderHome()),
          GetPage(name: "/hostelDetails", page: () => const HostelDetails()),
          GetPage(name: "/reviewPage", page: () =>  ReviewPage()),
          GetPage(name: "/login", page: () =>  Login()),
          GetPage(name: "/signUp", page: () =>  SignUp()),
          GetPage(name: "/forgotPassword", page: () =>  ForgotPassword()),
        ],
      ),
    );
  }
}
