import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:async/async.dart';
import 'package:money_manager/app/modules/home/controllers/home_controller.dart';

class TransactionsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  FloatingActionController floatingActionController = Get.find<FloatingActionController>();
  int transactionIndex = 0;
  int typeIndex = 0;
  late AppDatabase database;
  final formKey = GlobalKey<FormState>();
  final FocusNode f1 = new FocusNode();
  final FocusNode f2 = new FocusNode();
  List<ExpenseData> expenseData = [];
  List<IncomeData> incomeData = [];
  List<DateTime> dates = [];
  List<DateTime> months = [];
  List<DateTime> years = [];
  List<List<DateTime>> weeks = [[]];
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime weekend =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime weekstart =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .subtract(Duration(
              days: DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day)
                      .weekday -
                  1));

  void onTap(int index) {
    transactionIndex = index;
    floatingActionController.showFloatingAction = true;
    floatingActionController.update();
    update();
  }

  void changetype(int index) {
    typeIndex = index;
    selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    floatingActionController.showFloatingAction = true;
    floatingActionController.update();
    update();
  }

  void sort(List transactions) {
    expenseData = [];
    incomeData = [];
    expenseData = transactions[0];
    incomeData = transactions[1];
  }

  void daterange() {
    dates = [
      for (DateTime i = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day);
          i.isAfter(DateTime(2021, 06, 19));
          i = i.subtract(Duration(
        days: 1,
      )))
        i
    ];
    print(dates);
  }

  void weekrange() {
    weeks = [
      for (DateTime i = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day);
          i.isAfter(DateTime(2021, 06, 13));
          i = i.subtract(Duration(
        days: i.weekday,
      )))
        [i, i.subtract(Duration(days: i.weekday - 1))]
    ];
    print(weeks);
  }

  void monthrange() {
    months = [
      for (DateTime i = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day);
          i.isAfter(DateTime(2021, 05, 01));
          i = DateTime(i.year, i.month - 1, i.day))
        i
    ];
    print(months);
  }

  void yearrange() {
    years = [
      for (DateTime i = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day);
          i.isAfter(DateTime(2019, 05, 01));
          i = DateTime(i.year - 1, i.month, i.day))
        i
    ];
    print(years);
  }

  double total(List list) {
    double total = 0;
    list.forEach((element) {
      total = total + element.amount;
    });
    return total;
  }

  Stream<List> getMonthlyTransactions() {
    return StreamZip([
      database.getMonthExpense(selectedDate),
      database.getMonthIncome(selectedDate)
    ]);
  }

  Stream<List> getDailyTransactions() {
    return StreamZip([
      database.getDayExpense(selectedDate),
      database.getDayIncome(selectedDate)
    ]);
  }

  Stream<List> getWeeklyTransactions() {
    return StreamZip([
      database.getWeekExpense(weekend, weekstart),
      database.getWeekIncome(weekend, weekstart)
    ]);
  }

  Stream<List> getYearlyTransactions() {
    return StreamZip([
      database.getYearExpense(selectedDate),
      database.getYearIncome(selectedDate)
    ]);
  }

  @override
  void onInit() async {
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
