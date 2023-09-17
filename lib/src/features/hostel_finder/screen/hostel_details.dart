import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/constants/image_strings.dart';
import 'package:hostelfinder_v2/src/constants/text_strings.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HostelDetails extends StatelessWidget {
  const HostelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.dark),
    );
    PageController controller = PageController();
    final hostelFinderController = Get.find<HostelFinderController>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            height: 740.h,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 39.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                height: 350.h,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  hostelFinderController
                                      .currentPageDotIndex.value = index;
                                }),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 350.h,
                                    width: 390.w,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(40.r),
                                        image: const DecorationImage(
                                            image: AssetImage(AppImages.image1),
                                            fit: BoxFit.cover)),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Positioned(
                            left: 15.w,
                            top: 10.h,
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor: AppColors.whiteColor,
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          Positioned(
                            right: 15.w,
                            top: 10.h,
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor: AppColors.whiteColor,
                              child: const Icon(Icons.share),
                            ),
                          ),
                          Obx(
                            () => Positioned(
                              bottom: 10.h,
                              child: Container(
                                alignment: Alignment.center,
                                height: 20.h,
                                width: 390.w,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: hostelFinderController
                                      .currentPageDotIndex.value,
                                  count: 5,
                                  effect: WormEffect(
                                      dotHeight: 5.0.h,
                                      dotWidth: 12.w,
                                      dotColor: AppColors.secondaryColor,
                                      activeDotColor: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Nacary Elite house",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "300 meters from gate F, 4 rooms available",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 50.h,
                        width: 390.w,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Amenities(
                              text: "2 beds",
                              icon: Icons.hotel,
                            ),
                            Amenities(
                              text: "free",
                              icon: Icons.wifi,
                            ),
                            Amenities(
                              text: "hot shower",
                              icon: Icons.hot_tub,
                            ),
                            Amenities(
                              text: "free",
                              icon: Icons.wash,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.nacaryGuestHouse,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("Review (100)"),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          DetailsFilter(text: "All"),
                          SizedBox(
                            width: 10.h,
                          ),
                          DetailsFilter(text: "Positive"),
                          SizedBox(
                            height: 10.h,
                          ),
                          DetailsFilter(text: "Negative"),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: List.generate(10, (index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Klaus M.",
                                        style: TextStyle(fontSize: 14.sp)),
                                    Text(
                                      "5 days ago",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(AppStrings.review,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: List.generate(3, (index) {
                                        return Icon(Icons.star);
                                      }),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text("3.5",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                ),
                                SizedBox(height: 5.h,),
                                Container(color: AppColors.primaryColor, width:390.w, height: 1.h)
                                ,SizedBox(height: 2.h,),
                                
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            height: 72.h,
            width: 390.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ksh 21,000",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 19.sp),
                    ),
                    Text(
                      "Ksh 25,000 for 2 beds",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailsFilter extends StatelessWidget {
  const DetailsFilter({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class Amenities extends StatelessWidget {
  const Amenities({super.key, required this.text, required this.icon});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 25.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(text, style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
