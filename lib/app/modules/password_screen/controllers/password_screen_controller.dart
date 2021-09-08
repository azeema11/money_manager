import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class PasswordScreenController extends GetxController {
  //TODO: Implement PasswordScreenController
  final localStorage = LocalStorage("money_manager");
  bool validate = false;
  bool confirm = false;
  late String password;

  final count = 0.obs;
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
  void increment() => count.value++;
}
