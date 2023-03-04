import 'package:drift/drift.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get purpose => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
  TextColumn get type => text()();
}
