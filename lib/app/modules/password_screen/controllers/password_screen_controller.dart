import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PasswordScreenController extends GetxController {
  //TODO: Implement PasswordScreenController
  final store = GetStorage("Money Manager");
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
