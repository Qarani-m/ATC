import 'dart:math';

import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isSigningIn = false.obs;

  final authHelper = Get.find<AuthHelper>();

  var email = "";
  var password= "";
  var name= "";
  var phone= "";
  RxString nextPage = "/".obs;
  RxString hostelId = "".obs;

  Future<void> signUpAction()async{
    isSigningIn.value = true;
    email = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    phone = phoneController.text;
    String inputValidationResults = InputValidation.validationResults(name, email, phone, password);

  if (inputValidationResults != "pass") {
    _warningSnackBar("Invalid input", inputValidationResults);
    return;
  } else {
    try{
     isSigningIn.value = true;

     await authHelper.signUp(name, email, phone, password, nextPage.value,hostelId.value);
    isSigningIn.value = false;
    }catch(e){
      isSigningIn.value = false;
    }
  }


    await authHelper.signUp(name, email, phone, password, nextPage.value,hostelId.value);
    isSigningIn.value = false;

  } 

   _warningSnackBar(String title, String message) {
    return Get.snackbar(
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin:EdgeInsets.only(bottom: 5.h),
        maxWidth:327.w,
        title,
        message,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor.withOpacity(0.8));
  }

  void goToSignIn(){
    Get.toNamed(
      "/login"
    );
  }


}


class InputValidation {
  static bool isValidName(String name) {
    return name.length >= 3 && RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }
  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }
  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^07\d{8}$').hasMatch(phoneNumber);
  }
  static String validationResults(
      String name, String email, String phoneNumber, String password) {
    String message = "";
    if (!isValidName(name)) {
      message = "Invalid name! Name should be have atleast 3 characters";
    } else if (!isValidEmail(email)) {
      message = "Invalid email!";
    } else if (!isValidPassword(password)) {
      message = "Invalid Password! password should have atleast 8 characters";
    } else if (!isValidPhoneNumber(phoneNumber)) {
      message = "Inavalid phone number";
    } else {
      message = "pass";
    }
    return message;
  }
}
