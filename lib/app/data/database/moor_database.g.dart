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
  final String type;
  ExpenseData(
      {required this.id,
      required this.purpose,
      required this.amount,
      required this.time,
      required this.type});
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
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purpose'] = Variable<String>(purpose);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    map['type'] = Variable<String>(type);
    return map;
  }

  ExpenseCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCompanion(
      id: Value(id),
      purpose: Value(purpose),
      amount: Value(amount),
      time: Value(time),
      type: Value(type),
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
      type: serializer.fromJson<String>(json['type']),
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
      'type': serializer.toJson<String>(type),
    };
  }

  ExpenseData copyWith(
          {int? id,
          String? purpose,
          double? amount,
          DateTime? time,
          String? type}) =>
      ExpenseData(
        id: id ?? this.id,
        purpose: purpose ?? this.purpose,
        amount: amount ?? this.amount,
        time: time ?? this.time,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(purpose.hashCode,
          $mrjc(amount.hashCode, $mrjc(time.hashCode, type.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.purpose == this.purpose &&
          other.amount == this.amount &&
          other.time == this.time &&
          other.type == this.type);
}

class ExpenseCompanion extends UpdateCompanion<ExpenseData> {
  final Value<int> id;
  final Value<String> purpose;
  final Value<double> amount;
  final Value<DateTime> time;
  final Value<String> type;
  const ExpenseCompanion({
    this.id = const Value.absent(),
    this.purpose = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
    this.type = const Value.absent(),
  });
  ExpenseCompanion.insert({
    this.id = const Value.absent(),
    required String purpose,
    required double amount,
    required DateTime time,
    required String type,
  })  : purpose = Value(purpose),
        amount = Value(amount),
        time = Value(time),
        type = Value(type);
  static Insertable<ExpenseData> custom({
    Expression<int>? id,
    Expression<String>? purpose,
    Expression<double>? amount,
    Expression<DateTime>? time,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purpose != null) 'purpose': purpose,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
      if (type != null) 'type': type,
    });
  }

  ExpenseCompanion copyWith(
      {Value<int>? id,
      Value<String>? purpose,
      Value<double>? amount,
      Value<DateTime>? time,
      Value<String>? type}) {
    return ExpenseCompanion(
      id: id ?? this.id,
      purpose: purpose ?? this.purpose,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      type: type ?? this.type,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCompanion(')
          ..write('id: $id, ')
          ..write('purpose: $purpose, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $ExpenseTable extends Expense with TableInfo<$ExpenseTable, ExpenseData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ExpenseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _purposeMeta = const VerificationMeta('purpose');
  late final GeneratedColumn<String?> purpose = GeneratedColumn<String?>(
      'purpose', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, purpose, amount, time, type];
  @override
  String get aliasedName => _alias ?? 'expense';
  @override
  String get actualTableName => 'expense';
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
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
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
  final String type;
  IncomeData(
      {required this.id,
      required this.source,
      required this.amount,
      required this.time,
      required this.type});
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
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    map['type'] = Variable<String>(type);
    return map;
  }

  IncomeCompanion toCompanion(bool nullToAbsent) {
    return IncomeCompanion(
      id: Value(id),
      source: Value(source),
      amount: Value(amount),
      time: Value(time),
      type: Value(type),
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
      type: serializer.fromJson<String>(json['type']),
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
      'type': serializer.toJson<String>(type),
    };
  }

  IncomeData copyWith(
          {int? id,
          String? source,
          double? amount,
          DateTime? time,
          String? type}) =>
      IncomeData(
        id: id ?? this.id,
        source: source ?? this.source,
        amount: amount ?? this.amount,
        time: time ?? this.time,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('IncomeData(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(source.hashCode,
          $mrjc(amount.hashCode, $mrjc(time.hashCode, type.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeData &&
          other.id == this.id &&
          other.source == this.source &&
          other.amount == this.amount &&
          other.time == this.time &&
          other.type == this.type);
}

class IncomeCompanion extends UpdateCompanion<IncomeData> {
  final Value<int> id;
  final Value<String> source;
  final Value<double> amount;
  final Value<DateTime> time;
  final Value<String> type;
  const IncomeCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
    this.type = const Value.absent(),
  });
  IncomeCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    required double amount,
    required DateTime time,
    required String type,
  })  : source = Value(source),
        amount = Value(amount),
        time = Value(time),
        type = Value(type);
  static Insertable<IncomeData> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<double>? amount,
    Expression<DateTime>? time,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
      if (type != null) 'type': type,
    });
  }

  IncomeCompanion copyWith(
      {Value<int>? id,
      Value<String>? source,
      Value<double>? amount,
      Value<DateTime>? time,
      Value<String>? type}) {
    return IncomeCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      type: type ?? this.type,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $IncomeTable extends Income with TableInfo<$IncomeTable, IncomeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $IncomeTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<String?> source = GeneratedColumn<String?>(
      'source', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, source, amount, time, type];
  @override
  String get aliasedName => _alias ?? 'income';
  @override
  String get actualTableName => 'income';
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
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
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
  final bool status;
  LendData(
      {required this.id,
      required this.description,
      required this.amount,
      required this.time,
      required this.status});
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
      status: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    map['status'] = Variable<bool>(status);
    return map;
  }

  LendCompanion toCompanion(bool nullToAbsent) {
    return LendCompanion(
      id: Value(id),
      description: Value(description),
      amount: Value(amount),
      time: Value(time),
      status: Value(status),
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
      status: serializer.fromJson<bool>(json['status']),
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
      'status': serializer.toJson<bool>(status),
    };
  }

  LendData copyWith(
          {int? id,
          String? description,
          double? amount,
          DateTime? time,
          bool? status}) =>
      LendData(
        id: id ?? this.id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        time: time ?? this.time,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('LendData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(description.hashCode,
          $mrjc(amount.hashCode, $mrjc(time.hashCode, status.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LendData &&
          other.id == this.id &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.time == this.time &&
          other.status == this.status);
}

class LendCompanion extends UpdateCompanion<LendData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> amount;
  final Value<DateTime> time;
  final Value<bool> status;
  const LendCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
    this.status = const Value.absent(),
  });
  LendCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double amount,
    required DateTime time,
    this.status = const Value.absent(),
  })  : description = Value(description),
        amount = Value(amount),
        time = Value(time);
  static Insertable<LendData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<DateTime>? time,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
      if (status != null) 'status': status,
    });
  }

  LendCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<double>? amount,
      Value<DateTime>? time,
      Value<bool>? status}) {
    return LendCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      status: status ?? this.status,
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
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LendCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $LendTable extends Lend with TableInfo<$LendTable, LendData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LendTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<bool?> status = GeneratedColumn<bool?>(
      'status', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (status IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, description, amount, time, status];
  @override
  String get aliasedName => _alias ?? 'lend';
  @override
  String get actualTableName => 'lend';
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
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
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
  final bool status;
  BorrowData(
      {required this.id,
      required this.description,
      required this.amount,
      required this.time,
      required this.status});
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
      status: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<double>(amount);
    map['time'] = Variable<DateTime>(time);
    map['status'] = Variable<bool>(status);
    return map;
  }

  BorrowCompanion toCompanion(bool nullToAbsent) {
    return BorrowCompanion(
      id: Value(id),
      description: Value(description),
      amount: Value(amount),
      time: Value(time),
      status: Value(status),
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
      status: serializer.fromJson<bool>(json['status']),
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
      'status': serializer.toJson<bool>(status),
    };
  }

  BorrowData copyWith(
          {int? id,
          String? description,
          double? amount,
          DateTime? time,
          bool? status}) =>
      BorrowData(
        id: id ?? this.id,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        time: time ?? this.time,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('BorrowData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(description.hashCode,
          $mrjc(amount.hashCode, $mrjc(time.hashCode, status.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BorrowData &&
          other.id == this.id &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.time == this.time &&
          other.status == this.status);
}

class BorrowCompanion extends UpdateCompanion<BorrowData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> amount;
  final Value<DateTime> time;
  final Value<bool> status;
  const BorrowCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
    this.status = const Value.absent(),
  });
  BorrowCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double amount,
    required DateTime time,
    this.status = const Value.absent(),
  })  : description = Value(description),
        amount = Value(amount),
        time = Value(time);
  static Insertable<BorrowData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? amount,
    Expression<DateTime>? time,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
      if (status != null) 'status': status,
    });
  }

  BorrowCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<double>? amount,
      Value<DateTime>? time,
      Value<bool>? status}) {
    return BorrowCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      time: time ?? this.time,
      status: status ?? this.status,
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
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BorrowCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $BorrowTable extends Borrow with TableInfo<$BorrowTable, BorrowData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BorrowTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<bool?> status = GeneratedColumn<bool?>(
      'status', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (status IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, description, amount, time, status];
  @override
  String get aliasedName => _alias ?? 'borrow';
  @override
  String get actualTableName => 'borrow';
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
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
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

class PlanData extends DataClass implements Insertable<PlanData> {
  final String title;
  final int allocation;
  final DateTime time;
  PlanData({required this.title, required this.allocation, required this.time});
  factory PlanData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlanData(
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      allocation: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}allocation'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['allocation'] = Variable<int>(allocation);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  PlanCompanion toCompanion(bool nullToAbsent) {
    return PlanCompanion(
      title: Value(title),
      allocation: Value(allocation),
      time: Value(time),
    );
  }

  factory PlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanData(
      title: serializer.fromJson<String>(json['title']),
      allocation: serializer.fromJson<int>(json['allocation']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'allocation': serializer.toJson<int>(allocation),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  PlanData copyWith({String? title, int? allocation, DateTime? time}) =>
      PlanData(
        title: title ?? this.title,
        allocation: allocation ?? this.allocation,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('PlanData(')
          ..write('title: $title, ')
          ..write('allocation: $allocation, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(title.hashCode, $mrjc(allocation.hashCode, time.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanData &&
          other.title == this.title &&
          other.allocation == this.allocation &&
          other.time == this.time);
}

class PlanCompanion extends UpdateCompanion<PlanData> {
  final Value<String> title;
  final Value<int> allocation;
  final Value<DateTime> time;
  const PlanCompanion({
    this.title = const Value.absent(),
    this.allocation = const Value.absent(),
    this.time = const Value.absent(),
  });
  PlanCompanion.insert({
    required String title,
    required int allocation,
    required DateTime time,
  })  : title = Value(title),
        allocation = Value(allocation),
        time = Value(time);
  static Insertable<PlanData> custom({
    Expression<String>? title,
    Expression<int>? allocation,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (allocation != null) 'allocation': allocation,
      if (time != null) 'time': time,
    });
  }

  PlanCompanion copyWith(
      {Value<String>? title, Value<int>? allocation, Value<DateTime>? time}) {
    return PlanCompanion(
      title: title ?? this.title,
      allocation: allocation ?? this.allocation,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (allocation.present) {
      map['allocation'] = Variable<int>(allocation.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanCompanion(')
          ..write('title: $title, ')
          ..write('allocation: $allocation, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $PlanTable extends Plan with TableInfo<$PlanTable, PlanData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlanTable(this._db, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _allocationMeta = const VerificationMeta('allocation');
  late final GeneratedColumn<int?> allocation = GeneratedColumn<int?>(
      'allocation', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [title, allocation, time];
  @override
  String get aliasedName => _alias ?? '"plan"';
  @override
  String get actualTableName => '"plan"';
  @override
  VerificationContext validateIntegrity(Insertable<PlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('allocation')) {
      context.handle(
          _allocationMeta,
          allocation.isAcceptableOrUnknown(
              data['allocation']!, _allocationMeta));
    } else if (isInserting) {
      context.missing(_allocationMeta);
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
  Set<GeneratedColumn> get $primaryKey => {title};
  @override
  PlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlanData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlanTable createAlias(String alias) {
    return $PlanTable(_db, alias);
  }
}

class PlanSpend extends DataClass implements Insertable<PlanSpend> {
  final int id;
  final String plan;
  final String description;
  final int amount;
  final DateTime time;
  PlanSpend(
      {required this.id,
      required this.plan,
      required this.description,
      required this.amount,
      required this.time});
  factory PlanSpend.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlanSpend(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      plan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}plan'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      amount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan'] = Variable<String>(plan);
    map['description'] = Variable<String>(description);
    map['amount'] = Variable<int>(amount);
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  PlanSpendsCompanion toCompanion(bool nullToAbsent) {
    return PlanSpendsCompanion(
      id: Value(id),
      plan: Value(plan),
      description: Value(description),
      amount: Value(amount),
      time: Value(time),
    );
  }

  factory PlanSpend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanSpend(
      id: serializer.fromJson<int>(json['id']),
      plan: serializer.fromJson<String>(json['plan']),
      description: serializer.fromJson<String>(json['description']),
      amount: serializer.fromJson<int>(json['amount']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'plan': serializer.toJson<String>(plan),
      'description': serializer.toJson<String>(description),
      'amount': serializer.toJson<int>(amount),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  PlanSpend copyWith(
          {int? id,
          String? plan,
          String? description,
          int? amount,
          DateTime? time}) =>
      PlanSpend(
        id: id ?? this.id,
        plan: plan ?? this.plan,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('PlanSpend(')
          ..write('id: $id, ')
          ..write('plan: $plan, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(plan.hashCode,
          $mrjc(description.hashCode, $mrjc(amount.hashCode, time.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanSpend &&
          other.id == this.id &&
          other.plan == this.plan &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.time == this.time);
}

class PlanSpendsCompanion extends UpdateCompanion<PlanSpend> {
  final Value<int> id;
  final Value<String> plan;
  final Value<String> description;
  final Value<int> amount;
  final Value<DateTime> time;
  const PlanSpendsCompanion({
    this.id = const Value.absent(),
    this.plan = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.time = const Value.absent(),
  });
  PlanSpendsCompanion.insert({
    this.id = const Value.absent(),
    required String plan,
    required String description,
    required int amount,
    required DateTime time,
  })  : plan = Value(plan),
        description = Value(description),
        amount = Value(amount),
        time = Value(time);
  static Insertable<PlanSpend> custom({
    Expression<int>? id,
    Expression<String>? plan,
    Expression<String>? description,
    Expression<int>? amount,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plan != null) 'plan': plan,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (time != null) 'time': time,
    });
  }

  PlanSpendsCompanion copyWith(
      {Value<int>? id,
      Value<String>? plan,
      Value<String>? description,
      Value<int>? amount,
      Value<DateTime>? time}) {
    return PlanSpendsCompanion(
      id: id ?? this.id,
      plan: plan ?? this.plan,
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
    if (plan.present) {
      map['plan'] = Variable<String>(plan.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanSpendsCompanion(')
          ..write('id: $id, ')
          ..write('plan: $plan, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $PlanSpendsTable extends PlanSpends
    with TableInfo<$PlanSpendsTable, PlanSpend> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlanSpendsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _planMeta = const VerificationMeta('plan');
  late final GeneratedColumn<String?> plan = GeneratedColumn<String?>(
      'plan', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES plan(title)');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<int?> amount = GeneratedColumn<int?>(
      'amount', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, plan, description, amount, time];
  @override
  String get aliasedName => _alias ?? 'plan_spends';
  @override
  String get actualTableName => 'plan_spends';
  @override
  VerificationContext validateIntegrity(Insertable<PlanSpend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan')) {
      context.handle(
          _planMeta, plan.isAcceptableOrUnknown(data['plan']!, _planMeta));
    } else if (isInserting) {
      context.missing(_planMeta);
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
  PlanSpend map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlanSpend.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlanSpendsTable createAlias(String alias) {
    return $PlanSpendsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ExpenseTable expense = $ExpenseTable(this);
  late final $IncomeTable income = $IncomeTable(this);
  late final $LendTable lend = $LendTable(this);
  late final $BorrowTable borrow = $BorrowTable(this);
  late final $PlanTable plan = $PlanTable(this);
  late final $PlanSpendsTable planSpends = $PlanSpendsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [expense, income, lend, borrow, plan, planSpends];
}
