import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/hostel_finder/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBarController = Get.find<SearchBarController>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.whiteColor,
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                padding: EdgeInsets.only(left: 20.w),
                alignment: Alignment.centerLeft,
                height: 50.h,
                width: 390.w,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
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
                      )
                    ]),
                child: TextField(
                  onChanged: (val) async {
                    await searchBarController.queryFirestore(val);
                  },
                  controller: searchBarController.searchEditingController,
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        searchBarController.searchEditingController.text = "";
                      },
                      child: Icon(
                        Icons.cancel,
                        size: 25.h,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle:
                        GoogleFonts.poppins(color: AppColors.secondaryColor),
                    border: InputBorder.none,
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Column(
                  children: List.generate(
                      searchBarController.hostelNames.length, (index) {
                return GestureDetector(
                  onTap: () {
                    searchBarController
                        .fetchResult(searchBarController.hostelIds[index]);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50.h,
                    width: 390.w,
                    color: AppColors.whiteColor,
                    child: Text(searchBarController.hostelNames[index]),
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    required this.searchBarController,
    required this.index,
    super.key,
    required this.text,
  });

  final String text;
  final int index;
  final SearchBarController searchBarController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remove decoration and padding properties
      alignment: Alignment.center,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.secondaryColor,
            ),
      ),
    );
  }
}
