import 'package:moor_flutter/moor_flutter.dart';

class Borrow extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  RealColumn get amount => real()();
  DateTimeColumn get time => dateTime()();
  BoolColumn get status => boolean().withDefault(Constant(false))();
}
