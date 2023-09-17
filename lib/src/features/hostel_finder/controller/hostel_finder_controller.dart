import 'package:atc/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HostelFinderController extends GetxController {
  // Text editing and focus management
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchBarFocusNode = FocusNode();
  final RxBool showSearchIcon = true.obs;

  // Filter management
  final RxInt filterActiveIndex = 0.obs;
  final RxInt currentPageDotIndex = 0.obs;

  // Box shadow for UI consistency
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
      ),
    ];
  }

  // Set the active filter index to display that small arrow thingie when presses
  void setFilterActiveIndex(int index) {
    filterActiveIndex.value = index;
  }

  // Navigate to hostel details screen with parameters
  void goToHostelDetails(String hostelId) {
    Get.toNamed("/hostelDetails", parameters: {
      "hostelId": hostelId,
    });
  }

  void goToReview() {
    Get.toNamed(
      "/reviewPage",
    );
  }

  void goBack() {
    Get.back();
  }

}
