import 'dart:io';

import 'package:drift/native.dart';
import 'package:money_manager/app/data/models/borrow.dart';
import 'package:money_manager/app/data/models/expense.dart';
import 'package:money_manager/app/data/models/income.dart';
import 'package:money_manager/app/data/models/lend.dart';
import 'package:money_manager/app/data/models/plan.dart';
import 'package:money_manager/app/data/models/plan_spends.dart';
import 'package:money_manager/app/data/transaction_types/expense_types.dart';
import 'package:money_manager/app/data/transaction_types/income_types.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
part 'moor_database.g.dart';

@DriftDatabase(tables: [Expense, Income, Lend, Borrow, Plan, PlanSpends])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          (_openConnection()),
        );

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 2) {
            await customStatement(
                '''ALTER TABLE income ADD type TEXT NOT NULL DEFAULT '${IncomeTypeName[IncomeTypes.allowance]}' ''');
            await customStatement(
                '''ALTER TABLE expense ADD type TEXT NOT NULL DEFAULT '${ExpenseTypeName[ExpenseTypes.food]}' ''');
          }
          if (from == 4) {
            await m.drop(plan);
            await m.drop(planSpends);
            await m.createTable(plan);
            await m.createTable(planSpends);
          }
        },
      );

  Stream<List<ExpenseData>> getYearExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();
  Stream<List<IncomeData>> getYearIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();

  Stream<List<ExpenseData>> getMonthExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.month.equals(date.month))
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();
  Stream<List<IncomeData>> getMonthIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.month.equals(date.month))
        ..where((tbl) => tbl.time.year.equals(date.year))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();

  Stream<List<ExpenseData>> getWeekExpense(
          DateTime weekend, DateTime weekStart) =>
      (select(expense)
            ..where(
              (tbl) => tbl.time.isSmallerThanValue(
                weekend.add(
                  Duration(days: 1),
                ),
              ),
            )
            ..where((tbl) => tbl.time.isBiggerOrEqualValue(weekStart))
            ..orderBy(
              [
                (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)
              ],
            ))
          .watch();
  Stream<List<IncomeData>> getWeekIncome(
          DateTime weekend, DateTime weekStart) =>
      (select(income)
            ..where(
              (tbl) => tbl.time.isSmallerThanValue(
                weekend.add(
                  Duration(days: 1),
                ),
              ),
            )
            ..where((tbl) => tbl.time.isBiggerOrEqualValue(weekStart))
            ..orderBy(
              [
                (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc)
              ],
            ))
          .watch();

  Stream<List<ExpenseData>> getDayExpense(DateTime date) => (select(expense)
        ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
        ..where(
          (tbl) => tbl.time.isSmallerThanValue(
            date.add(
              Duration(days: 1),
            ),
          ),
        )
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();
  Stream<List<IncomeData>> getDayIncome(DateTime date) => (select(income)
        ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
        ..where(
          (tbl) => tbl.time.isSmallerThanValue(
            date.add(
              Duration(days: 1),
            ),
          ),
        )
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();

  Stream<List<LendData>> getAllLend(bool status) => (select(lend)
        ..where((tbl) => tbl.status.equals(status))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();
  Stream<List<BorrowData>> getAllBorrow(bool status) => (select(borrow)
        ..where((tbl) => tbl.status.equals(status))
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();
  Stream<List<PlanData>> getAllPlans(DateTime date) {
    return (select(plan)
          ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
          ..where(
            (tbl) => tbl.time.isSmallerThanValue(
              DateTime(date.year, date.month + 1),
            ),
          )
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
            ],
          ))
        .watch();
  }

  Stream<List<PlanSpend>> getAllPlanSpends(DateTime date) => (select(planSpends)
        ..where((tbl) => tbl.time.isBiggerOrEqualValue(date))
        ..where(
          (tbl) => tbl.time.isSmallerThanValue(
            DateTime(date.year, date.month + 1),
          ),
        )
        ..orderBy(
          [
            (u) => OrderingTerm(expression: u.time, mode: OrderingMode.desc),
          ],
        ))
      .watch();

  Future insertNewExpense(ExpenseCompanion newexpense) =>
      into(expense).insert(newexpense);
  Future insertNewIncome(IncomeCompanion newincome) =>
      into(income).insert(newincome);
  Future insertNewBorrow(BorrowCompanion newborrow) =>
      into(borrow).insert(newborrow);
  Future insertNewLend(LendCompanion newlend) => into(lend).insert(newlend);
  Future insertNewPlan(PlanCompanion newplan) => into(plan).insert(newplan);
  Future insertNewPlanSpends(PlanSpendsCompanion newplanspends) =>
      into(planSpends).insert(newplanspends);

  Future deleteExpense(ExpenseData expensedata) =>
      delete(expense).delete(expensedata);
  Future deleteIncome(IncomeData incomedata) =>
      delete(income).delete(incomedata);
  Future deleteBorrow(BorrowData borrowdata) =>
      delete(borrow).delete(borrowdata);
  Future deleteLend(LendData lenddata) => delete(lend).delete(lenddata);
  Future deletePlan(PlanData plandata) => delete(plan).delete(plandata);
  Future deletePlanSpends(PlanSpend planspends) =>
      delete(planSpends).delete(planspends);

  Future groupDeletePlanSpends(String plan, DateTime date) =>
      (delete(planSpends)
            ..where((tbl) => tbl.time.month.equals(date.month))
            ..where((tbl) => tbl.time.year.equals(date.year))
            ..where((tbl) => tbl.plan.equals(plan)))
          .go();

  Future updateBorrow(BorrowData borrowdata) =>
      update(borrow).replace(borrowdata);
  Future updateLend(LendData lenddata) => update(lend).replace(lenddata);
  Future updatePlan(PlanData plandata) => update(plan).replace(plandata);
  Future updatePlanSpends(PlanSpend planspends) =>
      update(planSpends).replace(planspends);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: true,
    );
  });
}
