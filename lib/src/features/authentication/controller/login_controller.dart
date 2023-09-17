import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = "";
  var password= "";


  void goToSignUp(){
    Get.toNamed(
      "/signUp"
    );
  }

    void goToForgotPassword(){
    Get.toNamed(
      "/forgotPassword"
    );
  }


  void resetPassword(){
    
  }



  

}