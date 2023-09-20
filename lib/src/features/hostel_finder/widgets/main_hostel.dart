import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atc/src/features/hostel_finder/controller/hostel_finder_controller.dart';
import 'package:atc/src/constants/colors.dart';

class OneHostel extends StatelessWidget {
  OneHostel(
      {super.key, required this.hostelFinderController, required this.model});
  final HostelFinderController hostelFinderController;
  final HostelModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hostelFinderController.goToHostelDetails(model.hostelId!);
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
                    model.name!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "${model.location!}, ${model.reviewCount!} reviews",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ksh ${model.priceForOne!}/sem",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          model.wifiStatus == "1"
                              ? const Icon(Icons.wifi)
                              : const Icon(Icons.wifi_off),
                          SizedBox(width: 15.w),
                          const Icon(
                            Icons.hotel,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            model.beds!,
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
