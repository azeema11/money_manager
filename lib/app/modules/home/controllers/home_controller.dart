import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

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
