import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hostelfinder_v2/src/features/hostel_finder/screen/hostel_details.dart';

class HostelFinderController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool showsearchIcon = true.obs;
  FocusNode searchBarFocusNode = FocusNode();
  RxInt filterActiveIndex = 0.obs;
  void setFilterActiveIndex(int index){
    filterActiveIndex.value=index;
  }

  void goToHostelDetails(String hostelId){
    Get.to(
      transition:Transition.cupertinoDialog,
      duration:const Duration(milliseconds: 400),
      HostelDetails(), );
  }
}
