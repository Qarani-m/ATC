import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var email = "";
  var password= "";
  var name= "";
  var phone= "";


  void goToSignIn(){
    print("sss");
    Get.toNamed(
      "/login"
    );
  }


}