import 'package:get/get.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:async/async.dart';

class TransactionsController extends GetxController {
  int transactionIndex = 0;
  int typeIndex = 0;
  AppDatabase database = AppDatabase();
  List<ExpenseData> expenseData = [];
  List<IncomeData> incomeData = [];
  List<DateTime> dates = [];
  List<DateTime> months = [];
  List<DateTime> years = [];
  List<List<DateTime>> weeks = [[]];
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime weekend = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime weekstart = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).weekday - 1));

  void onTap(int index) {
    transactionIndex = index;
    update();
  }

  void changetype(int index) {
    typeIndex = index;
    selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
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
    /*database.insertNewExpense(ExpenseData(
        id: 6,
        purpose: "Food",
        amount: 100,
        time: DateTime.now().subtract(Duration(days: 765))));
    database.insertNewIncome(IncomeData(
        id: 6,
        source: "Salary",
        amount: 1000,
        time: DateTime.now().subtract(Duration(days: 765))));*/
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
