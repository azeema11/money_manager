import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<FloatingActionController>(FloatingActionController(),);
  }
}
