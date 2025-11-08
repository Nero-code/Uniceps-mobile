// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Accounts extends Table with TableInfo<Accounts, AccountsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Accounts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uid, email, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AccountsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountsData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }
}

class AccountsData extends DataClass implements Insertable<AccountsData> {
  final String uid;
  final String email;
  final String type;
  final DateTime createdAt;
  const AccountsData(
      {required this.uid,
      required this.email,
      required this.type,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['email'] = Variable<String>(email);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      uid: Value(uid),
      email: Value(email),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory AccountsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountsData(
      uid: serializer.fromJson<String>(json['uid']),
      email: serializer.fromJson<String>(json['email']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'email': serializer.toJson<String>(email),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AccountsData copyWith(
          {String? uid, String? email, String? type, DateTime? createdAt}) =>
      AccountsData(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  AccountsData copyWithCompanion(AccountsCompanion data) {
    return AccountsData(
      uid: data.uid.present ? data.uid.value : this.uid,
      email: data.email.present ? data.email.value : this.email,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountsData(')
          ..write('uid: $uid, ')
          ..write('email: $email, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, email, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountsData &&
          other.uid == this.uid &&
          other.email == this.email &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class AccountsCompanion extends UpdateCompanion<AccountsData> {
  final Value<String> uid;
  final Value<String> email;
  final Value<String> type;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AccountsCompanion({
    this.uid = const Value.absent(),
    this.email = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String uid,
    required String email,
    required String type,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        email = Value(email),
        type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<AccountsData> custom({
    Expression<String>? uid,
    Expression<String>? email,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (email != null) 'email': email,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith(
      {Value<String>? uid,
      Value<String>? email,
      Value<String>? type,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AccountsCompanion(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
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
          ..write('uid: $uid, ')
          ..write('email: $email, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Memberships extends Table with TableInfo<Memberships, MembershipsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Memberships(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> planName = GeneratedColumn<String>(
      'plan_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MembershipsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MembershipsData(
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
  Memberships createAlias(String alias) {
    return Memberships(attachedDatabase, alias);
  }
}

class MembershipsData extends DataClass implements Insertable<MembershipsData> {
  final int id;
  final String planId;
  final String planName;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isGift;
  const MembershipsData(
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

  factory MembershipsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MembershipsData(
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

  MembershipsData copyWith(
          {int? id,
          String? planId,
          String? planName,
          double? price,
          DateTime? startDate,
          DateTime? endDate,
          bool? isActive,
          bool? isGift}) =>
      MembershipsData(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        planName: planName ?? this.planName,
        price: price ?? this.price,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isActive: isActive ?? this.isActive,
        isGift: isGift ?? this.isGift,
      );
  MembershipsData copyWithCompanion(MembershipsCompanion data) {
    return MembershipsData(
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
    return (StringBuffer('MembershipsData(')
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
      (other is MembershipsData &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.planName == this.planName &&
          other.price == this.price &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.isGift == this.isGift);
}

class MembershipsCompanion extends UpdateCompanion<MembershipsData> {
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
  static Insertable<MembershipsData> custom({
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

class Routines extends Table with TableInfo<Routines, RoutinesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Routines(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
      'is_current', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_current" IN (0, 1))'));
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression(
          'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)'));
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression(
          'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutinesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutinesData(
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
  Routines createAlias(String alias) {
    return Routines(attachedDatabase, alias);
  }
}

class RoutinesData extends DataClass implements Insertable<RoutinesData> {
  final int id;
  final int? apiId;
  final int version;
  final String name;
  final String? description;
  final bool isCurrent;
  final bool isSynced;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RoutinesData(
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

  factory RoutinesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutinesData(
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

  RoutinesData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? version,
          String? name,
          Value<String?> description = const Value.absent(),
          bool? isCurrent,
          bool? isSynced,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      RoutinesData(
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
  RoutinesData copyWithCompanion(RoutinesCompanion data) {
    return RoutinesData(
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
    return (StringBuffer('RoutinesData(')
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
      (other is RoutinesData &&
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

class RoutinesCompanion extends UpdateCompanion<RoutinesData> {
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
    required int version,
    required String name,
    this.description = const Value.absent(),
    required bool isCurrent,
    required bool isSynced,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : version = Value(version),
        name = Value(name),
        isCurrent = Value(isCurrent),
        isSynced = Value(isSynced);
  static Insertable<RoutinesData> custom({
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

class DaysGroup extends Table with TableInfo<DaysGroup, DaysGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DaysGroup(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
      'day_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'));
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
  DaysGroup createAlias(String alias) {
    return DaysGroup(attachedDatabase, alias);
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
    required int version,
    required String dayName,
    required bool isSynced,
    required int routineId,
  })  : index = Value(index),
        version = Value(version),
        dayName = Value(dayName),
        isSynced = Value(isSynced),
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

class ExerciseGroups extends Table
    with TableInfo<ExerciseGroups, ExerciseGroupsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ExerciseGroups(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {apiId},
      ];
  @override
  ExerciseGroupsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseGroupsData(
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
  ExerciseGroups createAlias(String alias) {
    return ExerciseGroups(attachedDatabase, alias);
  }
}

class ExerciseGroupsData extends DataClass
    implements Insertable<ExerciseGroupsData> {
  final int id;
  final int apiId;
  final String muscleGroupTranslations;
  const ExerciseGroupsData(
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

  factory ExerciseGroupsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseGroupsData(
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

  ExerciseGroupsData copyWith(
          {int? id, int? apiId, String? muscleGroupTranslations}) =>
      ExerciseGroupsData(
        id: id ?? this.id,
        apiId: apiId ?? this.apiId,
        muscleGroupTranslations:
            muscleGroupTranslations ?? this.muscleGroupTranslations,
      );
  ExerciseGroupsData copyWithCompanion(ExerciseGroupsCompanion data) {
    return ExerciseGroupsData(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      muscleGroupTranslations: data.muscleGroupTranslations.present
          ? data.muscleGroupTranslations.value
          : this.muscleGroupTranslations,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseGroupsData(')
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
      (other is ExerciseGroupsData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.muscleGroupTranslations == this.muscleGroupTranslations);
}

class ExerciseGroupsCompanion extends UpdateCompanion<ExerciseGroupsData> {
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
  static Insertable<ExerciseGroupsData> custom({
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

class Exercises extends Table with TableInfo<Exercises, ExercisesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Exercises(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {apiId},
      ];
  @override
  ExercisesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesData(
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
  Exercises createAlias(String alias) {
    return Exercises(attachedDatabase, alias);
  }
}

class ExercisesData extends DataClass implements Insertable<ExercisesData> {
  final int id;
  final int? apiId;
  final String name;
  final String imageUrl;
  final int muscleGroup;
  const ExercisesData(
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

  factory ExercisesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesData(
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

  ExercisesData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          String? name,
          String? imageUrl,
          int? muscleGroup}) =>
      ExercisesData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        muscleGroup: muscleGroup ?? this.muscleGroup,
      );
  ExercisesData copyWithCompanion(ExercisesCompanion data) {
    return ExercisesData(
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
    return (StringBuffer('ExercisesData(')
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
      (other is ExercisesData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.muscleGroup == this.muscleGroup);
}

class ExercisesCompanion extends UpdateCompanion<ExercisesData> {
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
  static Insertable<ExercisesData> custom({
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

class RoutineItems extends Table
    with TableInfo<RoutineItems, RoutineItemsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RoutineItems(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'));
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id) ON UPDATE CASCADE ON DELETE CASCADE'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineItemsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineItemsData(
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
  RoutineItems createAlias(String alias) {
    return RoutineItems(attachedDatabase, alias);
  }
}

class RoutineItemsData extends DataClass
    implements Insertable<RoutineItemsData> {
  final int id;
  final int? apiId;
  final int index;
  final int version;
  final String? notes;
  final bool isSynced;
  final int exerciseId;
  final int dayId;
  const RoutineItemsData(
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

  factory RoutineItemsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineItemsData(
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

  RoutineItemsData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          int? version,
          Value<String?> notes = const Value.absent(),
          bool? isSynced,
          int? exerciseId,
          int? dayId}) =>
      RoutineItemsData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        version: version ?? this.version,
        notes: notes.present ? notes.value : this.notes,
        isSynced: isSynced ?? this.isSynced,
        exerciseId: exerciseId ?? this.exerciseId,
        dayId: dayId ?? this.dayId,
      );
  RoutineItemsData copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItemsData(
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
    return (StringBuffer('RoutineItemsData(')
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
      (other is RoutineItemsData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.version == this.version &&
          other.notes == this.notes &&
          other.isSynced == this.isSynced &&
          other.exerciseId == this.exerciseId &&
          other.dayId == this.dayId);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItemsData> {
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
    required int version,
    this.notes = const Value.absent(),
    required bool isSynced,
    required int exerciseId,
    required int dayId,
  })  : index = Value(index),
        version = Value(version),
        isSynced = Value(isSynced),
        exerciseId = Value(exerciseId),
        dayId = Value(dayId);
  static Insertable<RoutineItemsData> custom({
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

class RoutineSets extends Table with TableInfo<RoutineSets, RoutineSetsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RoutineSets(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> roundIndex = GeneratedColumn<int>(
      'round_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> repsCount = GeneratedColumn<int>(
      'reps_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineSetsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineSetsData(
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
  RoutineSets createAlias(String alias) {
    return RoutineSets(attachedDatabase, alias);
  }
}

class RoutineSetsData extends DataClass implements Insertable<RoutineSetsData> {
  final int id;
  final int? apiId;
  final int roundIndex;
  final int repsCount;
  final int version;
  final bool isSynced;
  final int routineItemId;
  const RoutineSetsData(
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

  factory RoutineSetsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineSetsData(
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

  RoutineSetsData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? roundIndex,
          int? repsCount,
          int? version,
          bool? isSynced,
          int? routineItemId}) =>
      RoutineSetsData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        roundIndex: roundIndex ?? this.roundIndex,
        repsCount: repsCount ?? this.repsCount,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
        routineItemId: routineItemId ?? this.routineItemId,
      );
  RoutineSetsData copyWithCompanion(RoutineSetsCompanion data) {
    return RoutineSetsData(
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
    return (StringBuffer('RoutineSetsData(')
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
      (other is RoutineSetsData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.roundIndex == this.roundIndex &&
          other.repsCount == this.repsCount &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.routineItemId == this.routineItemId);
}

class RoutineSetsCompanion extends UpdateCompanion<RoutineSetsData> {
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
    required int version,
    required bool isSynced,
    required int routineItemId,
  })  : roundIndex = Value(roundIndex),
        repsCount = Value(repsCount),
        version = Value(version),
        isSynced = Value(isSynced),
        routineItemId = Value(routineItemId);
  static Insertable<RoutineSetsData> custom({
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

class TSessions extends Table with TableInfo<TSessions, TSessionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TSessions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> tsId = GeneratedColumn<int>(
      'ts_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0.0'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns =>
      [tsId, dayId, startedAt, finishedAt, progress, apiId, version, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 't_sessions';
  @override
  Set<GeneratedColumn> get $primaryKey => {tsId};
  @override
  TSessionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TSessionsData(
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
  TSessions createAlias(String alias) {
    return TSessions(attachedDatabase, alias);
  }
}

class TSessionsData extends DataClass implements Insertable<TSessionsData> {
  final int tsId;
  final int dayId;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final double progress;
  final int? apiId;
  final int version;
  final bool isSynced;
  const TSessionsData(
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

  factory TSessionsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TSessionsData(
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

  TSessionsData copyWith(
          {int? tsId,
          int? dayId,
          DateTime? startedAt,
          Value<DateTime?> finishedAt = const Value.absent(),
          double? progress,
          Value<int?> apiId = const Value.absent(),
          int? version,
          bool? isSynced}) =>
      TSessionsData(
        tsId: tsId ?? this.tsId,
        dayId: dayId ?? this.dayId,
        startedAt: startedAt ?? this.startedAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
        progress: progress ?? this.progress,
        apiId: apiId.present ? apiId.value : this.apiId,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
      );
  TSessionsData copyWithCompanion(TSessionsCompanion data) {
    return TSessionsData(
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
    return (StringBuffer('TSessionsData(')
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
      (other is TSessionsData &&
          other.tsId == this.tsId &&
          other.dayId == this.dayId &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.progress == this.progress &&
          other.apiId == this.apiId &&
          other.version == this.version &&
          other.isSynced == this.isSynced);
}

class TSessionsCompanion extends UpdateCompanion<TSessionsData> {
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
  static Insertable<TSessionsData> custom({
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

class TLogs extends Table with TableInfo<TLogs, TLogsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TLogs(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> logId = GeneratedColumn<int>(
      'log_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> exerciseIndex = GeneratedColumn<int>(
      'exercise_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> setIndex = GeneratedColumn<int>(
      'set_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
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
  Set<GeneratedColumn> get $primaryKey => {logId};
  @override
  TLogsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TLogsData(
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
  TLogs createAlias(String alias) {
    return TLogs(attachedDatabase, alias);
  }
}

class TLogsData extends DataClass implements Insertable<TLogsData> {
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
  const TLogsData(
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

  factory TLogsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TLogsData(
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

  TLogsData copyWith(
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
      TLogsData(
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
  TLogsData copyWithCompanion(TLogsCompanion data) {
    return TLogsData(
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
    return (StringBuffer('TLogsData(')
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
      (other is TLogsData &&
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

class TLogsCompanion extends UpdateCompanion<TLogsData> {
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
  static Insertable<TLogsData> custom({
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

class Measurements extends Table
    with TableInfo<Measurements, MeasurementsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Measurements(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> lArm = GeneratedColumn<double>(
      'l_arm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> rArm = GeneratedColumn<double>(
      'r_arm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> lHumerus = GeneratedColumn<double>(
      'l_humerus', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> rHumerus = GeneratedColumn<double>(
      'r_humerus', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> lThigh = GeneratedColumn<double>(
      'l_thigh', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> rThigh = GeneratedColumn<double>(
      'r_thigh', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> lLeg = GeneratedColumn<double>(
      'l_leg', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> rLeg = GeneratedColumn<double>(
      'r_leg', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> neck = GeneratedColumn<double>(
      'neck', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> shoulders = GeneratedColumn<double>(
      'shoulders', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
      'waist', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
      'chest', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> hips = GeneratedColumn<double>(
      'hips', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> checkDate = GeneratedColumn<DateTime>(
      'check_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        apiId,
        height,
        weight,
        lArm,
        rArm,
        lHumerus,
        rHumerus,
        lThigh,
        rThigh,
        lLeg,
        rLeg,
        neck,
        shoulders,
        waist,
        chest,
        hips,
        checkDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'measurements';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeasurementsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeasurementsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      lArm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}l_arm'])!,
      rArm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}r_arm'])!,
      lHumerus: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}l_humerus'])!,
      rHumerus: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}r_humerus'])!,
      lThigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}l_thigh'])!,
      rThigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}r_thigh'])!,
      lLeg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}l_leg'])!,
      rLeg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}r_leg'])!,
      neck: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}neck'])!,
      shoulders: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shoulders'])!,
      waist: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}waist'])!,
      chest: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}chest'])!,
      hips: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hips'])!,
      checkDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}check_date'])!,
    );
  }

  @override
  Measurements createAlias(String alias) {
    return Measurements(attachedDatabase, alias);
  }
}

class MeasurementsData extends DataClass
    implements Insertable<MeasurementsData> {
  final int id;
  final int? apiId;
  final double height;
  final double weight;
  final double lArm;
  final double rArm;
  final double lHumerus;
  final double rHumerus;
  final double lThigh;
  final double rThigh;
  final double lLeg;
  final double rLeg;
  final double neck;
  final double shoulders;
  final double waist;
  final double chest;
  final double hips;
  final DateTime checkDate;
  const MeasurementsData(
      {required this.id,
      this.apiId,
      required this.height,
      required this.weight,
      required this.lArm,
      required this.rArm,
      required this.lHumerus,
      required this.rHumerus,
      required this.lThigh,
      required this.rThigh,
      required this.lLeg,
      required this.rLeg,
      required this.neck,
      required this.shoulders,
      required this.waist,
      required this.chest,
      required this.hips,
      required this.checkDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['height'] = Variable<double>(height);
    map['weight'] = Variable<double>(weight);
    map['l_arm'] = Variable<double>(lArm);
    map['r_arm'] = Variable<double>(rArm);
    map['l_humerus'] = Variable<double>(lHumerus);
    map['r_humerus'] = Variable<double>(rHumerus);
    map['l_thigh'] = Variable<double>(lThigh);
    map['r_thigh'] = Variable<double>(rThigh);
    map['l_leg'] = Variable<double>(lLeg);
    map['r_leg'] = Variable<double>(rLeg);
    map['neck'] = Variable<double>(neck);
    map['shoulders'] = Variable<double>(shoulders);
    map['waist'] = Variable<double>(waist);
    map['chest'] = Variable<double>(chest);
    map['hips'] = Variable<double>(hips);
    map['check_date'] = Variable<DateTime>(checkDate);
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      height: Value(height),
      weight: Value(weight),
      lArm: Value(lArm),
      rArm: Value(rArm),
      lHumerus: Value(lHumerus),
      rHumerus: Value(rHumerus),
      lThigh: Value(lThigh),
      rThigh: Value(rThigh),
      lLeg: Value(lLeg),
      rLeg: Value(rLeg),
      neck: Value(neck),
      shoulders: Value(shoulders),
      waist: Value(waist),
      chest: Value(chest),
      hips: Value(hips),
      checkDate: Value(checkDate),
    );
  }

  factory MeasurementsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeasurementsData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      height: serializer.fromJson<double>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      lArm: serializer.fromJson<double>(json['lArm']),
      rArm: serializer.fromJson<double>(json['rArm']),
      lHumerus: serializer.fromJson<double>(json['lHumerus']),
      rHumerus: serializer.fromJson<double>(json['rHumerus']),
      lThigh: serializer.fromJson<double>(json['lThigh']),
      rThigh: serializer.fromJson<double>(json['rThigh']),
      lLeg: serializer.fromJson<double>(json['lLeg']),
      rLeg: serializer.fromJson<double>(json['rLeg']),
      neck: serializer.fromJson<double>(json['neck']),
      shoulders: serializer.fromJson<double>(json['shoulders']),
      waist: serializer.fromJson<double>(json['waist']),
      chest: serializer.fromJson<double>(json['chest']),
      hips: serializer.fromJson<double>(json['hips']),
      checkDate: serializer.fromJson<DateTime>(json['checkDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'height': serializer.toJson<double>(height),
      'weight': serializer.toJson<double>(weight),
      'lArm': serializer.toJson<double>(lArm),
      'rArm': serializer.toJson<double>(rArm),
      'lHumerus': serializer.toJson<double>(lHumerus),
      'rHumerus': serializer.toJson<double>(rHumerus),
      'lThigh': serializer.toJson<double>(lThigh),
      'rThigh': serializer.toJson<double>(rThigh),
      'lLeg': serializer.toJson<double>(lLeg),
      'rLeg': serializer.toJson<double>(rLeg),
      'neck': serializer.toJson<double>(neck),
      'shoulders': serializer.toJson<double>(shoulders),
      'waist': serializer.toJson<double>(waist),
      'chest': serializer.toJson<double>(chest),
      'hips': serializer.toJson<double>(hips),
      'checkDate': serializer.toJson<DateTime>(checkDate),
    };
  }

  MeasurementsData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          double? height,
          double? weight,
          double? lArm,
          double? rArm,
          double? lHumerus,
          double? rHumerus,
          double? lThigh,
          double? rThigh,
          double? lLeg,
          double? rLeg,
          double? neck,
          double? shoulders,
          double? waist,
          double? chest,
          double? hips,
          DateTime? checkDate}) =>
      MeasurementsData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        lArm: lArm ?? this.lArm,
        rArm: rArm ?? this.rArm,
        lHumerus: lHumerus ?? this.lHumerus,
        rHumerus: rHumerus ?? this.rHumerus,
        lThigh: lThigh ?? this.lThigh,
        rThigh: rThigh ?? this.rThigh,
        lLeg: lLeg ?? this.lLeg,
        rLeg: rLeg ?? this.rLeg,
        neck: neck ?? this.neck,
        shoulders: shoulders ?? this.shoulders,
        waist: waist ?? this.waist,
        chest: chest ?? this.chest,
        hips: hips ?? this.hips,
        checkDate: checkDate ?? this.checkDate,
      );
  MeasurementsData copyWithCompanion(MeasurementsCompanion data) {
    return MeasurementsData(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      lArm: data.lArm.present ? data.lArm.value : this.lArm,
      rArm: data.rArm.present ? data.rArm.value : this.rArm,
      lHumerus: data.lHumerus.present ? data.lHumerus.value : this.lHumerus,
      rHumerus: data.rHumerus.present ? data.rHumerus.value : this.rHumerus,
      lThigh: data.lThigh.present ? data.lThigh.value : this.lThigh,
      rThigh: data.rThigh.present ? data.rThigh.value : this.rThigh,
      lLeg: data.lLeg.present ? data.lLeg.value : this.lLeg,
      rLeg: data.rLeg.present ? data.rLeg.value : this.rLeg,
      neck: data.neck.present ? data.neck.value : this.neck,
      shoulders: data.shoulders.present ? data.shoulders.value : this.shoulders,
      waist: data.waist.present ? data.waist.value : this.waist,
      chest: data.chest.present ? data.chest.value : this.chest,
      hips: data.hips.present ? data.hips.value : this.hips,
      checkDate: data.checkDate.present ? data.checkDate.value : this.checkDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementsData(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('lArm: $lArm, ')
          ..write('rArm: $rArm, ')
          ..write('lHumerus: $lHumerus, ')
          ..write('rHumerus: $rHumerus, ')
          ..write('lThigh: $lThigh, ')
          ..write('rThigh: $rThigh, ')
          ..write('lLeg: $lLeg, ')
          ..write('rLeg: $rLeg, ')
          ..write('neck: $neck, ')
          ..write('shoulders: $shoulders, ')
          ..write('waist: $waist, ')
          ..write('chest: $chest, ')
          ..write('hips: $hips, ')
          ..write('checkDate: $checkDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      apiId,
      height,
      weight,
      lArm,
      rArm,
      lHumerus,
      rHumerus,
      lThigh,
      rThigh,
      lLeg,
      rLeg,
      neck,
      shoulders,
      waist,
      chest,
      hips,
      checkDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeasurementsData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.lArm == this.lArm &&
          other.rArm == this.rArm &&
          other.lHumerus == this.lHumerus &&
          other.rHumerus == this.rHumerus &&
          other.lThigh == this.lThigh &&
          other.rThigh == this.rThigh &&
          other.lLeg == this.lLeg &&
          other.rLeg == this.rLeg &&
          other.neck == this.neck &&
          other.shoulders == this.shoulders &&
          other.waist == this.waist &&
          other.chest == this.chest &&
          other.hips == this.hips &&
          other.checkDate == this.checkDate);
}

class MeasurementsCompanion extends UpdateCompanion<MeasurementsData> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<double> height;
  final Value<double> weight;
  final Value<double> lArm;
  final Value<double> rArm;
  final Value<double> lHumerus;
  final Value<double> rHumerus;
  final Value<double> lThigh;
  final Value<double> rThigh;
  final Value<double> lLeg;
  final Value<double> rLeg;
  final Value<double> neck;
  final Value<double> shoulders;
  final Value<double> waist;
  final Value<double> chest;
  final Value<double> hips;
  final Value<DateTime> checkDate;
  const MeasurementsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.lArm = const Value.absent(),
    this.rArm = const Value.absent(),
    this.lHumerus = const Value.absent(),
    this.rHumerus = const Value.absent(),
    this.lThigh = const Value.absent(),
    this.rThigh = const Value.absent(),
    this.lLeg = const Value.absent(),
    this.rLeg = const Value.absent(),
    this.neck = const Value.absent(),
    this.shoulders = const Value.absent(),
    this.waist = const Value.absent(),
    this.chest = const Value.absent(),
    this.hips = const Value.absent(),
    this.checkDate = const Value.absent(),
  });
  MeasurementsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required double height,
    required double weight,
    required double lArm,
    required double rArm,
    required double lHumerus,
    required double rHumerus,
    required double lThigh,
    required double rThigh,
    required double lLeg,
    required double rLeg,
    required double neck,
    required double shoulders,
    required double waist,
    required double chest,
    required double hips,
    required DateTime checkDate,
  })  : height = Value(height),
        weight = Value(weight),
        lArm = Value(lArm),
        rArm = Value(rArm),
        lHumerus = Value(lHumerus),
        rHumerus = Value(rHumerus),
        lThigh = Value(lThigh),
        rThigh = Value(rThigh),
        lLeg = Value(lLeg),
        rLeg = Value(rLeg),
        neck = Value(neck),
        shoulders = Value(shoulders),
        waist = Value(waist),
        chest = Value(chest),
        hips = Value(hips),
        checkDate = Value(checkDate);
  static Insertable<MeasurementsData> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<double>? lArm,
    Expression<double>? rArm,
    Expression<double>? lHumerus,
    Expression<double>? rHumerus,
    Expression<double>? lThigh,
    Expression<double>? rThigh,
    Expression<double>? lLeg,
    Expression<double>? rLeg,
    Expression<double>? neck,
    Expression<double>? shoulders,
    Expression<double>? waist,
    Expression<double>? chest,
    Expression<double>? hips,
    Expression<DateTime>? checkDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (lArm != null) 'l_arm': lArm,
      if (rArm != null) 'r_arm': rArm,
      if (lHumerus != null) 'l_humerus': lHumerus,
      if (rHumerus != null) 'r_humerus': rHumerus,
      if (lThigh != null) 'l_thigh': lThigh,
      if (rThigh != null) 'r_thigh': rThigh,
      if (lLeg != null) 'l_leg': lLeg,
      if (rLeg != null) 'r_leg': rLeg,
      if (neck != null) 'neck': neck,
      if (shoulders != null) 'shoulders': shoulders,
      if (waist != null) 'waist': waist,
      if (chest != null) 'chest': chest,
      if (hips != null) 'hips': hips,
      if (checkDate != null) 'check_date': checkDate,
    });
  }

  MeasurementsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<double>? height,
      Value<double>? weight,
      Value<double>? lArm,
      Value<double>? rArm,
      Value<double>? lHumerus,
      Value<double>? rHumerus,
      Value<double>? lThigh,
      Value<double>? rThigh,
      Value<double>? lLeg,
      Value<double>? rLeg,
      Value<double>? neck,
      Value<double>? shoulders,
      Value<double>? waist,
      Value<double>? chest,
      Value<double>? hips,
      Value<DateTime>? checkDate}) {
    return MeasurementsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      lArm: lArm ?? this.lArm,
      rArm: rArm ?? this.rArm,
      lHumerus: lHumerus ?? this.lHumerus,
      rHumerus: rHumerus ?? this.rHumerus,
      lThigh: lThigh ?? this.lThigh,
      rThigh: rThigh ?? this.rThigh,
      lLeg: lLeg ?? this.lLeg,
      rLeg: rLeg ?? this.rLeg,
      neck: neck ?? this.neck,
      shoulders: shoulders ?? this.shoulders,
      waist: waist ?? this.waist,
      chest: chest ?? this.chest,
      hips: hips ?? this.hips,
      checkDate: checkDate ?? this.checkDate,
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
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (lArm.present) {
      map['l_arm'] = Variable<double>(lArm.value);
    }
    if (rArm.present) {
      map['r_arm'] = Variable<double>(rArm.value);
    }
    if (lHumerus.present) {
      map['l_humerus'] = Variable<double>(lHumerus.value);
    }
    if (rHumerus.present) {
      map['r_humerus'] = Variable<double>(rHumerus.value);
    }
    if (lThigh.present) {
      map['l_thigh'] = Variable<double>(lThigh.value);
    }
    if (rThigh.present) {
      map['r_thigh'] = Variable<double>(rThigh.value);
    }
    if (lLeg.present) {
      map['l_leg'] = Variable<double>(lLeg.value);
    }
    if (rLeg.present) {
      map['r_leg'] = Variable<double>(rLeg.value);
    }
    if (neck.present) {
      map['neck'] = Variable<double>(neck.value);
    }
    if (shoulders.present) {
      map['shoulders'] = Variable<double>(shoulders.value);
    }
    if (waist.present) {
      map['waist'] = Variable<double>(waist.value);
    }
    if (chest.present) {
      map['chest'] = Variable<double>(chest.value);
    }
    if (hips.present) {
      map['hips'] = Variable<double>(hips.value);
    }
    if (checkDate.present) {
      map['check_date'] = Variable<DateTime>(checkDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('lArm: $lArm, ')
          ..write('rArm: $rArm, ')
          ..write('lHumerus: $lHumerus, ')
          ..write('rHumerus: $rHumerus, ')
          ..write('lThigh: $lThigh, ')
          ..write('rThigh: $rThigh, ')
          ..write('lLeg: $lLeg, ')
          ..write('rLeg: $rLeg, ')
          ..write('neck: $neck, ')
          ..write('shoulders: $shoulders, ')
          ..write('waist: $waist, ')
          ..write('chest: $chest, ')
          ..write('hips: $hips, ')
          ..write('checkDate: $checkDate')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Accounts accounts = Accounts(this);
  late final Memberships memberships = Memberships(this);
  late final Routines routines = Routines(this);
  late final DaysGroup daysGroup = DaysGroup(this);
  late final ExerciseGroups exerciseGroups = ExerciseGroups(this);
  late final Exercises exercises = Exercises(this);
  late final RoutineItems routineItems = RoutineItems(this);
  late final RoutineSets routineSets = RoutineSets(this);
  late final TSessions tSessions = TSessions(this);
  late final TLogs tLogs = TLogs(this);
  late final Measurements measurements = Measurements(this);
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
        tLogs,
        measurements
      ];
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
