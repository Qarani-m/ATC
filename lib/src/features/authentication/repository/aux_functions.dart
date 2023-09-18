import 'package:atc/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AuthAuxFunctons{
    static void showSnackBar(String title, String message) {
    Get.snackbar(
      duration:message.contains("unknown")? Duration(seconds:10):Duration(seconds: 3),
      icon: const Icon(Icons.warning_amber_rounded, color: AppColors.primaryColor,),
        colorText: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        title,
        message);
  }
}
