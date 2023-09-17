import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/constants/image_strings.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/controller/hostel_finder_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required  this.hostelFinderController,
  });

  final HostelFinderController hostelFinderController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
            padding: EdgeInsets.only(
                left: !hostelFinderController.searchBarFocusNode.hasFocus &&
                        !hostelFinderController.searchController.text
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
                boxShadow: hostelFinderController.boxShadow),
            child: TextField(
              controller: hostelFinderController.searchController,
              focusNode: hostelFinderController.searchBarFocusNode,
              cursorColor: AppColors.secondaryColor,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.cancel,
                  size: 25.h,
                  color: AppColors.secondaryColor,
                ),
                prefixIcon: hostelFinderController.showSearchIcon.value &&
                        !hostelFinderController.searchBarFocusNode.hasFocus &&
                        !hostelFinderController.searchController.text
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
}
