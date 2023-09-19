import 'dart:math';

import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:flutter/material.dart';
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
    // email = emailController.text;
    // password = passwordController.text;
    // name = nameController.text;
    // phone = phoneController.text;
    email = "emqarani${Random().nextInt(100000).toString()}@gmail.com";
    password = "NotPassword!1";
    name = "martin";
    phone = "0704847676";


    await authHelper.signUp(name, email, phone, password, nextPage.value,hostelId.value);
    isSigningIn.value = false;

  } 

  void goToSignIn(){
    Get.toNamed(
      "/login"
    );
  }


}