import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/authentication/controller/onboarding_controller.dart';
import 'package:atc/src/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
  OnBoardingController controller =Get.put(OnBoardingController());

    return Scaffold(
      body: Padding(

        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 200.h,
              width: 327.w,
              child: SvgPicture.asset(
                height: MediaQuery.of(context).size.height * 0.9,
                AppImages.welcomeScreenImage,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "Studying Made Convinient",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Let's put your creativity on the development\n highwaaay",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            GestureDetector(
                    onTap: () {controller.goToLogin();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.whiteColor, fontSize: 15.sp),
                      ),
                    )),
                    SizedBox(height: 20.h,),
                    GestureDetector(
                    onTap: () {controller.goToSignUp();},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.accentColor),
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.accentColor, fontSize: 15.sp),
                      ),
                    )),
                    SizedBox(height: 100.h,)
      
          ],
        ),
      ),
    );
  }
}