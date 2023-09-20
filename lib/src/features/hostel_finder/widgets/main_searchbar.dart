import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/hostel_finder/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/constants/colors.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required  this.hostelFinderController,
  });

  final HostelFinderController hostelFinderController;

  @override
  Widget build(BuildContext context) {
    final searchController  = Get.find<SearchBarController>();

    return Container(
            padding: EdgeInsets.only(
                left:10.w),
            alignment: Alignment.centerLeft,
            height: 50.h,
            width: 327.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: hostelFinderController.boxShadow),
            child: Stack(
              children: [
                
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.cancel,
                      size: 25.h,
                      color: AppColors.secondaryColor,
                    ),
                    prefixIcon: Padding(
                      padding:  EdgeInsets.all(10.h),
                      child: SvgPicture.asset(
                                AppImages.searchIcon,
                                color: AppColors.secondaryColor,
                              ),
                    ),
                          
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(color: AppColors.secondaryColor),
                    border: InputBorder.none,
                  ),
                ),
                Positioned(
                    child: GestureDetector(
                      onTap: (){searchController.goToSearchPage();},
                      child: Container(
                        color: Colors.transparent,
                        height: 50.h,
                        width: 327.w,
                      ),
                    ),
                ),
              ],
            ));
      ;
  }
}
