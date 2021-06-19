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

  Future<List<ExpenseData>> getAllExpense() => select(expense).get();
  Future<List<IncomeData>> getAllIncome() => select(income).get();
  Future<List<BorrowData>> getAllBorrow() => select(borrow).get();
  Future<List<LendData>> getAllLend() => select(lend).get();

  Stream<List<ExpenseData>> getMonthExpense(int month) =>
      (select(expense)..where((tbl) => tbl.time.month.equals(month))).watch();
  Stream<List<IncomeData>> getMonthIncome(int month) =>
      (select(income)..where((tbl) => tbl.time.month.equals(month))).watch();

  Future insertNewExpense(ExpenseData newexpense) => into(expense).insert(newexpense);
  Future insertNewIncome(IncomeData newincome) => into(income).insert(newincome);
  Future insertNewBorrow(BorrowData newborrow) => into(borrow).insert(newborrow);
  Future insertNewLend(LendData newlend) => into(lend).insert(newlend);

  Future deleteExpense(ExpenseData expensedata) => delete(expense).delete(expensedata);
  Future deleteIncome(IncomeData incomedata) => delete(income).delete(incomedata);
  Future deleteBorrow(BorrowData borrowdata) => delete(borrow).delete(borrowdata);
  Future deleteLend(LendData lenddata) => delete(lend).delete(lenddata);
}
