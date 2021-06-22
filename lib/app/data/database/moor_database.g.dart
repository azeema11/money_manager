// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExpenseData extends DataClass implements Insertable<ExpenseData> {
  final int id;
  final String purpose;
  final double amount;
  final DateTime time;
  ExpenseData(
      {required this.id,
      required this.purpose,
      required this.amount,
      required this.time});
  factory ExpenseData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExpenseData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      purpose: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}purpose'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purpose'] = Variable<String>(purpose);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  ExpenseCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCompanion(
      id: Value(id),
      purpose: Value(purpose),
      amount: Value(amount),
      time: Value(time),
    );
  }

  factory ExpenseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExpenseData(
      id: serializer.fromJson<int>(json['id']),
      purpose: serializer.fromJson<String>(json['purpose']),
      amount: serializer.fromJson<double>(json['amount']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purpose': serializer.toJson<String>(purpose),
      'amount': serializer.toJson<double>(amount),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  ExpenseData copyWith(
          {int? id, String? purpose, double? amount, DateTime? time}) =>
      ExpenseData(
        id: id ?? this.id,
        purpose: purpose ?? this.purpose,
        amount: amount ?? this.amount,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(purpose.hashCode, $mrjc(amount.hashCode, time.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.purpose == this.purpose &&
          other.amount == this.amount &&
          other.time == this.time);
}

class ExpenseCompanion extends UpdateCompanion<ExpenseData> {
  final Value<int> id;
  final Value<String> purpose;
  final Value<double> amount;
  final Value<DateTime> time;
  const ExpenseCompanion({
    this.id = const Value.absent(),
    this.purpose = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
  });
  ExpenseCompanion.insert({
    this.id = const Value.absent(),
    required String purpose,
    required double amount,
    required DateTime time,
  })  : purpose = Value(purpose),
        amount = Value(amount),
        time = Value(time);
  static Insertable<ExpenseData> custom({
    Expression<int>? id,
    Expression<String>? purpose,
    Expression<double>? amount,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purpose != null) 'purpose': purpose,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
    });
  }

  ExpenseCompanion copyWith(
      {Value<int>? id,
      Value<String>? purpose,
      Value<double>? amount,
      Value<DateTime>? time}) {
    return ExpenseCompanion(
      id: id ?? this.id,
      purpose: purpose ?? this.purpose,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCompanion(')
          ..write('id: $id, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $ExpenseTable extends Expense with TableInfo<$ExpenseTable, ExpenseData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExpenseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _purposeMeta = const VerificationMeta('purpose');
  @override
  late final GeneratedTextColumn purpose = _constructPurpose();
  GeneratedTextColumn _constructPurpose() {
    return GeneratedTextColumn(
      'purpose',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedRealColumn amount = _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedDateTimeColumn time = _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, purpose, amount, time];
  @override
  $ExpenseTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'expense';
  @override
  final String actualTableName = 'expense';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExpenseData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExpenseTable createAlias(String alias) {
    return $ExpenseTable(_db, alias);
  }
}

class IncomeData extends DataClass implements Insertable<IncomeData> {
  final int id;
  final String source;
  final double amount;
  final DateTime time;
  IncomeData(
      {required this.id,
      required this.source,
      required this.amount,
      required this.time});
  factory IncomeData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IncomeData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      source: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  IncomeCompanion toCompanion(bool nullToAbsent) {
    return IncomeCompanion(
      id: Value(id),
      source: Value(source),
      amount: Value(amount),
      time: Value(time),
    );
  }

  factory IncomeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return IncomeData(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      amount: serializer.fromJson<double>(json['amount']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<String>(source),
      'amount': serializer.toJson<double>(amount),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  IncomeData copyWith(
          {int? id, String? source, double? amount, DateTime? time}) =>
      IncomeData(
        id: id ?? this.id,
        source: source ?? this.source,
        amount: amount ?? this.amount,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('IncomeData(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(source.hashCode, $mrjc(amount.hashCode, time.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeData &&
          other.id == this.id &&
          other.source == this.source &&
          other.amount == this.amount &&
          other.time == this.time);
}

class IncomeCompanion extends UpdateCompanion<IncomeData> {
  final Value<int> id;
  final Value<String> source;
  final Value<double> amount;
  final Value<DateTime> time;
  const IncomeCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
  });
  IncomeCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    required double amount,
    required DateTime time,
  })  : source = Value(source),
        amount = Value(amount),
        time = Value(time);
  static Insertable<IncomeData> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<double>? amount,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
    });
  }

  IncomeCompanion copyWith(
      {Value<int>? id,
      Value<String>? source,
      Value<double>? amount,
      Value<DateTime>? time}) {
    return IncomeCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $IncomeTable extends Income with TableInfo<$IncomeTable, IncomeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $IncomeTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedTextColumn source = _constructSource();
  GeneratedTextColumn _constructSource() {
    return GeneratedTextColumn(
      'source',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedRealColumn amount = _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedDateTimeColumn time = _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, source, amount, time];
  @override
  $IncomeTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'income';
  @override
  final String actualTableName = 'income';
  @override
  VerificationContext validateIntegrity(Insertable<IncomeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return IncomeData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IncomeTable createAlias(String alias) {
    return $IncomeTable(_db, alias);
  }
}

class LendData extends DataClass implements Insertable<LendData> {
  final int id;
  final String description;
  final double amount;
  final DateTime time;
  LendData(
      {required this.id,
      required this.description,
      required this.amount,
      required this.time});
  factory LendData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LendData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  LendCompanion toCompanion(bool nullToAbsent) {
    return LendCompanion(
      id: Value(id),
      description: Value(description),
      amount: Value(amount),
      time: Value(time),
    );
  }

  factory LendData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LendData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      amount: serializer.fromJson<double>(json['amount']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'amount': serializer.toJson<double>(amount),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  LendData copyWith(
          {int? id, String? description, double? amount, DateTime? time}) =>
      LendData(
        id: id ?? this.id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('LendData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(description.hashCode, $mrjc(amount.hashCode, time.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LendData &&
          other.id == this.id &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.time == this.time);
}

class LendCompanion extends UpdateCompanion<LendData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> amount;
  final Value<DateTime> time;
  const LendCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
  });
  LendCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double amount,
    required DateTime time,
  })  : description = Value(description),
        amount = Value(amount),
        time = Value(time);
  static Insertable<LendData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
    });
  }

  LendCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<double>? amount,
      Value<DateTime>? time}) {
    return LendCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LendCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $LendTable extends Lend with TableInfo<$LendTable, LendData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LendTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedTextColumn description = _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedRealColumn amount = _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedDateTimeColumn time = _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, description, amount, time];
  @override
  $LendTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'lend';
  @override
  final String actualTableName = 'lend';
  @override
  VerificationContext validateIntegrity(Insertable<LendData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LendData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LendData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LendTable createAlias(String alias) {
    return $LendTable(_db, alias);
  }
}

class BorrowData extends DataClass implements Insertable<BorrowData> {
  final int id;
  final String description;
  final double amount;
  final DateTime time;
  BorrowData(
      {required this.id,
      required this.description,
      required this.amount,
      required this.time});
  factory BorrowData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BorrowData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  BorrowCompanion toCompanion(bool nullToAbsent) {
    return BorrowCompanion(
      id: Value(id),
      description: Value(description),
      amount: Value(amount),
      time: Value(time),
    );
  }

  factory BorrowData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BorrowData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      amount: serializer.fromJson<double>(json['amount']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'amount': serializer.toJson<double>(amount),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  BorrowData copyWith(
          {int? id, String? description, double? amount, DateTime? time}) =>
      BorrowData(
        id: id ?? this.id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('BorrowData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(description.hashCode, $mrjc(amount.hashCode, time.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BorrowData &&
          other.id == this.id &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.time == this.time);
}

class BorrowCompanion extends UpdateCompanion<BorrowData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> amount;
  final Value<DateTime> time;
  const BorrowCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
  });
  BorrowCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double amount,
    required DateTime time,
  })  : description = Value(description),
        amount = Value(amount),
        time = Value(time);
  static Insertable<BorrowData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
    });
  }

  BorrowCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<double>? amount,
      Value<DateTime>? time}) {
    return BorrowCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BorrowCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $BorrowTable extends Borrow with TableInfo<$BorrowTable, BorrowData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BorrowTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedTextColumn description = _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedRealColumn amount = _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedDateTimeColumn time = _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, description, amount, time];
  @override
  $BorrowTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'borrow';
  @override
  final String actualTableName = 'borrow';
  @override
  VerificationContext validateIntegrity(Insertable<BorrowData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BorrowData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BorrowData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BorrowTable createAlias(String alias) {
    return $BorrowTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExpenseTable expense = $ExpenseTable(this);
  late final $IncomeTable income = $IncomeTable(this);
  late final $LendTable lend = $LendTable(this);
  late final $BorrowTable borrow = $BorrowTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [expense, income, lend, borrow];
}
