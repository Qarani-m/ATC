import 'package:atc/src/features/authentication/screens/welcome.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  LiquidController liquidController = LiquidController();
  RxInt activeDotIndex = 0.obs;

  void nextButtonPresses() {
    if (liquidController.currentPage == 2) {
      Get.to(const Welcome(),
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 400));
    }
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage);
  }
  void skipButtonPressed(){
      liquidController.jumpToPage(page: 2);
  }

  void goToLogin()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstimer", false);
    Get.toNamed('/login');
  }

    void goToSignUp()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstimer", false);
    Get.toNamed('/signUp');
  }
}