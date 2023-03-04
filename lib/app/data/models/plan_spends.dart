import 'package:drift/drift.dart';

class PlanSpends extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get plan => text()();
  TextColumn get description => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get time => dateTime()();
}
