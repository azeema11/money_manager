import 'package:get/get.dart';

import '../controllers/lendings_controller.dart';

class LendingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LendingsController>(LendingsController(),);
  }
}
