import 'package:money_manager/app/data/models/borrow.dart';
import 'package:money_manager/app/data/models/expense.dart';
import 'package:money_manager/app/data/models/income.dart';
import 'package:money_manager/app/data/models/lend.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

@UseMoor(tables: [Expense, Income, Lend, Borrow])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  Future<List<ExpenseData>> getAllExpense() => (select(expense)..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)])).get();
  Future<List<IncomeData>> getAllIncome() => (select(income)..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)])).get();
  Future<List<BorrowData>> getAllBorrow() => (select(borrow)..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)])).get();
  Future<List<LendData>> getAllLend() => (select(lend)..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)])).get();

  Stream<List<ExpenseData>> getYearExpense(DateTime date) =>
      (select(expense)
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getYearIncome(DateTime date) =>
      (select(income)
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<ExpenseData>> getMonthExpense(DateTime date) =>
      (select(expense)
      ..where((tbl) => tbl.time.month.equals(date.month))
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getMonthIncome(DateTime date) =>
      (select(income)
      ..where((tbl) => tbl.time.month.equals(date.month))
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  
  Stream<List<ExpenseData>> getWeekExpense(DateTime weekend, DateTime weekstart) =>
      (select(expense)
      ..where((tbl) => tbl.time.day.isSmallerOrEqualValue(weekend.day))
      ..where((tbl) => tbl.time.month.isSmallerOrEqualValue(weekend.month))
      ..where((tbl) => tbl.time.year.isSmallerOrEqualValue(weekend.year))
      ..where((tbl) => tbl.time.day.isBiggerOrEqualValue(weekstart.day))
      ..where((tbl) => tbl.time.month.isBiggerOrEqualValue(weekstart.month))
      ..where((tbl) => tbl.time.year.isBiggerOrEqualValue(weekstart.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getWeekIncome(DateTime weekend, DateTime weekstart) =>
      (select(income)
      ..where((tbl) => tbl.time.day.isSmallerOrEqualValue(weekend.day))
      ..where((tbl) => tbl.time.month.isSmallerOrEqualValue(weekend.month))
      ..where((tbl) => tbl.time.year.isSmallerOrEqualValue(weekend.year))
      ..where((tbl) => tbl.time.day.isBiggerOrEqualValue(weekstart.day))
      ..where((tbl) => tbl.time.month.isBiggerOrEqualValue(weekstart.month))
      ..where((tbl) => tbl.time.year.isBiggerOrEqualValue(weekstart.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<ExpenseData>> getDayExpense(DateTime date) =>
      (select(expense)
      ..where((tbl) => tbl.time.day.equals(date.day))
      ..where((tbl) => tbl.time.month.equals(date.month))
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getDayIncome(DateTime date) =>
      (select(income)
      ..where((tbl) => tbl.time.day.equals(date.day))
      ..where((tbl) => tbl.time.month.equals(date.month))
      ..where((tbl) => tbl.time.year.equals(date.year))
      ..orderBy([(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Future insertNewExpense(ExpenseCompanion newexpense) => into(expense).insert(newexpense);
  Future insertNewIncome(IncomeCompanion newincome) => into(income).insert(newincome);
  Future insertNewBorrow(BorrowCompanion newborrow) => into(borrow).insert(newborrow);
  Future insertNewLend(LendCompanion newlend) => into(lend).insert(newlend);

  Future deleteExpense(ExpenseData expensedata) => delete(expense).delete(expensedata);
  Future deleteIncome(IncomeData incomedata) => delete(income).delete(incomedata);
  Future deleteBorrow(BorrowData borrowdata) => delete(borrow).delete(borrowdata);
  Future deleteLend(LendData lenddata) => delete(lend).delete(lenddata);

  Future updateBorrow(BorrowData borrowdata) => update(borrow).replace(borrowdata);
  Future updateLend(LendData lenddata) => update(lend).replace(lenddata);
}
