import 'package:atc/src/features/authentication/controller/login_controller.dart';
import 'package:atc/src/features/authentication/controller/signup_controller.dart';
import 'package:get/get.dart';

import '../../features/hostel_finder/controller/hostel_finder_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HostelFinderController>(() =>HostelFinderController());
    Get.lazyPut<LoginController>(() =>LoginController());
    Get.lazyPut<SignUpController>(() =>SignUpController());
  }

}