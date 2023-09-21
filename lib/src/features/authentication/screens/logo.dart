import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Image(image: AssetImage(AppImages.logo),height: 90.h,width: 60.w,)),
      ),
    );
  }
}