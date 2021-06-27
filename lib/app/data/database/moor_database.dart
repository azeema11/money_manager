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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(lend, lend.status);
          await m.addColumn(borrow, borrow.status);
        }
      });

  Stream<List<ExpenseData>> getYearExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getYearIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<ExpenseData>> getMonthExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.month.equals(date.month))
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getMonthIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.month.equals(date.month))
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<ExpenseData>> getWeekExpense(
          DateTime weekend, DateTime weekstart) =>
      (select(expense)
            ..where((tbl) => tbl.time.day.isSmallerOrEqualValue(weekend.day))
            ..where(
                (tbl) => tbl.time.month.isSmallerOrEqualValue(weekend.month))
            ..where((tbl) => tbl.time.year.isSmallerOrEqualValue(weekend.year))
            ..where((tbl) => tbl.time.day.isBiggerOrEqualValue(weekstart.day))
            ..where(
                (tbl) => tbl.time.month.isBiggerOrEqualValue(weekstart.month))
            ..where((tbl) => tbl.time.year.isBiggerOrEqualValue(weekstart.year))
            ..orderBy([
              (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)
            ]))
          .watch();
  Stream<List<IncomeData>> getWeekIncome(
          DateTime weekend, DateTime weekstart) =>
      (select(income)
            ..where((tbl) => tbl.time.day.isSmallerOrEqualValue(weekend.day))
            ..where(
                (tbl) => tbl.time.month.isSmallerOrEqualValue(weekend.month))
            ..where((tbl) => tbl.time.year.isSmallerOrEqualValue(weekend.year))
            ..where((tbl) => tbl.time.day.isBiggerOrEqualValue(weekstart.day))
            ..where(
                (tbl) => tbl.time.month.isBiggerOrEqualValue(weekstart.month))
            ..where((tbl) => tbl.time.year.isBiggerOrEqualValue(weekstart.year))
            ..orderBy([
              (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)
            ]))
          .watch();

  Stream<List<ExpenseData>> getDayExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
        ..where((tbl) => tbl.time.isSmallerThanValue(date.add(Duration(days: 1))))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<IncomeData>> getDayIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
        ..where((tbl) => tbl.time.isSmallerThanValue(date.add(Duration(days: 1))))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<LendData>> getAllLend(bool status) => (select(lend)
        ..where((tbl) => tbl.status.equals(status))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();
  Stream<List<BorrowData>> getAllBorrow(bool status) => (select(borrow)
        ..where((tbl) => tbl.status.equals(status))
        ..orderBy(
            [(u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)]))
      .watch();

  Future insertNewExpense(ExpenseCompanion newexpense) =>
      into(expense).insert(newexpense);
  Future insertNewIncome(IncomeCompanion newincome) =>
      into(income).insert(newincome);
  Future insertNewBorrow(BorrowCompanion newborrow) =>
      into(borrow).insert(newborrow);
  Future insertNewLend(LendCompanion newlend) => into(lend).insert(newlend);

  Future deleteExpense(ExpenseData expensedata) =>
      delete(expense).delete(expensedata);
  Future deleteIncome(IncomeData incomedata) =>
      delete(income).delete(incomedata);
  Future deleteBorrow(BorrowData borrowdata) =>
      delete(borrow).delete(borrowdata);
  Future deleteLend(LendData lenddata) => delete(lend).delete(lenddata);

  Future updateBorrow(BorrowData borrowdata) =>
      update(borrow).replace(borrowdata);
  Future updateLend(LendData lenddata) => update(lend).replace(lenddata);
}
