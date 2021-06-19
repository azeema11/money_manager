import 'package:moor_flutter/moor_flutter.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get purpose => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get time => dateTime()();
}
