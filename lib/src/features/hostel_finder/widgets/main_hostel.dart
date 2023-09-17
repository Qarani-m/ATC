import 'package:atc/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/constants/colors.dart';


class OneHostel extends StatelessWidget {
  OneHostel({super.key, required this.hostelFinderController});
  final HostelFinderController hostelFinderController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hostelFinderController.goToHostelDetails("hostelId");
      },
      child: Column(
        children: [
          Container(
              width: 390.w,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: hostelFinderController.boxShadow),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: hostelFinderController.boxShadow,
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
}
