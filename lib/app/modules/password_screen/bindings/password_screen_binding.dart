import 'package:get/get.dart';

import '../controllers/password_screen_controller.dart';

class PasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordScreenController>(
      () => PasswordScreenController(),
    );
  }
}
