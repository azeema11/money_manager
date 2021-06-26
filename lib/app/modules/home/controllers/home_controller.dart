import 'package:get/get.dart';
import 'package:money_manager/app/data/database/moor_database.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  AppDatabase database = AppDatabase();

  void onNavTap(int index) {
    currentIndex = index;
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
