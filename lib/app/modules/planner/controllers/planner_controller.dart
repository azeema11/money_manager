import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/modules/home/controllers/home_controller.dart';

class PlannerController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late AppDatabase database;
  final formKey = GlobalKey<FormState>();
  List<PlanData> plans = [];
  List<PlanSpend> planSpends = [];
  Map<String, int> balances = {};
  List<DateTime> months = [];
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 1);

  Stream<List> getPlansAndSpends() {
    return StreamZip([
      database.getAllPlans(selectedDate),
      database.getAllPlanSpends(selectedDate),
    ]);
  }

  void monthrange() {
    months = [
      for (DateTime i =
              DateTime(DateTime.now().year, DateTime.now().month + 1, 1);
          i.isAfter(DateTime(2021, 05, 01));
          i = DateTime(i.year, i.month - 1, 1),)
        i
    ];
  }

  void sort(List plansAndSpends) {
    print(plansAndSpends);
    plans = plansAndSpends[0];
    planSpends = plansAndSpends[1];
    plans.sort((a, b) => a.time.compareTo(b.time));
    planSpends.sort((a, b) => a.time.compareTo(b.time));
    plans.forEach((element) {
      balances[element.title] = element.allocation;
    });
    planSpends.forEach((element) {
      balances[element.plan] = balances[element.plan]! - element.amount;
    });
  }

  @override
  void onInit() {
    super.onInit();
    database = homeController.database;
    monthrange();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
