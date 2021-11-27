import 'package:moor_flutter/moor_flutter.dart';

class PlanSpends extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get plan => text().customConstraint('REFERENCES plan(title)')();
  TextColumn get description => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get time => dateTime()();
}
