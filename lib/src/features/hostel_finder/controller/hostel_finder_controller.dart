import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:atc/src/features/hostel_finder/repository/aux_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostelFinderController extends GetxController {
  // Text editing and focus management
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchBarFocusNode = FocusNode();
  final RxBool showSearchIcon = true.obs;

  AuthHelper authHelperController = Get.put(AuthHelper());

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

  Future<void> goToReview(String hostelId) async {
    User? user = await authHelperController.getCurrentUser();
    if (user != null) {
      Get.toNamed(
        parameters: {"hostelId": hostelId, "hostelName": "Nacary hostel"},
        "/reviewPage",
      );
    } else {
      HostelFinderAuxFunctions.showBottomSheet(hostelId);
    }
  }

Future<HostelModel> fetchOneHostel(String hostelId) async {
  print(hostelId);
  
  // Use await with Future.delayed to introduce a 10-second delay
  await Future.delayed(Duration(seconds: 10));

  // Now you can return your hostel model or perform other operations
  HostelModel hostel = HostelModel();
  return hostel;
}







  void goBack() {
    Get.back();
  }
}
