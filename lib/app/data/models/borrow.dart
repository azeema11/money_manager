import 'package:moor_flutter/moor_flutter.dart';

class Borrow extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get time => dateTime()();
}
