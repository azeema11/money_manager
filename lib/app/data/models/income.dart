import 'package:moor_flutter/moor_flutter.dart';

class Income extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
  TextColumn get type => text()();
}
