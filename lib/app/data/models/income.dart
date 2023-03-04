import 'package:drift/drift.dart';

class Income extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
  TextColumn get type => text()();
}
