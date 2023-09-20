import 'package:atc/firebase_options.dart';
import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/authentication/screens/forgot_password.dart';
import 'package:atc/src/features/authentication/screens/login.dart';
import 'package:atc/src/features/authentication/screens/signup.dart';
import 'package:atc/src/features/hostel_finder/screen/home_page.dart';
import 'package:atc/src/features/hostel_finder/screen/hostel_details.dart';
import 'package:atc/src/features/hostel_finder/screen/review_page.dart';
import 'package:atc/src/utils/bindings/app_bindings.dart';
import 'package:atc/src/utils/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.light),
  );
  GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // .then((value) => Get.put(AuthHelper()));
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
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
          GetPage(name: "/hostelDetails", page: () => const HostelDetails()),
          GetPage(name: "/reviewPage", page: () => ReviewPage()),
          GetPage(name: "/login", page: () => Login()),
          GetPage(name: "/signUp", page: () => SignUp()),
          GetPage(name: "/forgotPassword", page: () => ForgotPassword()),
        ],
      ),
    );
  }
}
