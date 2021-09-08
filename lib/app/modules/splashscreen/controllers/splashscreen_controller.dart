import 'dart:async';

import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:money_manager/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  final localStorage = LocalStorage("money_manager");
  late String password;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    if (await localStorage.ready) {
      if (localStorage.getItem("dbPassword") == null) {
        Timer(
          Duration(seconds: 1),
          () {
            Get.offAndToNamed(
              Routes.PASSWORD_SCREEN,
            );
          },
        );
      } else {
        password = localStorage.getItem("dbPassword");
        Timer(
          Duration(seconds: 1),
          () {
            Get.offAndToNamed(
              Routes.HOME,
            );
          },
        );
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
