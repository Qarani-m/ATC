import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/constants/image_strings.dart';
import 'package:atc/src/features/authentication/controller/login_controller.dart';
import 'package:atc/src/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 390.h,
                  // color: Colors.red,
                  child: Image(
                    image: const AssetImage(AppImages.logo),
                    height: 100.h,
                    width: 100.h,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Hello 👋, welcome",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Sign up to create your atc account",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 50.h,
              ),
             const LoginTextField(hint:"Enter your name", icon: Icons.person,),
              SizedBox(
                height: 20.h,
              ),
              const LoginTextField(hint: "atc@exampl.com",icon: Icons.email,),
              SizedBox(
                height: 10.h,
              ),
              const LoginTextField(hint:"07XX-XXX-XXX", icon: Icons.phone,),
              SizedBox(
                height: 20.h,
              ),
              const LoginTextField(hint: "Enter your password",icon: Icons.password,obscureText: true,),
              SizedBox(
                height: 10.h,
              ),
              
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.whiteColor, fontSize: 15.sp),
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                  onTap: () {signUpController.goToSignIn();},

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: Theme.of(context).textTheme.bodySmall),
                    Text("Sign in",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.accentColor))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    required  this.hint, 
    required this.icon,
    this.obscureText = false,
    super.key,
  });
  final String hint;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(49.r)),
      child: TextField(
          obscuringCharacter: '●',
        obscureText: obscureText,
        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.w, left: 20.w, right: 20.w),
          suffixIcon: Icon(
            icon,
            size: 25.h,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: AppColors.secondaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
