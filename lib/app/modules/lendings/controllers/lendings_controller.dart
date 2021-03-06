import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:async/async.dart';
import 'package:money_manager/app/modules/home/controllers/home_controller.dart';

class LendingsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  FloatingActionController floatingActionController = Get.find<FloatingActionController>();
  late AppDatabase database;
  final formKey = GlobalKey<FormState>();
  final FocusNode f1 = new FocusNode();
  final FocusNode f2 = new FocusNode();
  int lendingIndex = 0;
  int lendingStatus = 0;
  bool status = false;
  List<LendData> lendData = [];
  List<BorrowData> borrowData = [];

  void sort(List lendings) {
    lendData = [];
    borrowData = [];
    lendData = lendings[0];
    borrowData = lendings[1];
  }

  void onTapLending(int index) {
    lendingIndex = index;
    floatingActionController.showFloatingAction = true;
    floatingActionController.update();
    update();
  }

  void onTapStatus(int index) {
    lendingStatus = index;
    if (index == 0) {
      status = false;
    } else {
      status = true;
    }
    floatingActionController.showFloatingAction = true;
    floatingActionController.update();
    update();
  }

  Stream<List> getLendings(bool status) {
    return StreamZip(
        [database.getAllLend(status), database.getAllBorrow(status)]);
  }

  double total(List list) {
    double total = 0;
    list.forEach((element) {
      total = total + element.amount;
    });
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    database = homeController.database;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
