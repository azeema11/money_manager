import 'package:drift/drift.dart';

class Plan extends Table {
  TextColumn get title => text()();
  IntColumn get allocation => integer()();
  DateTimeColumn get time => dateTime()();

  @override
  Set<Column> get primaryKey => {title, time};
}
