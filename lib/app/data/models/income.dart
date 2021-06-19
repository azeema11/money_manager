import 'package:moor_flutter/moor_flutter.dart';

class Income extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get time => dateTime()();
}
