import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:async/async.dart';

class LendingsController extends GetxController {
  AppDatabase database = AppDatabase();
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
    update();
  }

  void onTapStatus(int index) {
    lendingStatus = index;
    if (index == 0) {
      status = false;
    }
    else{
      status = true;
    }
    update();
  }

  Stream<List> getLendings(bool status) {
    return StreamZip(
        [database.getAllLend(status), database.getAllBorrow(status)]);
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
