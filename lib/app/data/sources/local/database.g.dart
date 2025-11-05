// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AccountType>($AccountsTable.$convertertype);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [email, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      type: $AccountsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $convertertype =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final String email;
  final AccountType type;
  final DateTime createdAt;
  const Account(
      {required this.email, required this.type, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    {
      map['type'] = Variable<String>($AccountsTable.$convertertype.toSql(type));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      email: Value(email),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      email: serializer.fromJson<String>(json['email']),
      type: $AccountsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'type':
          serializer.toJson<String>($AccountsTable.$convertertype.toJson(type)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Account copyWith({String? email, AccountType? type, DateTime? createdAt}) =>
      Account(
        email: email ?? this.email,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      email: data.email.present ? data.email.value : this.email,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('email: $email, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(email, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.email == this.email &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> email;
  final Value<AccountType> type;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AccountsCompanion({
    this.email = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String email,
    required AccountType type,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : email = Value(email),
        type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<Account> custom({
    Expression<String>? email,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith(
      {Value<String>? email,
      Value<AccountType>? type,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AccountsCompanion(
      email: email ?? this.email,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($AccountsTable.$convertertype.toSql(type.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('email: $email, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MembershipsTable extends Memberships
    with TableInfo<$MembershipsTable, Membership> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembershipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planNameMeta =
      const VerificationMeta('planName');
  @override
  late final GeneratedColumn<String> planName = GeneratedColumn<String>(
      'plan_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _isGiftMeta = const VerificationMeta('isGift');
  @override
  late final GeneratedColumn<bool> isGift = GeneratedColumn<bool>(
      'is_gift', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_gift" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, planId, planName, price, startDate, endDate, isActive, isGift];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memberships';
  @override
  VerificationContext validateIntegrity(Insertable<Membership> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('plan_name')) {
      context.handle(_planNameMeta,
          planName.isAcceptableOrUnknown(data['plan_name']!, _planNameMeta));
    } else if (isInserting) {
      context.missing(_planNameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_gift')) {
      context.handle(_isGiftMeta,
          isGift.isAcceptableOrUnknown(data['is_gift']!, _isGiftMeta));
    } else if (isInserting) {
      context.missing(_isGiftMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Membership map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Membership(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      planName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isGift: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_gift'])!,
    );
  }

  @override
  $MembershipsTable createAlias(String alias) {
    return $MembershipsTable(attachedDatabase, alias);
  }
}

class Membership extends DataClass implements Insertable<Membership> {
  final int id;
  final String planId;
  final String planName;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isGift;
  const Membership(
      {required this.id,
      required this.planId,
      required this.planName,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.isActive,
      required this.isGift});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_id'] = Variable<String>(planId);
    map['plan_name'] = Variable<String>(planName);
    map['price'] = Variable<double>(price);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_active'] = Variable<bool>(isActive);
    map['is_gift'] = Variable<bool>(isGift);
    return map;
  }

  MembershipsCompanion toCompanion(bool nullToAbsent) {
    return MembershipsCompanion(
      id: Value(id),
      planId: Value(planId),
      planName: Value(planName),
      price: Value(price),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isActive: Value(isActive),
      isGift: Value(isGift),
    );
  }

  factory Membership.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Membership(
      id: serializer.fromJson<int>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      planName: serializer.fromJson<String>(json['planName']),
      price: serializer.fromJson<double>(json['price']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isGift: serializer.fromJson<bool>(json['isGift']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planId': serializer.toJson<String>(planId),
      'planName': serializer.toJson<String>(planName),
      'price': serializer.toJson<double>(price),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
      'isGift': serializer.toJson<bool>(isGift),
    };
  }

  Membership copyWith(
          {int? id,
          String? planId,
          String? planName,
          double? price,
          DateTime? startDate,
          DateTime? endDate,
          bool? isActive,
          bool? isGift}) =>
      Membership(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        planName: planName ?? this.planName,
        price: price ?? this.price,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isActive: isActive ?? this.isActive,
        isGift: isGift ?? this.isGift,
      );
  Membership copyWithCompanion(MembershipsCompanion data) {
    return Membership(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      planName: data.planName.present ? data.planName.value : this.planName,
      price: data.price.present ? data.price.value : this.price,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isGift: data.isGift.present ? data.isGift.value : this.isGift,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Membership(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('planName: $planName, ')
          ..write('price: $price, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isGift: $isGift')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, planId, planName, price, startDate, endDate, isActive, isGift);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Membership &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.planName == this.planName &&
          other.price == this.price &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.isGift == this.isGift);
}

class MembershipsCompanion extends UpdateCompanion<Membership> {
  final Value<int> id;
  final Value<String> planId;
  final Value<String> planName;
  final Value<double> price;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isActive;
  final Value<bool> isGift;
  const MembershipsCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.planName = const Value.absent(),
    this.price = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isGift = const Value.absent(),
  });
  MembershipsCompanion.insert({
    this.id = const Value.absent(),
    required String planId,
    required String planName,
    required double price,
    required DateTime startDate,
    required DateTime endDate,
    required bool isActive,
    required bool isGift,
  })  : planId = Value(planId),
        planName = Value(planName),
        price = Value(price),
        startDate = Value(startDate),
        endDate = Value(endDate),
        isActive = Value(isActive),
        isGift = Value(isGift);
  static Insertable<Membership> custom({
    Expression<int>? id,
    Expression<String>? planId,
    Expression<String>? planName,
    Expression<double>? price,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isActive,
    Expression<bool>? isGift,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (planName != null) 'plan_name': planName,
      if (price != null) 'price': price,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (isGift != null) 'is_gift': isGift,
    });
  }

  MembershipsCompanion copyWith(
      {Value<int>? id,
      Value<String>? planId,
      Value<String>? planName,
      Value<double>? price,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<bool>? isActive,
      Value<bool>? isGift}) {
    return MembershipsCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      planName: planName ?? this.planName,
      price: price ?? this.price,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      isGift: isGift ?? this.isGift,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (planName.present) {
      map['plan_name'] = Variable<String>(planName.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isGift.present) {
      map['is_gift'] = Variable<bool>(isGift.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembershipsCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('planName: $planName, ')
          ..write('price: $price, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isGift: $isGift')
          ..write(')'))
        .toString();
  }
}

class $RoutinesTable extends Routines with TableInfo<$RoutinesTable, Routine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => 0);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCurrentMeta =
      const VerificationMeta('isCurrent');
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
      'is_current', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_current" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        apiId,
        version,
        name,
        description,
        isCurrent,
        isSynced,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routines';
  @override
  VerificationContext validateIntegrity(Insertable<Routine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_current')) {
      context.handle(_isCurrentMeta,
          isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Routine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isCurrent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_current'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }
}

class Routine extends DataClass implements Insertable<Routine> {
  final int id;
  final int? apiId;
  final int version;
  final String name;
  final String? description;
  final bool isCurrent;
  final bool isSynced;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Routine(
      {required this.id,
      this.apiId,
      required this.version,
      required this.name,
      this.description,
      required this.isCurrent,
      required this.isSynced,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['version'] = Variable<int>(version);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_current'] = Variable<bool>(isCurrent);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      version: Value(version),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCurrent: Value(isCurrent),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Routine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Routine(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isCurrent': serializer.toJson<bool>(isCurrent),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Routine copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? version,
          String? name,
          Value<String?> description = const Value.absent(),
          bool? isCurrent,
          bool? isSynced,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Routine(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        version: version ?? this.version,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        isCurrent: isCurrent ?? this.isCurrent,
        isSynced: isSynced ?? this.isSynced,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Routine copyWithCompanion(RoutinesCompanion data) {
    return Routine(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      version: data.version.present ? data.version.value : this.version,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Routine(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, version, name, description,
      isCurrent, isSynced, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Routine &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.version == this.version &&
          other.name == this.name &&
          other.description == this.description &&
          other.isCurrent == this.isCurrent &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoutinesCompanion extends UpdateCompanion<Routine> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isCurrent;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RoutinesCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Routine> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isCurrent,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (version != null) 'version': version,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isCurrent != null) 'is_current': isCurrent,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RoutinesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? version,
      Value<String>? name,
      Value<String?>? description,
      Value<bool>? isCurrent,
      Value<bool>? isSynced,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return RoutinesCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      version: version ?? this.version,
      name: name ?? this.name,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCurrent.present) {
      map['is_current'] = Variable<bool>(isCurrent.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DaysGroupTable extends DaysGroup
    with TableInfo<$DaysGroupTable, DaysGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DaysGroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => 0);
  static const VerificationMeta _dayNameMeta =
      const VerificationMeta('dayName');
  @override
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
      'day_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _routineIdMeta =
      const VerificationMeta('routineId');
  @override
  late final GeneratedColumn<int> routineId = GeneratedColumn<int>(
      'routine_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES routines (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, index, version, dayName, isSynced, routineId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'days_group';
  @override
  VerificationContext validateIntegrity(Insertable<DaysGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('day_name')) {
      context.handle(_dayNameMeta,
          dayName.isAcceptableOrUnknown(data['day_name']!, _dayNameMeta));
    } else if (isInserting) {
      context.missing(_dayNameMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('routine_id')) {
      context.handle(_routineIdMeta,
          routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta));
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DaysGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DaysGroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      dayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}day_name'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      routineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}routine_id'])!,
    );
  }

  @override
  $DaysGroupTable createAlias(String alias) {
    return $DaysGroupTable(attachedDatabase, alias);
  }
}

class DaysGroupData extends DataClass implements Insertable<DaysGroupData> {
  final int id;
  final int? apiId;
  final int index;
  final int version;
  final String dayName;
  final bool isSynced;
  final int routineId;
  const DaysGroupData(
      {required this.id,
      this.apiId,
      required this.index,
      required this.version,
      required this.dayName,
      required this.isSynced,
      required this.routineId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['index'] = Variable<int>(index);
    map['version'] = Variable<int>(version);
    map['day_name'] = Variable<String>(dayName);
    map['is_synced'] = Variable<bool>(isSynced);
    map['routine_id'] = Variable<int>(routineId);
    return map;
  }

  DaysGroupCompanion toCompanion(bool nullToAbsent) {
    return DaysGroupCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      index: Value(index),
      version: Value(version),
      dayName: Value(dayName),
      isSynced: Value(isSynced),
      routineId: Value(routineId),
    );
  }

  factory DaysGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DaysGroupData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      version: serializer.fromJson<int>(json['version']),
      dayName: serializer.fromJson<String>(json['dayName']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      routineId: serializer.fromJson<int>(json['routineId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'index': serializer.toJson<int>(index),
      'version': serializer.toJson<int>(version),
      'dayName': serializer.toJson<String>(dayName),
      'isSynced': serializer.toJson<bool>(isSynced),
      'routineId': serializer.toJson<int>(routineId),
    };
  }

  DaysGroupData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          int? version,
          String? dayName,
          bool? isSynced,
          int? routineId}) =>
      DaysGroupData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        version: version ?? this.version,
        dayName: dayName ?? this.dayName,
        isSynced: isSynced ?? this.isSynced,
        routineId: routineId ?? this.routineId,
      );
  DaysGroupData copyWithCompanion(DaysGroupCompanion data) {
    return DaysGroupData(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      version: data.version.present ? data.version.value : this.version,
      dayName: data.dayName.present ? data.dayName.value : this.dayName,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DaysGroupData(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('version: $version, ')
          ..write('dayName: $dayName, ')
          ..write('isSynced: $isSynced, ')
          ..write('routineId: $routineId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, apiId, index, version, dayName, isSynced, routineId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DaysGroupData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.version == this.version &&
          other.dayName == this.dayName &&
          other.isSynced == this.isSynced &&
          other.routineId == this.routineId);
}

class DaysGroupCompanion extends UpdateCompanion<DaysGroupData> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<int> version;
  final Value<String> dayName;
  final Value<bool> isSynced;
  final Value<int> routineId;
  const DaysGroupCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.version = const Value.absent(),
    this.dayName = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.routineId = const Value.absent(),
  });
  DaysGroupCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    this.version = const Value.absent(),
    required String dayName,
    this.isSynced = const Value.absent(),
    required int routineId,
  })  : index = Value(index),
        dayName = Value(dayName),
        routineId = Value(routineId);
  static Insertable<DaysGroupData> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<int>? version,
    Expression<String>? dayName,
    Expression<bool>? isSynced,
    Expression<int>? routineId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (version != null) 'version': version,
      if (dayName != null) 'day_name': dayName,
      if (isSynced != null) 'is_synced': isSynced,
      if (routineId != null) 'routine_id': routineId,
    });
  }

  DaysGroupCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? index,
      Value<int>? version,
      Value<String>? dayName,
      Value<bool>? isSynced,
      Value<int>? routineId}) {
    return DaysGroupCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      version: version ?? this.version,
      dayName: dayName ?? this.dayName,
      isSynced: isSynced ?? this.isSynced,
      routineId: routineId ?? this.routineId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (dayName.present) {
      map['day_name'] = Variable<String>(dayName.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<int>(routineId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysGroupCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('version: $version, ')
          ..write('dayName: $dayName, ')
          ..write('isSynced: $isSynced, ')
          ..write('routineId: $routineId')
          ..write(')'))
        .toString();
  }
}

class $ExerciseGroupsTable extends ExerciseGroups
    with TableInfo<$ExerciseGroupsTable, ExerciseGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _muscleGroupTranslationsMeta =
      const VerificationMeta('muscleGroupTranslations');
  @override
  late final GeneratedColumn<String> muscleGroupTranslations =
      GeneratedColumn<String>('muscle_group_translations', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, apiId, muscleGroupTranslations];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_groups';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    } else if (isInserting) {
      context.missing(_apiIdMeta);
    }
    if (data.containsKey('muscle_group_translations')) {
      context.handle(
          _muscleGroupTranslationsMeta,
          muscleGroupTranslations.isAcceptableOrUnknown(
              data['muscle_group_translations']!,
              _muscleGroupTranslationsMeta));
    } else if (isInserting) {
      context.missing(_muscleGroupTranslationsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {apiId},
      ];
  @override
  ExerciseGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id'])!,
      muscleGroupTranslations: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}muscle_group_translations'])!,
    );
  }

  @override
  $ExerciseGroupsTable createAlias(String alias) {
    return $ExerciseGroupsTable(attachedDatabase, alias);
  }
}

class ExerciseGroup extends DataClass implements Insertable<ExerciseGroup> {
  final int id;
  final int apiId;
  final String muscleGroupTranslations;
  const ExerciseGroup(
      {required this.id,
      required this.apiId,
      required this.muscleGroupTranslations});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['api_id'] = Variable<int>(apiId);
    map['muscle_group_translations'] =
        Variable<String>(muscleGroupTranslations);
    return map;
  }

  ExerciseGroupsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseGroupsCompanion(
      id: Value(id),
      apiId: Value(apiId),
      muscleGroupTranslations: Value(muscleGroupTranslations),
    );
  }

  factory ExerciseGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseGroup(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int>(json['apiId']),
      muscleGroupTranslations:
          serializer.fromJson<String>(json['muscleGroupTranslations']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int>(apiId),
      'muscleGroupTranslations':
          serializer.toJson<String>(muscleGroupTranslations),
    };
  }

  ExerciseGroup copyWith(
          {int? id, int? apiId, String? muscleGroupTranslations}) =>
      ExerciseGroup(
        id: id ?? this.id,
        apiId: apiId ?? this.apiId,
        muscleGroupTranslations:
            muscleGroupTranslations ?? this.muscleGroupTranslations,
      );
  ExerciseGroup copyWithCompanion(ExerciseGroupsCompanion data) {
    return ExerciseGroup(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      muscleGroupTranslations: data.muscleGroupTranslations.present
          ? data.muscleGroupTranslations.value
          : this.muscleGroupTranslations,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseGroup(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('muscleGroupTranslations: $muscleGroupTranslations')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, muscleGroupTranslations);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseGroup &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.muscleGroupTranslations == this.muscleGroupTranslations);
}

class ExerciseGroupsCompanion extends UpdateCompanion<ExerciseGroup> {
  final Value<int> id;
  final Value<int> apiId;
  final Value<String> muscleGroupTranslations;
  const ExerciseGroupsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.muscleGroupTranslations = const Value.absent(),
  });
  ExerciseGroupsCompanion.insert({
    this.id = const Value.absent(),
    required int apiId,
    required String muscleGroupTranslations,
  })  : apiId = Value(apiId),
        muscleGroupTranslations = Value(muscleGroupTranslations);
  static Insertable<ExerciseGroup> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<String>? muscleGroupTranslations,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (muscleGroupTranslations != null)
        'muscle_group_translations': muscleGroupTranslations,
    });
  }

  ExerciseGroupsCompanion copyWith(
      {Value<int>? id,
      Value<int>? apiId,
      Value<String>? muscleGroupTranslations}) {
    return ExerciseGroupsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      muscleGroupTranslations:
          muscleGroupTranslations ?? this.muscleGroupTranslations,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (muscleGroupTranslations.present) {
      map['muscle_group_translations'] =
          Variable<String>(muscleGroupTranslations.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseGroupsCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('muscleGroupTranslations: $muscleGroupTranslations')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _muscleGroupMeta =
      const VerificationMeta('muscleGroup');
  @override
  late final GeneratedColumn<int> muscleGroup = GeneratedColumn<int>(
      'muscle_group', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercise_groups (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, name, imageUrl, muscleGroup];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('muscle_group')) {
      context.handle(
          _muscleGroupMeta,
          muscleGroup.isAcceptableOrUnknown(
              data['muscle_group']!, _muscleGroupMeta));
    } else if (isInserting) {
      context.missing(_muscleGroupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {apiId},
      ];
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      muscleGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_group'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final int? apiId;
  final String name;
  final String imageUrl;
  final int muscleGroup;
  const Exercise(
      {required this.id,
      this.apiId,
      required this.name,
      required this.imageUrl,
      required this.muscleGroup});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['muscle_group'] = Variable<int>(muscleGroup);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      name: Value(name),
      imageUrl: Value(imageUrl),
      muscleGroup: Value(muscleGroup),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      muscleGroup: serializer.fromJson<int>(json['muscleGroup']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'muscleGroup': serializer.toJson<int>(muscleGroup),
    };
  }

  Exercise copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          String? name,
          String? imageUrl,
          int? muscleGroup}) =>
      Exercise(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        muscleGroup: muscleGroup ?? this.muscleGroup,
      );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      muscleGroup:
          data.muscleGroup.present ? data.muscleGroup.value : this.muscleGroup,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('muscleGroup: $muscleGroup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, name, imageUrl, muscleGroup);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.muscleGroup == this.muscleGroup);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<int> muscleGroup;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.muscleGroup = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required String name,
    required String imageUrl,
    required int muscleGroup,
  })  : name = Value(name),
        imageUrl = Value(imageUrl),
        muscleGroup = Value(muscleGroup);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<int>? muscleGroup,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (muscleGroup != null) 'muscle_group': muscleGroup,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<int>? muscleGroup}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      muscleGroup: muscleGroup ?? this.muscleGroup,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (muscleGroup.present) {
      map['muscle_group'] = Variable<int>(muscleGroup.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('muscleGroup: $muscleGroup')
          ..write(')'))
        .toString();
  }
}

class $RoutineItemsTable extends RoutineItems
    with TableInfo<$RoutineItemsTable, RoutineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => 0);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES days_group (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, index, version, notes, isSynced, exerciseId, dayId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_items';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      dayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_id'])!,
    );
  }

  @override
  $RoutineItemsTable createAlias(String alias) {
    return $RoutineItemsTable(attachedDatabase, alias);
  }
}

class RoutineItem extends DataClass implements Insertable<RoutineItem> {
  final int id;
  final int? apiId;
  final int index;
  final int version;
  final String? notes;
  final bool isSynced;
  final int exerciseId;
  final int dayId;
  const RoutineItem(
      {required this.id,
      this.apiId,
      required this.index,
      required this.version,
      this.notes,
      required this.isSynced,
      required this.exerciseId,
      required this.dayId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['index'] = Variable<int>(index);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['day_id'] = Variable<int>(dayId);
    return map;
  }

  RoutineItemsCompanion toCompanion(bool nullToAbsent) {
    return RoutineItemsCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      index: Value(index),
      version: Value(version),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isSynced: Value(isSynced),
      exerciseId: Value(exerciseId),
      dayId: Value(dayId),
    );
  }

  factory RoutineItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineItem(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      version: serializer.fromJson<int>(json['version']),
      notes: serializer.fromJson<String?>(json['notes']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      dayId: serializer.fromJson<int>(json['dayId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'index': serializer.toJson<int>(index),
      'version': serializer.toJson<int>(version),
      'notes': serializer.toJson<String?>(notes),
      'isSynced': serializer.toJson<bool>(isSynced),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'dayId': serializer.toJson<int>(dayId),
    };
  }

  RoutineItem copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          int? version,
          Value<String?> notes = const Value.absent(),
          bool? isSynced,
          int? exerciseId,
          int? dayId}) =>
      RoutineItem(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        version: version ?? this.version,
        notes: notes.present ? notes.value : this.notes,
        isSynced: isSynced ?? this.isSynced,
        exerciseId: exerciseId ?? this.exerciseId,
        dayId: dayId ?? this.dayId,
      );
  RoutineItem copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItem(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      version: data.version.present ? data.version.value : this.version,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineItem(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('version: $version, ')
          ..write('notes: $notes, ')
          ..write('isSynced: $isSynced, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('dayId: $dayId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, apiId, index, version, notes, isSynced, exerciseId, dayId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineItem &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.version == this.version &&
          other.notes == this.notes &&
          other.isSynced == this.isSynced &&
          other.exerciseId == this.exerciseId &&
          other.dayId == this.dayId);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItem> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<int> version;
  final Value<String?> notes;
  final Value<bool> isSynced;
  final Value<int> exerciseId;
  final Value<int> dayId;
  const RoutineItemsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.version = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.dayId = const Value.absent(),
  });
  RoutineItemsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    this.version = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int exerciseId,
    required int dayId,
  })  : index = Value(index),
        exerciseId = Value(exerciseId),
        dayId = Value(dayId);
  static Insertable<RoutineItem> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<int>? version,
    Expression<String>? notes,
    Expression<bool>? isSynced,
    Expression<int>? exerciseId,
    Expression<int>? dayId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (version != null) 'version': version,
      if (notes != null) 'notes': notes,
      if (isSynced != null) 'is_synced': isSynced,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (dayId != null) 'day_id': dayId,
    });
  }

  RoutineItemsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? index,
      Value<int>? version,
      Value<String?>? notes,
      Value<bool>? isSynced,
      Value<int>? exerciseId,
      Value<int>? dayId}) {
    return RoutineItemsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      version: version ?? this.version,
      notes: notes ?? this.notes,
      isSynced: isSynced ?? this.isSynced,
      exerciseId: exerciseId ?? this.exerciseId,
      dayId: dayId ?? this.dayId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineItemsCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('version: $version, ')
          ..write('notes: $notes, ')
          ..write('isSynced: $isSynced, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('dayId: $dayId')
          ..write(')'))
        .toString();
  }
}

class $RoutineSetsTable extends RoutineSets
    with TableInfo<$RoutineSetsTable, RoutineSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _roundIndexMeta =
      const VerificationMeta('roundIndex');
  @override
  late final GeneratedColumn<int> roundIndex = GeneratedColumn<int>(
      'round_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repsCountMeta =
      const VerificationMeta('repsCount');
  @override
  late final GeneratedColumn<int> repsCount = GeneratedColumn<int>(
      'reps_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => 0);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _routineItemIdMeta =
      const VerificationMeta('routineItemId');
  @override
  late final GeneratedColumn<int> routineItemId = GeneratedColumn<int>(
      'routine_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES routine_items (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, roundIndex, repsCount, version, isSynced, routineItemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_sets';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('round_index')) {
      context.handle(
          _roundIndexMeta,
          roundIndex.isAcceptableOrUnknown(
              data['round_index']!, _roundIndexMeta));
    } else if (isInserting) {
      context.missing(_roundIndexMeta);
    }
    if (data.containsKey('reps_count')) {
      context.handle(_repsCountMeta,
          repsCount.isAcceptableOrUnknown(data['reps_count']!, _repsCountMeta));
    } else if (isInserting) {
      context.missing(_repsCountMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('routine_item_id')) {
      context.handle(
          _routineItemIdMeta,
          routineItemId.isAcceptableOrUnknown(
              data['routine_item_id']!, _routineItemIdMeta));
    } else if (isInserting) {
      context.missing(_routineItemIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineSet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      roundIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_index'])!,
      repsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps_count'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      routineItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}routine_item_id'])!,
    );
  }

  @override
  $RoutineSetsTable createAlias(String alias) {
    return $RoutineSetsTable(attachedDatabase, alias);
  }
}

class RoutineSet extends DataClass implements Insertable<RoutineSet> {
  final int id;
  final int? apiId;
  final int roundIndex;
  final int repsCount;
  final int version;
  final bool isSynced;
  final int routineItemId;
  const RoutineSet(
      {required this.id,
      this.apiId,
      required this.roundIndex,
      required this.repsCount,
      required this.version,
      required this.isSynced,
      required this.routineItemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['round_index'] = Variable<int>(roundIndex);
    map['reps_count'] = Variable<int>(repsCount);
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<bool>(isSynced);
    map['routine_item_id'] = Variable<int>(routineItemId);
    return map;
  }

  RoutineSetsCompanion toCompanion(bool nullToAbsent) {
    return RoutineSetsCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      roundIndex: Value(roundIndex),
      repsCount: Value(repsCount),
      version: Value(version),
      isSynced: Value(isSynced),
      routineItemId: Value(routineItemId),
    );
  }

  factory RoutineSet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineSet(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      roundIndex: serializer.fromJson<int>(json['roundIndex']),
      repsCount: serializer.fromJson<int>(json['repsCount']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      routineItemId: serializer.fromJson<int>(json['routineItemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'roundIndex': serializer.toJson<int>(roundIndex),
      'repsCount': serializer.toJson<int>(repsCount),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
      'routineItemId': serializer.toJson<int>(routineItemId),
    };
  }

  RoutineSet copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? roundIndex,
          int? repsCount,
          int? version,
          bool? isSynced,
          int? routineItemId}) =>
      RoutineSet(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        roundIndex: roundIndex ?? this.roundIndex,
        repsCount: repsCount ?? this.repsCount,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
        routineItemId: routineItemId ?? this.routineItemId,
      );
  RoutineSet copyWithCompanion(RoutineSetsCompanion data) {
    return RoutineSet(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      roundIndex:
          data.roundIndex.present ? data.roundIndex.value : this.roundIndex,
      repsCount: data.repsCount.present ? data.repsCount.value : this.repsCount,
      version: data.version.present ? data.version.value : this.version,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      routineItemId: data.routineItemId.present
          ? data.routineItemId.value
          : this.routineItemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineSet(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('roundIndex: $roundIndex, ')
          ..write('repsCount: $repsCount, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced, ')
          ..write('routineItemId: $routineItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, apiId, roundIndex, repsCount, version, isSynced, routineItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineSet &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.roundIndex == this.roundIndex &&
          other.repsCount == this.repsCount &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.routineItemId == this.routineItemId);
}

class RoutineSetsCompanion extends UpdateCompanion<RoutineSet> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> roundIndex;
  final Value<int> repsCount;
  final Value<int> version;
  final Value<bool> isSynced;
  final Value<int> routineItemId;
  const RoutineSetsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.roundIndex = const Value.absent(),
    this.repsCount = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.routineItemId = const Value.absent(),
  });
  RoutineSetsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int roundIndex,
    required int repsCount,
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int routineItemId,
  })  : roundIndex = Value(roundIndex),
        repsCount = Value(repsCount),
        routineItemId = Value(routineItemId);
  static Insertable<RoutineSet> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? roundIndex,
    Expression<int>? repsCount,
    Expression<int>? version,
    Expression<bool>? isSynced,
    Expression<int>? routineItemId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (roundIndex != null) 'round_index': roundIndex,
      if (repsCount != null) 'reps_count': repsCount,
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
      if (routineItemId != null) 'routine_item_id': routineItemId,
    });
  }

  RoutineSetsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? roundIndex,
      Value<int>? repsCount,
      Value<int>? version,
      Value<bool>? isSynced,
      Value<int>? routineItemId}) {
    return RoutineSetsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      roundIndex: roundIndex ?? this.roundIndex,
      repsCount: repsCount ?? this.repsCount,
      version: version ?? this.version,
      isSynced: isSynced ?? this.isSynced,
      routineItemId: routineItemId ?? this.routineItemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (roundIndex.present) {
      map['round_index'] = Variable<int>(roundIndex.value);
    }
    if (repsCount.present) {
      map['reps_count'] = Variable<int>(repsCount.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (routineItemId.present) {
      map['routine_item_id'] = Variable<int>(routineItemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineSetsCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('roundIndex: $roundIndex, ')
          ..write('repsCount: $repsCount, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced, ')
          ..write('routineItemId: $routineItemId')
          ..write(')'))
        .toString();
  }
}

class $TSessionsTable extends TSessions
    with TableInfo<$TSessionsTable, TSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tsIdMeta = const VerificationMeta('tsId');
  @override
  late final GeneratedColumn<int> tsId = GeneratedColumn<int>(
      'ts_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishedAtMeta =
      const VerificationMeta('finishedAt');
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [tsId, dayId, startedAt, finishedAt, progress, apiId, version, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 't_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<TSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ts_id')) {
      context.handle(
          _tsIdMeta, tsId.isAcceptableOrUnknown(data['ts_id']!, _tsIdMeta));
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
          _finishedAtMeta,
          finishedAt.isAcceptableOrUnknown(
              data['finished_at']!, _finishedAtMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tsId};
  @override
  TSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TSession(
      tsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ts_id'])!,
      dayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      finishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finished_at']),
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $TSessionsTable createAlias(String alias) {
    return $TSessionsTable(attachedDatabase, alias);
  }
}

class TSession extends DataClass implements Insertable<TSession> {
  final int tsId;
  final int dayId;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final double progress;
  final int? apiId;
  final int version;
  final bool isSynced;
  const TSession(
      {required this.tsId,
      required this.dayId,
      required this.startedAt,
      this.finishedAt,
      required this.progress,
      this.apiId,
      required this.version,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ts_id'] = Variable<int>(tsId);
    map['day_id'] = Variable<int>(dayId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  TSessionsCompanion toCompanion(bool nullToAbsent) {
    return TSessionsCompanion(
      tsId: Value(tsId),
      dayId: Value(dayId),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      progress: Value(progress),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      version: Value(version),
      isSynced: Value(isSynced),
    );
  }

  factory TSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TSession(
      tsId: serializer.fromJson<int>(json['tsId']),
      dayId: serializer.fromJson<int>(json['dayId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
      progress: serializer.fromJson<double>(json['progress']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tsId': serializer.toJson<int>(tsId),
      'dayId': serializer.toJson<int>(dayId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'progress': serializer.toJson<double>(progress),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  TSession copyWith(
          {int? tsId,
          int? dayId,
          DateTime? startedAt,
          Value<DateTime?> finishedAt = const Value.absent(),
          double? progress,
          Value<int?> apiId = const Value.absent(),
          int? version,
          bool? isSynced}) =>
      TSession(
        tsId: tsId ?? this.tsId,
        dayId: dayId ?? this.dayId,
        startedAt: startedAt ?? this.startedAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
        progress: progress ?? this.progress,
        apiId: apiId.present ? apiId.value : this.apiId,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
      );
  TSession copyWithCompanion(TSessionsCompanion data) {
    return TSession(
      tsId: data.tsId.present ? data.tsId.value : this.tsId,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt:
          data.finishedAt.present ? data.finishedAt.value : this.finishedAt,
      progress: data.progress.present ? data.progress.value : this.progress,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      version: data.version.present ? data.version.value : this.version,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TSession(')
          ..write('tsId: $tsId, ')
          ..write('dayId: $dayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('progress: $progress, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      tsId, dayId, startedAt, finishedAt, progress, apiId, version, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TSession &&
          other.tsId == this.tsId &&
          other.dayId == this.dayId &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.progress == this.progress &&
          other.apiId == this.apiId &&
          other.version == this.version &&
          other.isSynced == this.isSynced);
}

class TSessionsCompanion extends UpdateCompanion<TSession> {
  final Value<int> tsId;
  final Value<int> dayId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<double> progress;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<bool> isSynced;
  const TSessionsCompanion({
    this.tsId = const Value.absent(),
    this.dayId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  TSessionsCompanion.insert({
    this.tsId = const Value.absent(),
    required int dayId,
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
  })  : dayId = Value(dayId),
        startedAt = Value(startedAt);
  static Insertable<TSession> custom({
    Expression<int>? tsId,
    Expression<int>? dayId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<double>? progress,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (tsId != null) 'ts_id': tsId,
      if (dayId != null) 'day_id': dayId,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (progress != null) 'progress': progress,
      if (apiId != null) 'api_id': apiId,
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  TSessionsCompanion copyWith(
      {Value<int>? tsId,
      Value<int>? dayId,
      Value<DateTime>? startedAt,
      Value<DateTime?>? finishedAt,
      Value<double>? progress,
      Value<int?>? apiId,
      Value<int>? version,
      Value<bool>? isSynced}) {
    return TSessionsCompanion(
      tsId: tsId ?? this.tsId,
      dayId: dayId ?? this.dayId,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      progress: progress ?? this.progress,
      apiId: apiId ?? this.apiId,
      version: version ?? this.version,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tsId.present) {
      map['ts_id'] = Variable<int>(tsId.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TSessionsCompanion(')
          ..write('tsId: $tsId, ')
          ..write('dayId: $dayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('progress: $progress, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $TLogsTable extends TLogs with TableInfo<$TLogsTable, TLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _logIdMeta = const VerificationMeta('logId');
  @override
  late final GeneratedColumn<int> logId = GeneratedColumn<int>(
      'log_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exerciseIndexMeta =
      const VerificationMeta('exerciseIndex');
  @override
  late final GeneratedColumn<int> exerciseIndex = GeneratedColumn<int>(
      'exercise_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _setIndexMeta =
      const VerificationMeta('setIndex');
  @override
  late final GeneratedColumn<int> setIndex = GeneratedColumn<int>(
      'set_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES t_sessions (ts_id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [
        logId,
        exerciseId,
        exerciseIndex,
        setIndex,
        reps,
        weight,
        completedAt,
        apiId,
        version,
        isSynced,
        sessionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 't_logs';
  @override
  VerificationContext validateIntegrity(Insertable<TLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('log_id')) {
      context.handle(
          _logIdMeta, logId.isAcceptableOrUnknown(data['log_id']!, _logIdMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_index')) {
      context.handle(
          _exerciseIndexMeta,
          exerciseIndex.isAcceptableOrUnknown(
              data['exercise_index']!, _exerciseIndexMeta));
    } else if (isInserting) {
      context.missing(_exerciseIndexMeta);
    }
    if (data.containsKey('set_index')) {
      context.handle(_setIndexMeta,
          setIndex.isAcceptableOrUnknown(data['set_index']!, _setIndexMeta));
    } else if (isInserting) {
      context.missing(_setIndexMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('api_id')) {
      context.handle(
          _apiIdMeta, apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {logId};
  @override
  TLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TLog(
      logId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}log_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      exerciseIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_index'])!,
      setIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_index'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
    );
  }

  @override
  $TLogsTable createAlias(String alias) {
    return $TLogsTable(attachedDatabase, alias);
  }
}

class TLog extends DataClass implements Insertable<TLog> {
  final int logId;
  final int exerciseId;
  final int exerciseIndex;
  final int setIndex;
  final int reps;
  final double weight;
  final DateTime completedAt;
  final int? apiId;
  final int version;
  final bool isSynced;
  final int sessionId;
  const TLog(
      {required this.logId,
      required this.exerciseId,
      required this.exerciseIndex,
      required this.setIndex,
      required this.reps,
      required this.weight,
      required this.completedAt,
      this.apiId,
      required this.version,
      required this.isSynced,
      required this.sessionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['log_id'] = Variable<int>(logId);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['exercise_index'] = Variable<int>(exerciseIndex);
    map['set_index'] = Variable<int>(setIndex);
    map['reps'] = Variable<int>(reps);
    map['weight'] = Variable<double>(weight);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<bool>(isSynced);
    map['session_id'] = Variable<int>(sessionId);
    return map;
  }

  TLogsCompanion toCompanion(bool nullToAbsent) {
    return TLogsCompanion(
      logId: Value(logId),
      exerciseId: Value(exerciseId),
      exerciseIndex: Value(exerciseIndex),
      setIndex: Value(setIndex),
      reps: Value(reps),
      weight: Value(weight),
      completedAt: Value(completedAt),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      version: Value(version),
      isSynced: Value(isSynced),
      sessionId: Value(sessionId),
    );
  }

  factory TLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TLog(
      logId: serializer.fromJson<int>(json['logId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      exerciseIndex: serializer.fromJson<int>(json['exerciseIndex']),
      setIndex: serializer.fromJson<int>(json['setIndex']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'logId': serializer.toJson<int>(logId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'exerciseIndex': serializer.toJson<int>(exerciseIndex),
      'setIndex': serializer.toJson<int>(setIndex),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double>(weight),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
      'sessionId': serializer.toJson<int>(sessionId),
    };
  }

  TLog copyWith(
          {int? logId,
          int? exerciseId,
          int? exerciseIndex,
          int? setIndex,
          int? reps,
          double? weight,
          DateTime? completedAt,
          Value<int?> apiId = const Value.absent(),
          int? version,
          bool? isSynced,
          int? sessionId}) =>
      TLog(
        logId: logId ?? this.logId,
        exerciseId: exerciseId ?? this.exerciseId,
        exerciseIndex: exerciseIndex ?? this.exerciseIndex,
        setIndex: setIndex ?? this.setIndex,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        completedAt: completedAt ?? this.completedAt,
        apiId: apiId.present ? apiId.value : this.apiId,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
        sessionId: sessionId ?? this.sessionId,
      );
  TLog copyWithCompanion(TLogsCompanion data) {
    return TLog(
      logId: data.logId.present ? data.logId.value : this.logId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      exerciseIndex: data.exerciseIndex.present
          ? data.exerciseIndex.value
          : this.exerciseIndex,
      setIndex: data.setIndex.present ? data.setIndex.value : this.setIndex,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      version: data.version.present ? data.version.value : this.version,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TLog(')
          ..write('logId: $logId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseIndex: $exerciseIndex, ')
          ..write('setIndex: $setIndex, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('completedAt: $completedAt, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(logId, exerciseId, exerciseIndex, setIndex,
      reps, weight, completedAt, apiId, version, isSynced, sessionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TLog &&
          other.logId == this.logId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseIndex == this.exerciseIndex &&
          other.setIndex == this.setIndex &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.completedAt == this.completedAt &&
          other.apiId == this.apiId &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.sessionId == this.sessionId);
}

class TLogsCompanion extends UpdateCompanion<TLog> {
  final Value<int> logId;
  final Value<int> exerciseId;
  final Value<int> exerciseIndex;
  final Value<int> setIndex;
  final Value<int> reps;
  final Value<double> weight;
  final Value<DateTime> completedAt;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<bool> isSynced;
  final Value<int> sessionId;
  const TLogsCompanion({
    this.logId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseIndex = const Value.absent(),
    this.setIndex = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.sessionId = const Value.absent(),
  });
  TLogsCompanion.insert({
    this.logId = const Value.absent(),
    required int exerciseId,
    required int exerciseIndex,
    required int setIndex,
    required int reps,
    required double weight,
    required DateTime completedAt,
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int sessionId,
  })  : exerciseId = Value(exerciseId),
        exerciseIndex = Value(exerciseIndex),
        setIndex = Value(setIndex),
        reps = Value(reps),
        weight = Value(weight),
        completedAt = Value(completedAt),
        sessionId = Value(sessionId);
  static Insertable<TLog> custom({
    Expression<int>? logId,
    Expression<int>? exerciseId,
    Expression<int>? exerciseIndex,
    Expression<int>? setIndex,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<DateTime>? completedAt,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<bool>? isSynced,
    Expression<int>? sessionId,
  }) {
    return RawValuesInsertable({
      if (logId != null) 'log_id': logId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseIndex != null) 'exercise_index': exerciseIndex,
      if (setIndex != null) 'set_index': setIndex,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (completedAt != null) 'completed_at': completedAt,
      if (apiId != null) 'api_id': apiId,
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
      if (sessionId != null) 'session_id': sessionId,
    });
  }

  TLogsCompanion copyWith(
      {Value<int>? logId,
      Value<int>? exerciseId,
      Value<int>? exerciseIndex,
      Value<int>? setIndex,
      Value<int>? reps,
      Value<double>? weight,
      Value<DateTime>? completedAt,
      Value<int?>? apiId,
      Value<int>? version,
      Value<bool>? isSynced,
      Value<int>? sessionId}) {
    return TLogsCompanion(
      logId: logId ?? this.logId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseIndex: exerciseIndex ?? this.exerciseIndex,
      setIndex: setIndex ?? this.setIndex,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      completedAt: completedAt ?? this.completedAt,
      apiId: apiId ?? this.apiId,
      version: version ?? this.version,
      isSynced: isSynced ?? this.isSynced,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (logId.present) {
      map['log_id'] = Variable<int>(logId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (exerciseIndex.present) {
      map['exercise_index'] = Variable<int>(exerciseIndex.value);
    }
    if (setIndex.present) {
      map['set_index'] = Variable<int>(setIndex.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TLogsCompanion(')
          ..write('logId: $logId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseIndex: $exerciseIndex, ')
          ..write('setIndex: $setIndex, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('completedAt: $completedAt, ')
          ..write('apiId: $apiId, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $MembershipsTable memberships = $MembershipsTable(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $DaysGroupTable daysGroup = $DaysGroupTable(this);
  late final $ExerciseGroupsTable exerciseGroups = $ExerciseGroupsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $RoutineItemsTable routineItems = $RoutineItemsTable(this);
  late final $RoutineSetsTable routineSets = $RoutineSetsTable(this);
  late final $TSessionsTable tSessions = $TSessionsTable(this);
  late final $TLogsTable tLogs = $TLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accounts,
        memberships,
        routines,
        daysGroup,
        exerciseGroups,
        exercises,
        routineItems,
        routineSets,
        tSessions,
        tLogs
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('routines',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('days_group', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('routines',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('days_group', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('exercises',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('routine_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('exercises',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('routine_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('days_group',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('routine_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('days_group',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('routine_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('routine_items',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('routine_sets', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('routine_items',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('routine_sets', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('t_sessions',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('t_logs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('t_sessions',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('t_logs', kind: UpdateKind.update),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  required String email,
  required AccountType type,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<String> email,
  Value<AccountType> type,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AccountType, AccountType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
    Account,
    PrefetchHooks Function()> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> email = const Value.absent(),
            Value<AccountType> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion(
            email: email,
            type: type,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String email,
            required AccountType type,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            email: email,
            type: type,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
    Account,
    PrefetchHooks Function()>;
typedef $$MembershipsTableCreateCompanionBuilder = MembershipsCompanion
    Function({
  Value<int> id,
  required String planId,
  required String planName,
  required double price,
  required DateTime startDate,
  required DateTime endDate,
  required bool isActive,
  required bool isGift,
});
typedef $$MembershipsTableUpdateCompanionBuilder = MembershipsCompanion
    Function({
  Value<int> id,
  Value<String> planId,
  Value<String> planName,
  Value<double> price,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<bool> isActive,
  Value<bool> isGift,
});

class $$MembershipsTableFilterComposer
    extends Composer<_$AppDatabase, $MembershipsTable> {
  $$MembershipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get planName => $composableBuilder(
      column: $table.planName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGift => $composableBuilder(
      column: $table.isGift, builder: (column) => ColumnFilters(column));
}

class $$MembershipsTableOrderingComposer
    extends Composer<_$AppDatabase, $MembershipsTable> {
  $$MembershipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planId => $composableBuilder(
      column: $table.planId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get planName => $composableBuilder(
      column: $table.planName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGift => $composableBuilder(
      column: $table.isGift, builder: (column) => ColumnOrderings(column));
}

class $$MembershipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembershipsTable> {
  $$MembershipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get planName =>
      $composableBuilder(column: $table.planName, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isGift =>
      $composableBuilder(column: $table.isGift, builder: (column) => column);
}

class $$MembershipsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MembershipsTable,
    Membership,
    $$MembershipsTableFilterComposer,
    $$MembershipsTableOrderingComposer,
    $$MembershipsTableAnnotationComposer,
    $$MembershipsTableCreateCompanionBuilder,
    $$MembershipsTableUpdateCompanionBuilder,
    (Membership, BaseReferences<_$AppDatabase, $MembershipsTable, Membership>),
    Membership,
    PrefetchHooks Function()> {
  $$MembershipsTableTableManager(_$AppDatabase db, $MembershipsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembershipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembershipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembershipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> planId = const Value.absent(),
            Value<String> planName = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isGift = const Value.absent(),
          }) =>
              MembershipsCompanion(
            id: id,
            planId: planId,
            planName: planName,
            price: price,
            startDate: startDate,
            endDate: endDate,
            isActive: isActive,
            isGift: isGift,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String planId,
            required String planName,
            required double price,
            required DateTime startDate,
            required DateTime endDate,
            required bool isActive,
            required bool isGift,
          }) =>
              MembershipsCompanion.insert(
            id: id,
            planId: planId,
            planName: planName,
            price: price,
            startDate: startDate,
            endDate: endDate,
            isActive: isActive,
            isGift: isGift,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MembershipsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MembershipsTable,
    Membership,
    $$MembershipsTableFilterComposer,
    $$MembershipsTableOrderingComposer,
    $$MembershipsTableAnnotationComposer,
    $$MembershipsTableCreateCompanionBuilder,
    $$MembershipsTableUpdateCompanionBuilder,
    (Membership, BaseReferences<_$AppDatabase, $MembershipsTable, Membership>),
    Membership,
    PrefetchHooks Function()>;
typedef $$RoutinesTableCreateCompanionBuilder = RoutinesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> version,
  required String name,
  Value<String?> description,
  Value<bool> isCurrent,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$RoutinesTableUpdateCompanionBuilder = RoutinesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> version,
  Value<String> name,
  Value<String?> description,
  Value<bool> isCurrent,
  Value<bool> isSynced,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$RoutinesTableReferences
    extends BaseReferences<_$AppDatabase, $RoutinesTable, Routine> {
  $$RoutinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DaysGroupTable, List<DaysGroupData>>
      _daysGroupRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.daysGroup,
              aliasName:
                  $_aliasNameGenerator(db.routines.id, db.daysGroup.routineId));

  $$DaysGroupTableProcessedTableManager get daysGroupRefs {
    final manager = $$DaysGroupTableTableManager($_db, $_db.daysGroup)
        .filter((f) => f.routineId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_daysGroupRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoutinesTableFilterComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCurrent => $composableBuilder(
      column: $table.isCurrent, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> daysGroupRefs(
      Expression<bool> Function($$DaysGroupTableFilterComposer f) f) {
    final $$DaysGroupTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.daysGroup,
        getReferencedColumn: (t) => t.routineId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DaysGroupTableFilterComposer(
              $db: $db,
              $table: $db.daysGroup,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutinesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
      column: $table.isCurrent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RoutinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> daysGroupRefs<T extends Object>(
      Expression<T> Function($$DaysGroupTableAnnotationComposer a) f) {
    final $$DaysGroupTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.daysGroup,
        getReferencedColumn: (t) => t.routineId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DaysGroupTableAnnotationComposer(
              $db: $db,
              $table: $db.daysGroup,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutinesTable,
    Routine,
    $$RoutinesTableFilterComposer,
    $$RoutinesTableOrderingComposer,
    $$RoutinesTableAnnotationComposer,
    $$RoutinesTableCreateCompanionBuilder,
    $$RoutinesTableUpdateCompanionBuilder,
    (Routine, $$RoutinesTableReferences),
    Routine,
    PrefetchHooks Function({bool daysGroupRefs})> {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isCurrent = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RoutinesCompanion(
            id: id,
            apiId: apiId,
            version: version,
            name: name,
            description: description,
            isCurrent: isCurrent,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<bool> isCurrent = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RoutinesCompanion.insert(
            id: id,
            apiId: apiId,
            version: version,
            name: name,
            description: description,
            isCurrent: isCurrent,
            isSynced: isSynced,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoutinesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({daysGroupRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (daysGroupRefs) db.daysGroup],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (daysGroupRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoutinesTableReferences._daysGroupRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutinesTableReferences(db, table, p0)
                                .daysGroupRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.routineId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoutinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutinesTable,
    Routine,
    $$RoutinesTableFilterComposer,
    $$RoutinesTableOrderingComposer,
    $$RoutinesTableAnnotationComposer,
    $$RoutinesTableCreateCompanionBuilder,
    $$RoutinesTableUpdateCompanionBuilder,
    (Routine, $$RoutinesTableReferences),
    Routine,
    PrefetchHooks Function({bool daysGroupRefs})>;
typedef $$DaysGroupTableCreateCompanionBuilder = DaysGroupCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  required int index,
  Value<int> version,
  required String dayName,
  Value<bool> isSynced,
  required int routineId,
});
typedef $$DaysGroupTableUpdateCompanionBuilder = DaysGroupCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> index,
  Value<int> version,
  Value<String> dayName,
  Value<bool> isSynced,
  Value<int> routineId,
});

final class $$DaysGroupTableReferences
    extends BaseReferences<_$AppDatabase, $DaysGroupTable, DaysGroupData> {
  $$DaysGroupTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutinesTable _routineIdTable(_$AppDatabase db) =>
      db.routines.createAlias(
          $_aliasNameGenerator(db.daysGroup.routineId, db.routines.id));

  $$RoutinesTableProcessedTableManager get routineId {
    final manager = $$RoutinesTableTableManager($_db, $_db.routines)
        .filter((f) => f.id($_item.routineId));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoutineItemsTable, List<RoutineItem>>
      _routineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.routineItems,
              aliasName:
                  $_aliasNameGenerator(db.daysGroup.id, db.routineItems.dayId));

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter((f) => f.dayId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_routineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DaysGroupTableFilterComposer
    extends Composer<_$AppDatabase, $DaysGroupTable> {
  $$DaysGroupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get index => $composableBuilder(
      column: $table.index, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dayName => $composableBuilder(
      column: $table.dayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$RoutinesTableFilterComposer get routineId {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineId,
        referencedTable: $db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutinesTableFilterComposer(
              $db: $db,
              $table: $db.routines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> routineItemsRefs(
      Expression<bool> Function($$RoutineItemsTableFilterComposer f) f) {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.dayId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableFilterComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DaysGroupTableOrderingComposer
    extends Composer<_$AppDatabase, $DaysGroupTable> {
  $$DaysGroupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get index => $composableBuilder(
      column: $table.index, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dayName => $composableBuilder(
      column: $table.dayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$RoutinesTableOrderingComposer get routineId {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineId,
        referencedTable: $db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutinesTableOrderingComposer(
              $db: $db,
              $table: $db.routines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DaysGroupTableAnnotationComposer
    extends Composer<_$AppDatabase, $DaysGroupTable> {
  $$DaysGroupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get dayName =>
      $composableBuilder(column: $table.dayName, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$RoutinesTableAnnotationComposer get routineId {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineId,
        referencedTable: $db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutinesTableAnnotationComposer(
              $db: $db,
              $table: $db.routines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> routineItemsRefs<T extends Object>(
      Expression<T> Function($$RoutineItemsTableAnnotationComposer a) f) {
    final $$RoutineItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.dayId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DaysGroupTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DaysGroupTable,
    DaysGroupData,
    $$DaysGroupTableFilterComposer,
    $$DaysGroupTableOrderingComposer,
    $$DaysGroupTableAnnotationComposer,
    $$DaysGroupTableCreateCompanionBuilder,
    $$DaysGroupTableUpdateCompanionBuilder,
    (DaysGroupData, $$DaysGroupTableReferences),
    DaysGroupData,
    PrefetchHooks Function({bool routineId, bool routineItemsRefs})> {
  $$DaysGroupTableTableManager(_$AppDatabase db, $DaysGroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DaysGroupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DaysGroupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DaysGroupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> index = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<String> dayName = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> routineId = const Value.absent(),
          }) =>
              DaysGroupCompanion(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            dayName: dayName,
            isSynced: isSynced,
            routineId: routineId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int index,
            Value<int> version = const Value.absent(),
            required String dayName,
            Value<bool> isSynced = const Value.absent(),
            required int routineId,
          }) =>
              DaysGroupCompanion.insert(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            dayName: dayName,
            isSynced: isSynced,
            routineId: routineId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DaysGroupTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {routineId = false, routineItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (routineItemsRefs) db.routineItems],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (routineId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routineId,
                    referencedTable:
                        $$DaysGroupTableReferences._routineIdTable(db),
                    referencedColumn:
                        $$DaysGroupTableReferences._routineIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DaysGroupTableReferences
                            ._routineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DaysGroupTableReferences(db, table, p0)
                                .routineItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.dayId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DaysGroupTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DaysGroupTable,
    DaysGroupData,
    $$DaysGroupTableFilterComposer,
    $$DaysGroupTableOrderingComposer,
    $$DaysGroupTableAnnotationComposer,
    $$DaysGroupTableCreateCompanionBuilder,
    $$DaysGroupTableUpdateCompanionBuilder,
    (DaysGroupData, $$DaysGroupTableReferences),
    DaysGroupData,
    PrefetchHooks Function({bool routineId, bool routineItemsRefs})>;
typedef $$ExerciseGroupsTableCreateCompanionBuilder = ExerciseGroupsCompanion
    Function({
  Value<int> id,
  required int apiId,
  required String muscleGroupTranslations,
});
typedef $$ExerciseGroupsTableUpdateCompanionBuilder = ExerciseGroupsCompanion
    Function({
  Value<int> id,
  Value<int> apiId,
  Value<String> muscleGroupTranslations,
});

final class $$ExerciseGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $ExerciseGroupsTable, ExerciseGroup> {
  $$ExerciseGroupsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
      _exercisesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exercises,
              aliasName: $_aliasNameGenerator(
                  db.exerciseGroups.id, db.exercises.muscleGroup));

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.muscleGroup.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExerciseGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseGroupsTable> {
  $$ExerciseGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get muscleGroupTranslations => $composableBuilder(
      column: $table.muscleGroupTranslations,
      builder: (column) => ColumnFilters(column));

  Expression<bool> exercisesRefs(
      Expression<bool> Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.muscleGroup,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExerciseGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseGroupsTable> {
  $$ExerciseGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get muscleGroupTranslations => $composableBuilder(
      column: $table.muscleGroupTranslations,
      builder: (column) => ColumnOrderings(column));
}

class $$ExerciseGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseGroupsTable> {
  $$ExerciseGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<String> get muscleGroupTranslations => $composableBuilder(
      column: $table.muscleGroupTranslations, builder: (column) => column);

  Expression<T> exercisesRefs<T extends Object>(
      Expression<T> Function($$ExercisesTableAnnotationComposer a) f) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.muscleGroup,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExerciseGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseGroupsTable,
    ExerciseGroup,
    $$ExerciseGroupsTableFilterComposer,
    $$ExerciseGroupsTableOrderingComposer,
    $$ExerciseGroupsTableAnnotationComposer,
    $$ExerciseGroupsTableCreateCompanionBuilder,
    $$ExerciseGroupsTableUpdateCompanionBuilder,
    (ExerciseGroup, $$ExerciseGroupsTableReferences),
    ExerciseGroup,
    PrefetchHooks Function({bool exercisesRefs})> {
  $$ExerciseGroupsTableTableManager(
      _$AppDatabase db, $ExerciseGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> apiId = const Value.absent(),
            Value<String> muscleGroupTranslations = const Value.absent(),
          }) =>
              ExerciseGroupsCompanion(
            id: id,
            apiId: apiId,
            muscleGroupTranslations: muscleGroupTranslations,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int apiId,
            required String muscleGroupTranslations,
          }) =>
              ExerciseGroupsCompanion.insert(
            id: id,
            apiId: apiId,
            muscleGroupTranslations: muscleGroupTranslations,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExerciseGroupsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({exercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (exercisesRefs) db.exercises],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExerciseGroupsTableReferences
                            ._exercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExerciseGroupsTableReferences(db, table, p0)
                                .exercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.muscleGroup == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExerciseGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExerciseGroupsTable,
    ExerciseGroup,
    $$ExerciseGroupsTableFilterComposer,
    $$ExerciseGroupsTableOrderingComposer,
    $$ExerciseGroupsTableAnnotationComposer,
    $$ExerciseGroupsTableCreateCompanionBuilder,
    $$ExerciseGroupsTableUpdateCompanionBuilder,
    (ExerciseGroup, $$ExerciseGroupsTableReferences),
    ExerciseGroup,
    PrefetchHooks Function({bool exercisesRefs})>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  required String name,
  required String imageUrl,
  required int muscleGroup,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<String> name,
  Value<String> imageUrl,
  Value<int> muscleGroup,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExerciseGroupsTable _muscleGroupTable(_$AppDatabase db) =>
      db.exerciseGroups.createAlias(
          $_aliasNameGenerator(db.exercises.muscleGroup, db.exerciseGroups.id));

  $$ExerciseGroupsTableProcessedTableManager get muscleGroup {
    final manager = $$ExerciseGroupsTableTableManager($_db, $_db.exerciseGroups)
        .filter((f) => f.id($_item.muscleGroup));
    final item = $_typedResult.readTableOrNull(_muscleGroupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoutineItemsTable, List<RoutineItem>>
      _routineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.routineItems,
              aliasName: $_aliasNameGenerator(
                  db.exercises.id, db.routineItems.exerciseId));

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter((f) => f.exerciseId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_routineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  $$ExerciseGroupsTableFilterComposer get muscleGroup {
    final $$ExerciseGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroup,
        referencedTable: $db.exerciseGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseGroupsTableFilterComposer(
              $db: $db,
              $table: $db.exerciseGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> routineItemsRefs(
      Expression<bool> Function($$RoutineItemsTableFilterComposer f) f) {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableFilterComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  $$ExerciseGroupsTableOrderingComposer get muscleGroup {
    final $$ExerciseGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroup,
        referencedTable: $db.exerciseGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.exerciseGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$ExerciseGroupsTableAnnotationComposer get muscleGroup {
    final $$ExerciseGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroup,
        referencedTable: $db.exerciseGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> routineItemsRefs<T extends Object>(
      Expression<T> Function($$RoutineItemsTableAnnotationComposer a) f) {
    final $$RoutineItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function({bool muscleGroup, bool routineItemsRefs})> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<int> muscleGroup = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            apiId: apiId,
            name: name,
            imageUrl: imageUrl,
            muscleGroup: muscleGroup,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required String name,
            required String imageUrl,
            required int muscleGroup,
          }) =>
              ExercisesCompanion.insert(
            id: id,
            apiId: apiId,
            name: name,
            imageUrl: imageUrl,
            muscleGroup: muscleGroup,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {muscleGroup = false, routineItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (routineItemsRefs) db.routineItems],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (muscleGroup) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.muscleGroup,
                    referencedTable:
                        $$ExercisesTableReferences._muscleGroupTable(db),
                    referencedColumn:
                        $$ExercisesTableReferences._muscleGroupTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExercisesTableReferences
                            ._routineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .routineItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function({bool muscleGroup, bool routineItemsRefs})>;
typedef $$RoutineItemsTableCreateCompanionBuilder = RoutineItemsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  required int index,
  Value<int> version,
  Value<String?> notes,
  Value<bool> isSynced,
  required int exerciseId,
  required int dayId,
});
typedef $$RoutineItemsTableUpdateCompanionBuilder = RoutineItemsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> index,
  Value<int> version,
  Value<String?> notes,
  Value<bool> isSynced,
  Value<int> exerciseId,
  Value<int> dayId,
});

final class $$RoutineItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RoutineItemsTable, RoutineItem> {
  $$RoutineItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
          $_aliasNameGenerator(db.routineItems.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exerciseId));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DaysGroupTable _dayIdTable(_$AppDatabase db) =>
      db.daysGroup.createAlias(
          $_aliasNameGenerator(db.routineItems.dayId, db.daysGroup.id));

  $$DaysGroupTableProcessedTableManager get dayId {
    final manager = $$DaysGroupTableTableManager($_db, $_db.daysGroup)
        .filter((f) => f.id($_item.dayId));
    final item = $_typedResult.readTableOrNull(_dayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoutineSetsTable, List<RoutineSet>>
      _routineSetsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.routineSets,
              aliasName: $_aliasNameGenerator(
                  db.routineItems.id, db.routineSets.routineItemId));

  $$RoutineSetsTableProcessedTableManager get routineSetsRefs {
    final manager = $$RoutineSetsTableTableManager($_db, $_db.routineSets)
        .filter((f) => f.routineItemId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_routineSetsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoutineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineItemsTable> {
  $$RoutineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get index => $composableBuilder(
      column: $table.index, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DaysGroupTableFilterComposer get dayId {
    final $$DaysGroupTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.daysGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DaysGroupTableFilterComposer(
              $db: $db,
              $table: $db.daysGroup,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> routineSetsRefs(
      Expression<bool> Function($$RoutineSetsTableFilterComposer f) f) {
    final $$RoutineSetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineSets,
        getReferencedColumn: (t) => t.routineItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineSetsTableFilterComposer(
              $db: $db,
              $table: $db.routineSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineItemsTable> {
  $$RoutineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get index => $composableBuilder(
      column: $table.index, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DaysGroupTableOrderingComposer get dayId {
    final $$DaysGroupTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.daysGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DaysGroupTableOrderingComposer(
              $db: $db,
              $table: $db.daysGroup,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoutineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineItemsTable> {
  $$RoutineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DaysGroupTableAnnotationComposer get dayId {
    final $$DaysGroupTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.dayId,
        referencedTable: $db.daysGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DaysGroupTableAnnotationComposer(
              $db: $db,
              $table: $db.daysGroup,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> routineSetsRefs<T extends Object>(
      Expression<T> Function($$RoutineSetsTableAnnotationComposer a) f) {
    final $$RoutineSetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.routineSets,
        getReferencedColumn: (t) => t.routineItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineSetsTableAnnotationComposer(
              $db: $db,
              $table: $db.routineSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutineItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutineItemsTable,
    RoutineItem,
    $$RoutineItemsTableFilterComposer,
    $$RoutineItemsTableOrderingComposer,
    $$RoutineItemsTableAnnotationComposer,
    $$RoutineItemsTableCreateCompanionBuilder,
    $$RoutineItemsTableUpdateCompanionBuilder,
    (RoutineItem, $$RoutineItemsTableReferences),
    RoutineItem,
    PrefetchHooks Function(
        {bool exerciseId, bool dayId, bool routineSetsRefs})> {
  $$RoutineItemsTableTableManager(_$AppDatabase db, $RoutineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> index = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> exerciseId = const Value.absent(),
            Value<int> dayId = const Value.absent(),
          }) =>
              RoutineItemsCompanion(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            notes: notes,
            isSynced: isSynced,
            exerciseId: exerciseId,
            dayId: dayId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int index,
            Value<int> version = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            required int exerciseId,
            required int dayId,
          }) =>
              RoutineItemsCompanion.insert(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            notes: notes,
            isSynced: isSynced,
            exerciseId: exerciseId,
            dayId: dayId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoutineItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {exerciseId = false, dayId = false, routineSetsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (routineSetsRefs) db.routineSets],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable:
                        $$RoutineItemsTableReferences._exerciseIdTable(db),
                    referencedColumn:
                        $$RoutineItemsTableReferences._exerciseIdTable(db).id,
                  ) as T;
                }
                if (dayId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.dayId,
                    referencedTable:
                        $$RoutineItemsTableReferences._dayIdTable(db),
                    referencedColumn:
                        $$RoutineItemsTableReferences._dayIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routineSetsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoutineItemsTableReferences
                            ._routineSetsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutineItemsTableReferences(db, table, p0)
                                .routineSetsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.routineItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoutineItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutineItemsTable,
    RoutineItem,
    $$RoutineItemsTableFilterComposer,
    $$RoutineItemsTableOrderingComposer,
    $$RoutineItemsTableAnnotationComposer,
    $$RoutineItemsTableCreateCompanionBuilder,
    $$RoutineItemsTableUpdateCompanionBuilder,
    (RoutineItem, $$RoutineItemsTableReferences),
    RoutineItem,
    PrefetchHooks Function(
        {bool exerciseId, bool dayId, bool routineSetsRefs})>;
typedef $$RoutineSetsTableCreateCompanionBuilder = RoutineSetsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  required int roundIndex,
  required int repsCount,
  Value<int> version,
  Value<bool> isSynced,
  required int routineItemId,
});
typedef $$RoutineSetsTableUpdateCompanionBuilder = RoutineSetsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> roundIndex,
  Value<int> repsCount,
  Value<int> version,
  Value<bool> isSynced,
  Value<int> routineItemId,
});

final class $$RoutineSetsTableReferences
    extends BaseReferences<_$AppDatabase, $RoutineSetsTable, RoutineSet> {
  $$RoutineSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutineItemsTable _routineItemIdTable(_$AppDatabase db) =>
      db.routineItems.createAlias($_aliasNameGenerator(
          db.routineSets.routineItemId, db.routineItems.id));

  $$RoutineItemsTableProcessedTableManager get routineItemId {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter((f) => f.id($_item.routineItemId));
    final item = $_typedResult.readTableOrNull(_routineItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoutineSetsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineSetsTable> {
  $$RoutineSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get roundIndex => $composableBuilder(
      column: $table.roundIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repsCount => $composableBuilder(
      column: $table.repsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$RoutineItemsTableFilterComposer get routineItemId {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableFilterComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoutineSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineSetsTable> {
  $$RoutineSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get roundIndex => $composableBuilder(
      column: $table.roundIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repsCount => $composableBuilder(
      column: $table.repsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$RoutineItemsTableOrderingComposer get routineItemId {
    final $$RoutineItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableOrderingComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoutineSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineSetsTable> {
  $$RoutineSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get roundIndex => $composableBuilder(
      column: $table.roundIndex, builder: (column) => column);

  GeneratedColumn<int> get repsCount =>
      $composableBuilder(column: $table.repsCount, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$RoutineItemsTableAnnotationComposer get routineItemId {
    final $$RoutineItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
        referencedTable: $db.routineItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutineItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.routineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoutineSetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutineSetsTable,
    RoutineSet,
    $$RoutineSetsTableFilterComposer,
    $$RoutineSetsTableOrderingComposer,
    $$RoutineSetsTableAnnotationComposer,
    $$RoutineSetsTableCreateCompanionBuilder,
    $$RoutineSetsTableUpdateCompanionBuilder,
    (RoutineSet, $$RoutineSetsTableReferences),
    RoutineSet,
    PrefetchHooks Function({bool routineItemId})> {
  $$RoutineSetsTableTableManager(_$AppDatabase db, $RoutineSetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> roundIndex = const Value.absent(),
            Value<int> repsCount = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> routineItemId = const Value.absent(),
          }) =>
              RoutineSetsCompanion(
            id: id,
            apiId: apiId,
            roundIndex: roundIndex,
            repsCount: repsCount,
            version: version,
            isSynced: isSynced,
            routineItemId: routineItemId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int roundIndex,
            required int repsCount,
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            required int routineItemId,
          }) =>
              RoutineSetsCompanion.insert(
            id: id,
            apiId: apiId,
            roundIndex: roundIndex,
            repsCount: repsCount,
            version: version,
            isSynced: isSynced,
            routineItemId: routineItemId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoutineSetsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({routineItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (routineItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routineItemId,
                    referencedTable:
                        $$RoutineSetsTableReferences._routineItemIdTable(db),
                    referencedColumn:
                        $$RoutineSetsTableReferences._routineItemIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RoutineSetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutineSetsTable,
    RoutineSet,
    $$RoutineSetsTableFilterComposer,
    $$RoutineSetsTableOrderingComposer,
    $$RoutineSetsTableAnnotationComposer,
    $$RoutineSetsTableCreateCompanionBuilder,
    $$RoutineSetsTableUpdateCompanionBuilder,
    (RoutineSet, $$RoutineSetsTableReferences),
    RoutineSet,
    PrefetchHooks Function({bool routineItemId})>;
typedef $$TSessionsTableCreateCompanionBuilder = TSessionsCompanion Function({
  Value<int> tsId,
  required int dayId,
  required DateTime startedAt,
  Value<DateTime?> finishedAt,
  Value<double> progress,
  Value<int?> apiId,
  Value<int> version,
  Value<bool> isSynced,
});
typedef $$TSessionsTableUpdateCompanionBuilder = TSessionsCompanion Function({
  Value<int> tsId,
  Value<int> dayId,
  Value<DateTime> startedAt,
  Value<DateTime?> finishedAt,
  Value<double> progress,
  Value<int?> apiId,
  Value<int> version,
  Value<bool> isSynced,
});

final class $$TSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $TSessionsTable, TSession> {
  $$TSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TLogsTable, List<TLog>> _tLogsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tLogs,
          aliasName:
              $_aliasNameGenerator(db.tSessions.tsId, db.tLogs.sessionId));

  $$TLogsTableProcessedTableManager get tLogsRefs {
    final manager = $$TLogsTableTableManager($_db, $_db.tLogs)
        .filter((f) => f.sessionId.tsId($_item.tsId));

    final cache = $_typedResult.readTableOrNull(_tLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $TSessionsTable> {
  $$TSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get tsId => $composableBuilder(
      column: $table.tsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayId => $composableBuilder(
      column: $table.dayId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  Expression<bool> tLogsRefs(
      Expression<bool> Function($$TLogsTableFilterComposer f) f) {
    final $$TLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tsId,
        referencedTable: $db.tLogs,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TLogsTableFilterComposer(
              $db: $db,
              $table: $db.tLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TSessionsTable> {
  $$TSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get tsId => $composableBuilder(
      column: $table.tsId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayId => $composableBuilder(
      column: $table.dayId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$TSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TSessionsTable> {
  $$TSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get tsId =>
      $composableBuilder(column: $table.tsId, builder: (column) => column);

  GeneratedColumn<int> get dayId =>
      $composableBuilder(column: $table.dayId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> tLogsRefs<T extends Object>(
      Expression<T> Function($$TLogsTableAnnotationComposer a) f) {
    final $$TLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tsId,
        referencedTable: $db.tLogs,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.tLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TSessionsTable,
    TSession,
    $$TSessionsTableFilterComposer,
    $$TSessionsTableOrderingComposer,
    $$TSessionsTableAnnotationComposer,
    $$TSessionsTableCreateCompanionBuilder,
    $$TSessionsTableUpdateCompanionBuilder,
    (TSession, $$TSessionsTableReferences),
    TSession,
    PrefetchHooks Function({bool tLogsRefs})> {
  $$TSessionsTableTableManager(_$AppDatabase db, $TSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> tsId = const Value.absent(),
            Value<int> dayId = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> finishedAt = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              TSessionsCompanion(
            tsId: tsId,
            dayId: dayId,
            startedAt: startedAt,
            finishedAt: finishedAt,
            progress: progress,
            apiId: apiId,
            version: version,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> tsId = const Value.absent(),
            required int dayId,
            required DateTime startedAt,
            Value<DateTime?> finishedAt = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              TSessionsCompanion.insert(
            tsId: tsId,
            dayId: dayId,
            startedAt: startedAt,
            finishedAt: finishedAt,
            progress: progress,
            apiId: apiId,
            version: version,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TSessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tLogsRefs) db.tLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tLogsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TSessionsTableReferences._tLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TSessionsTableReferences(db, table, p0).tLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.sessionId == item.tsId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TSessionsTable,
    TSession,
    $$TSessionsTableFilterComposer,
    $$TSessionsTableOrderingComposer,
    $$TSessionsTableAnnotationComposer,
    $$TSessionsTableCreateCompanionBuilder,
    $$TSessionsTableUpdateCompanionBuilder,
    (TSession, $$TSessionsTableReferences),
    TSession,
    PrefetchHooks Function({bool tLogsRefs})>;
typedef $$TLogsTableCreateCompanionBuilder = TLogsCompanion Function({
  Value<int> logId,
  required int exerciseId,
  required int exerciseIndex,
  required int setIndex,
  required int reps,
  required double weight,
  required DateTime completedAt,
  Value<int?> apiId,
  Value<int> version,
  Value<bool> isSynced,
  required int sessionId,
});
typedef $$TLogsTableUpdateCompanionBuilder = TLogsCompanion Function({
  Value<int> logId,
  Value<int> exerciseId,
  Value<int> exerciseIndex,
  Value<int> setIndex,
  Value<int> reps,
  Value<double> weight,
  Value<DateTime> completedAt,
  Value<int?> apiId,
  Value<int> version,
  Value<bool> isSynced,
  Value<int> sessionId,
});

final class $$TLogsTableReferences
    extends BaseReferences<_$AppDatabase, $TLogsTable, TLog> {
  $$TLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TSessionsTable _sessionIdTable(_$AppDatabase db) => db.tSessions
      .createAlias($_aliasNameGenerator(db.tLogs.sessionId, db.tSessions.tsId));

  $$TSessionsTableProcessedTableManager get sessionId {
    final manager = $$TSessionsTableTableManager($_db, $_db.tSessions)
        .filter((f) => f.tsId($_item.sessionId));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TLogsTableFilterComposer extends Composer<_$AppDatabase, $TLogsTable> {
  $$TLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get logId => $composableBuilder(
      column: $table.logId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseIndex => $composableBuilder(
      column: $table.exerciseIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get setIndex => $composableBuilder(
      column: $table.setIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$TSessionsTableFilterComposer get sessionId {
    final $$TSessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.tSessions,
        getReferencedColumn: (t) => t.tsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TSessionsTableFilterComposer(
              $db: $db,
              $table: $db.tSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $TLogsTable> {
  $$TLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get logId => $composableBuilder(
      column: $table.logId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseIndex => $composableBuilder(
      column: $table.exerciseIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get setIndex => $composableBuilder(
      column: $table.setIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get apiId => $composableBuilder(
      column: $table.apiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$TSessionsTableOrderingComposer get sessionId {
    final $$TSessionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.tSessions,
        getReferencedColumn: (t) => t.tsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TSessionsTableOrderingComposer(
              $db: $db,
              $table: $db.tSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TLogsTable> {
  $$TLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get logId =>
      $composableBuilder(column: $table.logId, builder: (column) => column);

  GeneratedColumn<int> get exerciseId => $composableBuilder(
      column: $table.exerciseId, builder: (column) => column);

  GeneratedColumn<int> get exerciseIndex => $composableBuilder(
      column: $table.exerciseIndex, builder: (column) => column);

  GeneratedColumn<int> get setIndex =>
      $composableBuilder(column: $table.setIndex, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$TSessionsTableAnnotationComposer get sessionId {
    final $$TSessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.tSessions,
        getReferencedColumn: (t) => t.tsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TSessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.tSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TLogsTable,
    TLog,
    $$TLogsTableFilterComposer,
    $$TLogsTableOrderingComposer,
    $$TLogsTableAnnotationComposer,
    $$TLogsTableCreateCompanionBuilder,
    $$TLogsTableUpdateCompanionBuilder,
    (TLog, $$TLogsTableReferences),
    TLog,
    PrefetchHooks Function({bool sessionId})> {
  $$TLogsTableTableManager(_$AppDatabase db, $TLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> logId = const Value.absent(),
            Value<int> exerciseId = const Value.absent(),
            Value<int> exerciseIndex = const Value.absent(),
            Value<int> setIndex = const Value.absent(),
            Value<int> reps = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<DateTime> completedAt = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> sessionId = const Value.absent(),
          }) =>
              TLogsCompanion(
            logId: logId,
            exerciseId: exerciseId,
            exerciseIndex: exerciseIndex,
            setIndex: setIndex,
            reps: reps,
            weight: weight,
            completedAt: completedAt,
            apiId: apiId,
            version: version,
            isSynced: isSynced,
            sessionId: sessionId,
          ),
          createCompanionCallback: ({
            Value<int> logId = const Value.absent(),
            required int exerciseId,
            required int exerciseIndex,
            required int setIndex,
            required int reps,
            required double weight,
            required DateTime completedAt,
            Value<int?> apiId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            required int sessionId,
          }) =>
              TLogsCompanion.insert(
            logId: logId,
            exerciseId: exerciseId,
            exerciseIndex: exerciseIndex,
            setIndex: setIndex,
            reps: reps,
            weight: weight,
            completedAt: completedAt,
            apiId: apiId,
            version: version,
            isSynced: isSynced,
            sessionId: sessionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TLogsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (sessionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sessionId,
                    referencedTable: $$TLogsTableReferences._sessionIdTable(db),
                    referencedColumn:
                        $$TLogsTableReferences._sessionIdTable(db).tsId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TLogsTable,
    TLog,
    $$TLogsTableFilterComposer,
    $$TLogsTableOrderingComposer,
    $$TLogsTableAnnotationComposer,
    $$TLogsTableCreateCompanionBuilder,
    $$TLogsTableUpdateCompanionBuilder,
    (TLog, $$TLogsTableReferences),
    TLog,
    PrefetchHooks Function({bool sessionId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$MembershipsTableTableManager get memberships =>
      $$MembershipsTableTableManager(_db, _db.memberships);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$DaysGroupTableTableManager get daysGroup =>
      $$DaysGroupTableTableManager(_db, _db.daysGroup);
  $$ExerciseGroupsTableTableManager get exerciseGroups =>
      $$ExerciseGroupsTableTableManager(_db, _db.exerciseGroups);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$RoutineItemsTableTableManager get routineItems =>
      $$RoutineItemsTableTableManager(_db, _db.routineItems);
  $$RoutineSetsTableTableManager get routineSets =>
      $$RoutineSetsTableTableManager(_db, _db.routineSets);
  $$TSessionsTableTableManager get tSessions =>
      $$TSessionsTableTableManager(_db, _db.tSessions);
  $$TLogsTableTableManager get tLogs =>
      $$TLogsTableTableManager(_db, _db.tLogs);
}
