import 'package:moor_flutter/moor_flutter.dart';

class Lend extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
}
