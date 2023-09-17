import 'package:get/get.dart';

import '../../features/hostel_finder/controller/hostel_finder_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HostelFinderController>(() =>HostelFinderController());
  }

}