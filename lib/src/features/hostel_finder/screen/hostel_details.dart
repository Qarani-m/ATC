import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:atc/src/features/hostel_finder/models/review_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:atc/src/constants/text_strings.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HostelDetails extends StatelessWidget {
  const HostelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final hostelFinderController = Get.find<HostelFinderController>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: FutureBuilder(
          future: hostelFinderController
              .fetchOneHostel(Get.parameters["hostelId"]!),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.accentColor,
                size: 50,
              ));
            } else if (snapshot.hasError) {
              return const Text("ssss");
            } else {
              return HostelDetailsMain(
                  model: hostelFinderController.hostelModel,
                  hostelFinderController: hostelFinderController);
            }
          }),
    );
  }
}

//  HostelDetailsMain(hostelFinderController: hostelFinderController)
class HostelDetailsMain extends StatelessWidget {
  const HostelDetailsMain({
    super.key,
    required this.hostelFinderController,
    required this.model,
    //  this.reviewModel=constReviewModel()
  });

  final HostelFinderController hostelFinderController;
  final HostelModel model;
  // final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                                      borderRadius: BorderRadius.circular(40.r),
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
                                    dotColor: AppColors.primaryColor,
                                    activeDotColor: AppColors.accentColor),
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
                      model.name!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "${model.location}, ${model.type} , ${model.reviewCount} reviews",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Amenities(
                            text: "${model.beds!} beds",
                            icon: Icons.hotel,
                          ),
                          Amenities(
                            text: model.wifiStatus == "1" ? "free" : "No wifi",
                            icon: model.wifiStatus == "1"
                                ? Icons.wifi
                                : Icons.wifi_off,
                          ),
                          Amenities(
                            text: model.type == "bedsitter" &&
                                    model.hotShowerStatus == "1"
                                ? "hot shower"
                                : model.type == "bedsitter" &&
                                        model.hotShowerStatus == "0"
                                    ? "Cold shower"
                                    : null,
                            icon: model.type == "bedsitter" &&
                                    model.hotShowerStatus == "1"
                                ? Icons.hot_tub
                                : model.type == "bedsitter" &&
                                        model.hotShowerStatus == "0"
                                    ? Icons.snowing
                                    : null,
                          ),
                          Amenities(
                            text: model.waterStatus,
                            icon: Icons.wash,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      model.description!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text("Caretaker's Contact"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          size: 30.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 9.0.h),
                          child: Text(
                            model.contactInfo!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 17.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text("Reviews"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        return Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  hostelFinderController
                                      .changeActiveDetailsFilter(index);
                                },
                                child: DetailsFilter(
                                    index: index,
                                    hostelFinderController:
                                        hostelFinderController,
                                    text: AppStrings
                                            .hostelFinderHomeDetailsFilters[
                                        index])),
                            SizedBox(
                              width: 10.h,
                            ),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('reviews')
                          .where('hostelId',
                              isEqualTo: Get.parameters['hostelId'])
                          .orderBy('reviewId',
                              descending:
                                  true) // Order by 'date' field in descending order
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading");
                        }
                        List<QueryDocumentSnapshot> documents =
                            snapshot.data!.docs;
                            hostelFinderController.reviewCount.value=documents.length;
                        return Obx(()=>Column(
                            children: List.generate(documents.length, (index) {
                              String starRating = documents[index]['starRating'];
                              double starRatingValue =double.tryParse(starRating) ?? 0.0;
                              if (hostelFinderController.activeDetailsFilter.value ==1) {
                                if (starRatingValue > 2.5) {
                                  return OneReview(
                                    model: ReviewModel(
                                      date: documents[index]['date'],
                                      starRating: documents[index]['starRating'],
                                      userId: documents[index]['userId'],
                                      writtenReview: documents[index]
                                          ['writtenReview'],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              } else if (hostelFinderController.activeDetailsFilter.value ==2) {
                                if (starRatingValue < 2.5) {
                                  return OneReview(
                                    model: ReviewModel(
                                      date: documents[index]['date'],
                                      starRating: documents[index]['starRating'],
                                      userId: documents[index]['userId'],
                                      writtenReview: documents[index]
                                          ['writtenReview'],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              } else {
                                return OneReview(
                                  model: ReviewModel(
                                    date: documents[index]['date'],
                                    starRating: documents[index]['starRating'],
                                    userId: documents[index]['userId'],
                                    writtenReview: documents[index]
                                        ['writtenReview'],
                                  ),
                                );
                              }
                            }),
                          ),
                        );
                      },
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ksh ${model.priceForOne}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 19.sp),
                  ),
                  Text(
                    "Ksh ${model.priceForTwo} for 2 beds",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              GestureDetector(
                  onTap: () {
                    hostelFinderController
                        .goToReview(Get.parameters['hostelId']!);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      "Leave a review",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.whiteColor, fontSize: 16.sp),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class OneReview extends StatelessWidget {
  const OneReview({super.key, required this.model});
  final ReviewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.userId ?? "vc", style: TextStyle(fontSize: 14.sp)),
              Text(
                model.date ?? "tommorow",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
              model.writtenReview!.isEmpty &&
                      double.parse(model.starRating!) >= 3.0
                  ? "Impressed"
                  : model.writtenReview!.isEmpty &&
                          double.parse(model.starRating!) < 3.0
                      ? "Not impressed"
                      : model.writtenReview ?? "Some written review",
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(
            height: 5.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: List.generate(1, (index) {
                  return const Icon(Icons.star);
                }),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(model.starRating ?? "0.0",
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(color: AppColors.primaryColor, width: 390.w, height: 1.h),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}

class DetailsFilter extends StatelessWidget {
  const DetailsFilter(
      {required this.hostelFinderController,
      required this.index,
      super.key,
      required this.text});
  final String text;

  final int index;
  final HostelFinderController hostelFinderController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: index == hostelFinderController.activeDetailsFilter.value
                ? AppColors.accentColor
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: index ==
                              hostelFinderController.activeDetailsFilter.value
                          ? AppColors.whiteColor
                          : AppColors.secondaryColor,
                    )),
          ],
        ),
      ),
    );
  }
}

class Amenities extends StatelessWidget {
  const Amenities({super.key, required this.text, required this.icon});
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(text!, style: Theme.of(context).textTheme.bodySmall)
      ],
    );
  }
}
