import 'package:moor_flutter/moor_flutter.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get purpose => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
}
