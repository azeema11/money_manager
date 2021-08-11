import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/data/database/moor_database.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  AppDatabase database = AppDatabase();
  FloatingActionController floatingActionController =
      Get.find<FloatingActionController>();

  void onNavTap(int index) {
    currentIndex = index;
    floatingActionController.showFloatingAction = true;
    floatingActionController.update();
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
