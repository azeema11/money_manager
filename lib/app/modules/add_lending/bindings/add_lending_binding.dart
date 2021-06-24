import 'package:get/get.dart';

import '../controllers/add_lending_controller.dart';

class AddLendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLendingController>(
      () => AddLendingController(),
    );
  }
}
