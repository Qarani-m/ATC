import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString nextPage = "/".obs;
  RxString arg = "".obs;

  final authHelper = Get.find<AuthHelper>();

  var email = "";
  var password= "";
  RxBool isSigningIn = false.obs;

  


  void goToSignUp(){
    Get.toNamed(
      parameters:{
        "hostelId":arg.value,
        "nextPage":nextPage.value
      },
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

  void loginAction(){
    isSigningIn.value = true;
    // email = emailController.text;
    // password = passwordController.text;
    email = "emqarani@gmail.com";
    password = "NotPassword!1";
    print("loginAction${arg.value}");
    authHelper.signInUser(email, password,nextPage.value,arg.value);
    isSigningIn.value = false;
  }



  

}