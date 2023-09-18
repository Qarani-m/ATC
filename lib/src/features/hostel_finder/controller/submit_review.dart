import 'package:atc/src/features/hostel_finder/repository/submitreview_helper.dart';
import 'package:atc/src/features/hostel_finder/repository/aux_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SubmitReviewController extends GetxController{
  TextEditingController writtenReviewController  = TextEditingController();
  RxDouble starRating = 1.0.obs;
  RxString writtenReview = "".obs;
  RxString userId = "".obs;
  RxString hostelId = "".obs;
  RxString hostelName = "".obs;
  RxBool isSubmiting= false.obs;

  Future<void> submitReview()async{
    isSubmiting.value =true;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('userDetails');
    await SubmitReview.submitReview(starRating.value, writtenReview.value, items![6],hostelId.value);
    isSubmiting.value =false;
    HostelFinderAuxFunctions.showSnackBar("Review submitted succesfully","Your review for $hostelName has been submitted succesfully !");
  }
   void goToSignIn(String hostelId,){
    Get.toNamed(
      "/login",
      parameters:{
        "hostelId":hostelId,
        "nextPage":"/reviewPage"
      }
    
    );
  }
}


