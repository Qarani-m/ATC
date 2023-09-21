// ignore_for_file: must_be_immutable

import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/constants/text_strings.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/features/hostel_finder/controller/search_controller.dart';
import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_filter.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_hostel.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:atc/src/constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HostelFinderHome extends StatelessWidget {
  HostelFinderHome({super.key});
  HostelFinderController hostelFinderController = Get.put(HostelFinderController());
  SearchBarController searchBarcontroller = Get.put(SearchBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: FutureBuilder(
            future: hostelFinderController.fetchAllHostelDataFromFirestore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.accentColor,
                    size: 50,
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("You need some Internet for this to work"),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.w, right: 12.w, top: 60.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchField(),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index) {
                              return FiltersHome(
                                  hostelFinderController:
                                      hostelFinderController,
                                  label: AppStrings
                                      .hostelFinderHomePageFilters[index],
                                  activeIndex: index);
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                hostelFinderController.hostelList.length,
                                (index) {
                              return OneHostel(
                                model: HostelModel(
                                    mainImageUrl: hostelFinderController.hostelList[index].mainImageUrl,
                                    priceForOne: hostelFinderController.hostelList[index].priceForOne ??"3 billion",
                                    name: hostelFinderController.hostelList[index].name ??"Unknown name",
                                    location: hostelFinderController.hostelList[index].location ??"Unknown location",
                                    reviewCount: hostelFinderController.hostelList[index].reviewCount ??"0",
                                    beds: hostelFinderController.hostelList[index].beds ??"1",
                                    hostelId:hostelFinderController.hostelIds[index],
                                    wifiStatus: hostelFinderController.hostelList[index].wifiStatus ??"0"
                                  ),
                                hostelFinderController: hostelFinderController,
                              );
                            }),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){hostelFinderController.signOut();},
                          child: Text("logout"),
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
