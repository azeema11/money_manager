import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTransactionController>(
      () => AddTransactionController(),
    );
  }
}
