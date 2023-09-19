import 'package:atc/src/features/authentication/controller/login_controller.dart';
import 'package:atc/src/features/authentication/controller/signup_controller.dart';
import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:atc/src/features/hostel_finder/controller/submit_review.dart';
import 'package:get/get.dart';

import '../../features/hostel_finder/controller/hostel_finder_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SubmitReviewController>(() =>SubmitReviewController());
    Get.lazyPut<HostelFinderController>(() =>HostelFinderController());
    Get.lazyPut<LoginController>(() =>LoginController());
    Get.lazyPut<SignUpController>(() =>SignUpController());
    Get.lazyPut<AuthHelper>(() =>AuthHelper());
    // Get.lazyPut<SubmitReviewController>(() =>SubmitReviewController());
  }

}