// ignore_for_file: must_be_immutable

import 'package:atc/src/constants/text_strings.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_filter.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_hostel.dart';
import 'package:atc/src/features/hostel_finder/widgets/main_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:atc/src/constants/colors.dart';



class HostelFinderHome extends StatelessWidget {
  HostelFinderHome({super.key});
  final hostelFinderController = Get.find<HostelFinderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchField(hostelFinderController: hostelFinderController),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return FiltersHome(
                        hostelFinderController: hostelFinderController,
                        label: AppStrings.hostelFinderHomePageFilters[index],
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
                  children: List.generate(4, (index) {
                    return OneHostel(
                      hostelFinderController: hostelFinderController,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
