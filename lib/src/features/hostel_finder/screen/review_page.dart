import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:atc/src/features/hostel_finder/controller/submit_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({super.key});

  final hostelFinderController = Get.find<HostelFinderController>();
  final submitReviewController = Get.find<SubmitReviewController>();
  final authHelper = Get.find<AuthHelper>();
  @override
  Widget build(BuildContext context) {
    submitReviewController.hostelId.value =
    submitReviewController.hostelId.value = Get.parameters["hostelId"]??"";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 39.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40.r),
                        image: const DecorationImage(
                            image: AssetImage(AppImages.image1),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 15.w,
                    top: 10.h,
                    child: GestureDetector(
                      onTap: () {
                        hostelFinderController.goBack();
                      },
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: AppColors.whiteColor,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Nacary Elite house",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 17.sp),
              ),
              SizedBox(height: 10.h),
              Container(
                alignment: Alignment.center,
                width: 327.w,
                child: Text(
                  "Your overal rating for this hostel",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                ),
              ),
              
              SizedBox(height: 10.h),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  alignment: Alignment.center,
                  width: 327.w,
                  child: RatingBar.builder(
                    unratedColor: AppColors.secondaryColor.withOpacity(0.2),
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: AppColors.accentColor,
                    ),
                    onRatingUpdate: (rating) {
                      submitReviewController.starRating.value = rating;
                    },
                  )),
              SizedBox(height: 20.h),
              Text(
                "Add a detailed review",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: AppColors.secondaryColor.withOpacity(0.02),
                      offset: const Offset(0, 4),
                      blurRadius: 4.0,
                    )
                  ]),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 28.w),
                    child: TextField(
                      onChanged: (value) {
                        submitReviewController.writtenReview.value = value;
                      },
                      controller:
                          submitReviewController.writtenReviewController,
                      maxLines: 4,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15.sp, color: AppColors.secondaryColor),
                      cursorColor: AppColors.secondaryColor,
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "Enter here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
                      ),
                    ),
                  )),
              SizedBox(height: 30.h),
              GestureDetector(
                  onTap: () {
                    submitReviewController.submitReview();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.whiteColor, fontSize: 16.sp),
                    ),
                  )),
              SizedBox(height: 30.h),
              Obx(()=>SizedBox(
                child:submitReviewController.isSubmiting.value? LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.accentColor,
                    size: 50,
                  ):null,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
