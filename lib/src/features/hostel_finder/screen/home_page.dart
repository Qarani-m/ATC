// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/constants/image_strings.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/controller/hostel_finder_controller.dart';

class HostelFinderHome extends StatelessWidget {
  HostelFinderHome({super.key});

  HostelFinderController _hostelFinderController =
      Get.put(HostelFinderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchField(hostelFinderController: _hostelFinderController),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    List filters = ["Popular", "Price", "Location", "Type"];
                    return FiltersHome(hostelFinderController: _hostelFinderController,
                        label: filters[index], activeIndex: index);
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
                    
                    4, (index) {
                    List filters = ["Popular", "Price", "Location", "Type"];
                    return OneHostel(hostelFinderController: _hostelFinderController,);
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

class OneHostel extends StatelessWidget {
   OneHostel({
    super.key,
    required this.hostelFinderController
  });
  final HostelFinderController hostelFinderController;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){ hostelFinderController.goToHostelDetails("hostelId");},
      child: Column(
        children: [
          Container(
              height: 280.h,
              width: 327.w,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: boxShadow),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: boxShadow,
                        image: const DecorationImage(
                            image: AssetImage(AppImages.image1),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Nacary Elite house",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "300 meters from gate F, 4 rooms available",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ksh 21,000 / sem",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.wifi_off),
                          SizedBox(width: 15.w),
                          const Icon(
                            Icons.hotel,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "2",
                            style: GoogleFonts.poppins(
                              color: AppColors.secondaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.secondaryColor.withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4.0,
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(-5, 0),
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(5, 0),
      ), //BoxShadow
    ];
  }
}

class FiltersHome extends StatelessWidget {
    
  FiltersHome({
  required this.hostelFinderController,
  required this.activeIndex, 
  required this.label,
  super.key, 
  
  });

  final String label;
  final int activeIndex;
  final HostelFinderController hostelFinderController;


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          hostelFinderController.setFilterActiveIndex(activeIndex);
        },
        child: Container(
          alignment: Alignment.center,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(color: AppColors.secondaryColor),
              ),
              SizedBox(width: 5.w),
              Align(
                alignment: Alignment.center, // Center the icon vertically
                child: hostelFinderController.filterActiveIndex == activeIndex
                    ? Transform.rotate(
                        angle: 270 * (3.1415926535897932 / 180),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5.0.h, left: 7.h),
                          child: Icon(Icons.arrow_back_ios,
                              size: 15.h, color: AppColors.secondaryColor),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.secondaryColor.withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4.0,
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(-5, 0),
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(5, 0),
      ), //BoxShadow
    ];
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required HostelFinderController hostelFinderController,
  }) : _hostelFinderController = hostelFinderController;

  final HostelFinderController _hostelFinderController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
            padding: EdgeInsets.only(
                left: !_hostelFinderController.searchBarFocusNode.hasFocus &&
                        !_hostelFinderController.searchController.text
                            .trim()
                            .isNotEmpty
                    ? 5.w
                    : 20.w),
            alignment: Alignment.centerLeft,
            height: 50.h,
            width: 327.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: boxShadow),
            child: TextField(
              controller: _hostelFinderController.searchController,
              focusNode: _hostelFinderController.searchBarFocusNode,
              cursorColor: AppColors.secondaryColor,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.cancel,
                  size: 25.h,
                  color: AppColors.secondaryColor,
                ),
                prefixIcon: _hostelFinderController.showsearchIcon.value &&
                        !_hostelFinderController.searchBarFocusNode.hasFocus &&
                        !_hostelFinderController.searchController.text
                            .trim()
                            .isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.all(
                            10.h), // Adjust the padding to control the size
                        child: Container(
                            child: SvgPicture.asset(
                          AppImages.searchIcon,
                          color: AppColors.secondaryColor,
                        )),
                      )
                    : null,
                hintText: "Search",
                hintStyle: GoogleFonts.poppins(color: AppColors.secondaryColor),
                border: InputBorder.none,
              ),
            ));
      },
    );
  }

  List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.secondaryColor.withOpacity(0.02),
        offset: const Offset(0, 5),
        blurRadius: 5.0,
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(-5, 0),
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(5, 0),
      ), //BoxShadow
    ];
  }
}
