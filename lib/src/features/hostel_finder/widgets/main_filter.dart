import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostelfinder_v2/src/constants/colors.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/controller/hostel_finder_controller.dart';

class FiltersHome extends StatelessWidget {
  const FiltersHome({
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
      () {
        final isActive = hostelFinderController.filterActiveIndex.value == activeIndex;
        return GestureDetector(
          onTap: () {
            hostelFinderController.setFilterActiveIndex(activeIndex);
          },
          child: Container(
            alignment: Alignment.center,
            height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            decoration: BoxDecoration(
              boxShadow: hostelFinderController.boxShadow,
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(width: 5.w),
                if (isActive)
                  Align(
                    alignment: Alignment.center, // Center the icon vertically
                    child: Transform.rotate(
                      angle: 270 * (3.1415926535897932 / 180),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0.h, left: 7.h),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15.h,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
