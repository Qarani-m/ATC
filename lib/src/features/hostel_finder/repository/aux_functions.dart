import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/hostel_finder/controller/submit_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
  SubmitReviewController submitReviewController = Get.put(SubmitReviewController());


class HostelFinderAuxFunctions {
  static void showBottomSheet(String hostelId) {
    Get.bottomSheet(
      enterBottomSheetDuration:Duration(milliseconds: 500),
      exitBottomSheetDuration:Duration(milliseconds: 200),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        height: 200.h,
        decoration: BoxDecoration(
        color: Colors.white,

          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        )
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                textAlign:TextAlign.center,
                'To leave a review you must be signed in',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                  onTap: () {submitReviewController.goToSignIn(hostelId);},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: AppColors.whiteColor, fontSize: 15.sp),
                    ),
                  )),
                  SizedBox(height: 20.h,),
              GestureDetector(
                  onTap: () {Get.back();},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        border:Border.all(color:AppColors.accentColor),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      "Close",
                      style: TextStyle(
                          color: AppColors.secondaryColor, fontSize: 15.sp),
                    ),
                  ))
            ],
          ),
        ),
      ), // Your custom bottom sheet widget
      backgroundColor: Colors.transparent, // Set background color
      isDismissible: true, // Allow dismissing by tapping outside
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ), // Set rounded corners
    );
  }

  static void showSnackBar(String title, String message) {
    Get.snackbar(
        colorText: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        title,
        message);
  }
}
