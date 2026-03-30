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
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
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
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  Accounts createAlias(String alias) {
    return Accounts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AccountsData extends DataClass implements Insertable<AccountsData> {
  final String uid;
  final String email;
  final String type;
  final String createdAt;
  const AccountsData({
    required this.uid,
    required this.email,
    required this.type,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['email'] = Variable<String>(email);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<String>(createdAt);
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

  factory AccountsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountsData(
      uid: serializer.fromJson<String>(json['uid']),
      email: serializer.fromJson<String>(json['email']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'email': serializer.toJson<String>(email),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  AccountsData copyWith({
    String? uid,
    String? email,
    String? type,
    String? createdAt,
  }) => AccountsData(
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
  final Value<String> createdAt;
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
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       email = Value(email),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<AccountsData> custom({
    Expression<String>? uid,
    Expression<String>? email,
    Expression<String>? type,
    Expression<String>? createdAt,
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

  AccountsCompanion copyWith({
    Value<String>? uid,
    Value<String>? email,
    Value<String>? type,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
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
      map['created_at'] = Variable<String>(createdAt.value);
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

class Routines extends Table with TableInfo<Routines, RoutinesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Routines(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> isCurrent = GeneratedColumn<int>(
    'is_current',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (is_current IN (0, 1))',
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (is_synced IN (0, 1))',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
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
    updatedAt,
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isCurrent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_current'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  Routines createAlias(String alias) {
    return Routines(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class RoutinesData extends DataClass implements Insertable<RoutinesData> {
  final int id;
  final int? apiId;
  final int version;
  final String name;
  final String? description;
  final int isCurrent;
  final int isSynced;
  final String createdAt;
  final String updatedAt;
  const RoutinesData({
    required this.id,
    this.apiId,
    required this.version,
    required this.name,
    this.description,
    required this.isCurrent,
    required this.isSynced,
    required this.createdAt,
    required this.updatedAt,
  });
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
    map['is_current'] = Variable<int>(isCurrent);
    map['is_synced'] = Variable<int>(isSynced);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
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

  factory RoutinesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutinesData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isCurrent: serializer.fromJson<int>(json['isCurrent']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
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
      'isCurrent': serializer.toJson<int>(isCurrent),
      'isSynced': serializer.toJson<int>(isSynced),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  RoutinesData copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? version,
    String? name,
    Value<String?> description = const Value.absent(),
    int? isCurrent,
    int? isSynced,
    String? createdAt,
    String? updatedAt,
  }) => RoutinesData(
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
      description: data.description.present
          ? data.description.value
          : this.description,
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
  int get hashCode => Object.hash(
    id,
    apiId,
    version,
    name,
    description,
    isCurrent,
    isSynced,
    createdAt,
    updatedAt,
  );
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
  final Value<int> isCurrent;
  final Value<int> isSynced;
  final Value<String> createdAt;
  final Value<String> updatedAt;
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
    required int isCurrent,
    required int isSynced,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : version = Value(version),
       name = Value(name),
       isCurrent = Value(isCurrent),
       isSynced = Value(isSynced);
  static Insertable<RoutinesData> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? isCurrent,
    Expression<int>? isSynced,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
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

  RoutinesCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? version,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? isCurrent,
    Value<int>? isSynced,
    Value<String>? createdAt,
    Value<String>? updatedAt,
  }) {
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
      map['is_current'] = Variable<int>(isCurrent.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<int>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
    'day_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (is_synced IN (0, 1))',
  );
  late final GeneratedColumn<int> routineId = GeneratedColumn<int>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL REFERENCES routines(id)ON UPDATE CASCADE ON DELETE CASCADE',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    apiId,
    index,
    version,
    dayName,
    isSynced,
    routineId,
  ];
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      dayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_name'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}routine_id'],
      )!,
    );
  }

  @override
  DaysGroup createAlias(String alias) {
    return DaysGroup(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DaysGroupData extends DataClass implements Insertable<DaysGroupData> {
  final int id;
  final int? apiId;
  final int index;
  final int version;
  final String dayName;
  final int isSynced;
  final int routineId;
  const DaysGroupData({
    required this.id,
    this.apiId,
    required this.index,
    required this.version,
    required this.dayName,
    required this.isSynced,
    required this.routineId,
  });
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
    map['is_synced'] = Variable<int>(isSynced);
    map['routine_id'] = Variable<int>(routineId);
    return map;
  }

  DaysGroupCompanion toCompanion(bool nullToAbsent) {
    return DaysGroupCompanion(
      id: Value(id),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
      index: Value(index),
      version: Value(version),
      dayName: Value(dayName),
      isSynced: Value(isSynced),
      routineId: Value(routineId),
    );
  }

  factory DaysGroupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DaysGroupData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      version: serializer.fromJson<int>(json['version']),
      dayName: serializer.fromJson<String>(json['dayName']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
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
      'isSynced': serializer.toJson<int>(isSynced),
      'routineId': serializer.toJson<int>(routineId),
    };
  }

  DaysGroupData copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? index,
    int? version,
    String? dayName,
    int? isSynced,
    int? routineId,
  }) => DaysGroupData(
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
  final Value<int> isSynced;
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
    required int isSynced,
    required int routineId,
  }) : index = Value(index),
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
    Expression<int>? isSynced,
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

  DaysGroupCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? index,
    Value<int>? version,
    Value<String>? dayName,
    Value<int>? isSynced,
    Value<int>? routineId,
  }) {
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
      map['is_synced'] = Variable<int>(isSynced.value);
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

class Exercises extends Table with TableInfo<Exercises, ExercisesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Exercises(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> muscleGroupCode = GeneratedColumn<String>(
    'muscle_group_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> muscleGroupName = GeneratedColumn<String>(
    'muscle_group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> muscleHeadCode = GeneratedColumn<String>(
    'muscle_head_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> muscleHeadName = GeneratedColumn<String>(
    'muscle_head_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> auxMuscle1 = GeneratedColumn<String>(
    'aux_muscle1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<String> auxMuscle2 = GeneratedColumn<String>(
    'aux_muscle2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<String> auxMuscle3 = GeneratedColumn<String>(
    'aux_muscle3',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<String> laterals = GeneratedColumn<String>(
    'laterals',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<String> toolCode = GeneratedColumn<String>(
    'tool_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> toolName = GeneratedColumn<String>(
    'tool_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    apiId,
    name,
    muscleGroupCode,
    muscleGroupName,
    muscleHeadCode,
    muscleHeadName,
    auxMuscle1,
    auxMuscle2,
    auxMuscle3,
    laterals,
    description,
    toolCode,
    toolName,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  Set<GeneratedColumn> get $primaryKey => {apiId};
  @override
  ExercisesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesData(
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      muscleGroupCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}muscle_group_code'],
      )!,
      muscleGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}muscle_group_name'],
      )!,
      muscleHeadCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}muscle_head_code'],
      )!,
      muscleHeadName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}muscle_head_name'],
      )!,
      auxMuscle1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aux_muscle1'],
      ),
      auxMuscle2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aux_muscle2'],
      ),
      auxMuscle3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aux_muscle3'],
      ),
      laterals: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}laterals'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      toolCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tool_code'],
      )!,
      toolName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tool_name'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  Exercises createAlias(String alias) {
    return Exercises(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(api_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class ExercisesData extends DataClass implements Insertable<ExercisesData> {
  final String apiId;
  final String name;
  final String muscleGroupCode;
  final String muscleGroupName;
  final String muscleHeadCode;
  final String muscleHeadName;
  final String? auxMuscle1;
  final String? auxMuscle2;
  final String? auxMuscle3;
  final String laterals;
  final String? description;
  final String toolCode;
  final String toolName;
  final String timestamp;
  const ExercisesData({
    required this.apiId,
    required this.name,
    required this.muscleGroupCode,
    required this.muscleGroupName,
    required this.muscleHeadCode,
    required this.muscleHeadName,
    this.auxMuscle1,
    this.auxMuscle2,
    this.auxMuscle3,
    required this.laterals,
    this.description,
    required this.toolCode,
    required this.toolName,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['name'] = Variable<String>(name);
    map['muscle_group_code'] = Variable<String>(muscleGroupCode);
    map['muscle_group_name'] = Variable<String>(muscleGroupName);
    map['muscle_head_code'] = Variable<String>(muscleHeadCode);
    map['muscle_head_name'] = Variable<String>(muscleHeadName);
    if (!nullToAbsent || auxMuscle1 != null) {
      map['aux_muscle1'] = Variable<String>(auxMuscle1);
    }
    if (!nullToAbsent || auxMuscle2 != null) {
      map['aux_muscle2'] = Variable<String>(auxMuscle2);
    }
    if (!nullToAbsent || auxMuscle3 != null) {
      map['aux_muscle3'] = Variable<String>(auxMuscle3);
    }
    map['laterals'] = Variable<String>(laterals);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['tool_code'] = Variable<String>(toolCode);
    map['tool_name'] = Variable<String>(toolName);
    map['timestamp'] = Variable<String>(timestamp);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      apiId: Value(apiId),
      name: Value(name),
      muscleGroupCode: Value(muscleGroupCode),
      muscleGroupName: Value(muscleGroupName),
      muscleHeadCode: Value(muscleHeadCode),
      muscleHeadName: Value(muscleHeadName),
      auxMuscle1: auxMuscle1 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle1),
      auxMuscle2: auxMuscle2 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle2),
      auxMuscle3: auxMuscle3 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle3),
      laterals: Value(laterals),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      toolCode: Value(toolCode),
      toolName: Value(toolName),
      timestamp: Value(timestamp),
    );
  }

  factory ExercisesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesData(
      apiId: serializer.fromJson<String>(json['apiId']),
      name: serializer.fromJson<String>(json['name']),
      muscleGroupCode: serializer.fromJson<String>(json['muscleGroupCode']),
      muscleGroupName: serializer.fromJson<String>(json['muscleGroupName']),
      muscleHeadCode: serializer.fromJson<String>(json['muscleHeadCode']),
      muscleHeadName: serializer.fromJson<String>(json['muscleHeadName']),
      auxMuscle1: serializer.fromJson<String?>(json['auxMuscle1']),
      auxMuscle2: serializer.fromJson<String?>(json['auxMuscle2']),
      auxMuscle3: serializer.fromJson<String?>(json['auxMuscle3']),
      laterals: serializer.fromJson<String>(json['laterals']),
      description: serializer.fromJson<String?>(json['description']),
      toolCode: serializer.fromJson<String>(json['toolCode']),
      toolName: serializer.fromJson<String>(json['toolName']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apiId': serializer.toJson<String>(apiId),
      'name': serializer.toJson<String>(name),
      'muscleGroupCode': serializer.toJson<String>(muscleGroupCode),
      'muscleGroupName': serializer.toJson<String>(muscleGroupName),
      'muscleHeadCode': serializer.toJson<String>(muscleHeadCode),
      'muscleHeadName': serializer.toJson<String>(muscleHeadName),
      'auxMuscle1': serializer.toJson<String?>(auxMuscle1),
      'auxMuscle2': serializer.toJson<String?>(auxMuscle2),
      'auxMuscle3': serializer.toJson<String?>(auxMuscle3),
      'laterals': serializer.toJson<String>(laterals),
      'description': serializer.toJson<String?>(description),
      'toolCode': serializer.toJson<String>(toolCode),
      'toolName': serializer.toJson<String>(toolName),
      'timestamp': serializer.toJson<String>(timestamp),
    };
  }

  ExercisesData copyWith({
    String? apiId,
    String? name,
    String? muscleGroupCode,
    String? muscleGroupName,
    String? muscleHeadCode,
    String? muscleHeadName,
    Value<String?> auxMuscle1 = const Value.absent(),
    Value<String?> auxMuscle2 = const Value.absent(),
    Value<String?> auxMuscle3 = const Value.absent(),
    String? laterals,
    Value<String?> description = const Value.absent(),
    String? toolCode,
    String? toolName,
    String? timestamp,
  }) => ExercisesData(
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
    muscleGroupName: muscleGroupName ?? this.muscleGroupName,
    muscleHeadCode: muscleHeadCode ?? this.muscleHeadCode,
    muscleHeadName: muscleHeadName ?? this.muscleHeadName,
    auxMuscle1: auxMuscle1.present ? auxMuscle1.value : this.auxMuscle1,
    auxMuscle2: auxMuscle2.present ? auxMuscle2.value : this.auxMuscle2,
    auxMuscle3: auxMuscle3.present ? auxMuscle3.value : this.auxMuscle3,
    laterals: laterals ?? this.laterals,
    description: description.present ? description.value : this.description,
    toolCode: toolCode ?? this.toolCode,
    toolName: toolName ?? this.toolName,
    timestamp: timestamp ?? this.timestamp,
  );
  ExercisesData copyWithCompanion(ExercisesCompanion data) {
    return ExercisesData(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      name: data.name.present ? data.name.value : this.name,
      muscleGroupCode: data.muscleGroupCode.present
          ? data.muscleGroupCode.value
          : this.muscleGroupCode,
      muscleGroupName: data.muscleGroupName.present
          ? data.muscleGroupName.value
          : this.muscleGroupName,
      muscleHeadCode: data.muscleHeadCode.present
          ? data.muscleHeadCode.value
          : this.muscleHeadCode,
      muscleHeadName: data.muscleHeadName.present
          ? data.muscleHeadName.value
          : this.muscleHeadName,
      auxMuscle1: data.auxMuscle1.present
          ? data.auxMuscle1.value
          : this.auxMuscle1,
      auxMuscle2: data.auxMuscle2.present
          ? data.auxMuscle2.value
          : this.auxMuscle2,
      auxMuscle3: data.auxMuscle3.present
          ? data.auxMuscle3.value
          : this.auxMuscle3,
      laterals: data.laterals.present ? data.laterals.value : this.laterals,
      description: data.description.present
          ? data.description.value
          : this.description,
      toolCode: data.toolCode.present ? data.toolCode.value : this.toolCode,
      toolName: data.toolName.present ? data.toolName.value : this.toolName,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesData(')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('muscleGroupCode: $muscleGroupCode, ')
          ..write('muscleGroupName: $muscleGroupName, ')
          ..write('muscleHeadCode: $muscleHeadCode, ')
          ..write('muscleHeadName: $muscleHeadName, ')
          ..write('auxMuscle1: $auxMuscle1, ')
          ..write('auxMuscle2: $auxMuscle2, ')
          ..write('auxMuscle3: $auxMuscle3, ')
          ..write('laterals: $laterals, ')
          ..write('description: $description, ')
          ..write('toolCode: $toolCode, ')
          ..write('toolName: $toolName, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    apiId,
    name,
    muscleGroupCode,
    muscleGroupName,
    muscleHeadCode,
    muscleHeadName,
    auxMuscle1,
    auxMuscle2,
    auxMuscle3,
    laterals,
    description,
    toolCode,
    toolName,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisesData &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.muscleGroupCode == this.muscleGroupCode &&
          other.muscleGroupName == this.muscleGroupName &&
          other.muscleHeadCode == this.muscleHeadCode &&
          other.muscleHeadName == this.muscleHeadName &&
          other.auxMuscle1 == this.auxMuscle1 &&
          other.auxMuscle2 == this.auxMuscle2 &&
          other.auxMuscle3 == this.auxMuscle3 &&
          other.laterals == this.laterals &&
          other.description == this.description &&
          other.toolCode == this.toolCode &&
          other.toolName == this.toolName &&
          other.timestamp == this.timestamp);
}

class ExercisesCompanion extends UpdateCompanion<ExercisesData> {
  final Value<String> apiId;
  final Value<String> name;
  final Value<String> muscleGroupCode;
  final Value<String> muscleGroupName;
  final Value<String> muscleHeadCode;
  final Value<String> muscleHeadName;
  final Value<String?> auxMuscle1;
  final Value<String?> auxMuscle2;
  final Value<String?> auxMuscle3;
  final Value<String> laterals;
  final Value<String?> description;
  final Value<String> toolCode;
  final Value<String> toolName;
  final Value<String> timestamp;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.apiId = const Value.absent(),
    this.name = const Value.absent(),
    this.muscleGroupCode = const Value.absent(),
    this.muscleGroupName = const Value.absent(),
    this.muscleHeadCode = const Value.absent(),
    this.muscleHeadName = const Value.absent(),
    this.auxMuscle1 = const Value.absent(),
    this.auxMuscle2 = const Value.absent(),
    this.auxMuscle3 = const Value.absent(),
    this.laterals = const Value.absent(),
    this.description = const Value.absent(),
    this.toolCode = const Value.absent(),
    this.toolName = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String apiId,
    required String name,
    required String muscleGroupCode,
    required String muscleGroupName,
    required String muscleHeadCode,
    required String muscleHeadName,
    this.auxMuscle1 = const Value.absent(),
    this.auxMuscle2 = const Value.absent(),
    this.auxMuscle3 = const Value.absent(),
    required String laterals,
    this.description = const Value.absent(),
    required String toolCode,
    required String toolName,
    required String timestamp,
    this.rowid = const Value.absent(),
  }) : apiId = Value(apiId),
       name = Value(name),
       muscleGroupCode = Value(muscleGroupCode),
       muscleGroupName = Value(muscleGroupName),
       muscleHeadCode = Value(muscleHeadCode),
       muscleHeadName = Value(muscleHeadName),
       laterals = Value(laterals),
       toolCode = Value(toolCode),
       toolName = Value(toolName),
       timestamp = Value(timestamp);
  static Insertable<ExercisesData> custom({
    Expression<String>? apiId,
    Expression<String>? name,
    Expression<String>? muscleGroupCode,
    Expression<String>? muscleGroupName,
    Expression<String>? muscleHeadCode,
    Expression<String>? muscleHeadName,
    Expression<String>? auxMuscle1,
    Expression<String>? auxMuscle2,
    Expression<String>? auxMuscle3,
    Expression<String>? laterals,
    Expression<String>? description,
    Expression<String>? toolCode,
    Expression<String>? toolName,
    Expression<String>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (name != null) 'name': name,
      if (muscleGroupCode != null) 'muscle_group_code': muscleGroupCode,
      if (muscleGroupName != null) 'muscle_group_name': muscleGroupName,
      if (muscleHeadCode != null) 'muscle_head_code': muscleHeadCode,
      if (muscleHeadName != null) 'muscle_head_name': muscleHeadName,
      if (auxMuscle1 != null) 'aux_muscle1': auxMuscle1,
      if (auxMuscle2 != null) 'aux_muscle2': auxMuscle2,
      if (auxMuscle3 != null) 'aux_muscle3': auxMuscle3,
      if (laterals != null) 'laterals': laterals,
      if (description != null) 'description': description,
      if (toolCode != null) 'tool_code': toolCode,
      if (toolName != null) 'tool_name': toolName,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? apiId,
    Value<String>? name,
    Value<String>? muscleGroupCode,
    Value<String>? muscleGroupName,
    Value<String>? muscleHeadCode,
    Value<String>? muscleHeadName,
    Value<String?>? auxMuscle1,
    Value<String?>? auxMuscle2,
    Value<String?>? auxMuscle3,
    Value<String>? laterals,
    Value<String?>? description,
    Value<String>? toolCode,
    Value<String>? toolName,
    Value<String>? timestamp,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
      muscleGroupName: muscleGroupName ?? this.muscleGroupName,
      muscleHeadCode: muscleHeadCode ?? this.muscleHeadCode,
      muscleHeadName: muscleHeadName ?? this.muscleHeadName,
      auxMuscle1: auxMuscle1 ?? this.auxMuscle1,
      auxMuscle2: auxMuscle2 ?? this.auxMuscle2,
      auxMuscle3: auxMuscle3 ?? this.auxMuscle3,
      laterals: laterals ?? this.laterals,
      description: description ?? this.description,
      toolCode: toolCode ?? this.toolCode,
      toolName: toolName ?? this.toolName,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (apiId.present) {
      map['api_id'] = Variable<String>(apiId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (muscleGroupCode.present) {
      map['muscle_group_code'] = Variable<String>(muscleGroupCode.value);
    }
    if (muscleGroupName.present) {
      map['muscle_group_name'] = Variable<String>(muscleGroupName.value);
    }
    if (muscleHeadCode.present) {
      map['muscle_head_code'] = Variable<String>(muscleHeadCode.value);
    }
    if (muscleHeadName.present) {
      map['muscle_head_name'] = Variable<String>(muscleHeadName.value);
    }
    if (auxMuscle1.present) {
      map['aux_muscle1'] = Variable<String>(auxMuscle1.value);
    }
    if (auxMuscle2.present) {
      map['aux_muscle2'] = Variable<String>(auxMuscle2.value);
    }
    if (auxMuscle3.present) {
      map['aux_muscle3'] = Variable<String>(auxMuscle3.value);
    }
    if (laterals.present) {
      map['laterals'] = Variable<String>(laterals.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (toolCode.present) {
      map['tool_code'] = Variable<String>(toolCode.value);
    }
    if (toolName.present) {
      map['tool_name'] = Variable<String>(toolName.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('muscleGroupCode: $muscleGroupCode, ')
          ..write('muscleGroupName: $muscleGroupName, ')
          ..write('muscleHeadCode: $muscleHeadCode, ')
          ..write('muscleHeadName: $muscleHeadName, ')
          ..write('auxMuscle1: $auxMuscle1, ')
          ..write('auxMuscle2: $auxMuscle2, ')
          ..write('auxMuscle3: $auxMuscle3, ')
          ..write('laterals: $laterals, ')
          ..write('description: $description, ')
          ..write('toolCode: $toolCode, ')
          ..write('toolName: $toolName, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (is_synced IN (0, 1))',
  );
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL REFERENCES exercises(api_id)ON UPDATE CASCADE ON DELETE CASCADE',
  );
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
    'day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL REFERENCES days_group(id)ON UPDATE CASCADE ON DELETE CASCADE',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    apiId,
    index,
    notes,
    version,
    isSynced,
    exerciseId,
    dayId,
  ];
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      dayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_id'],
      )!,
    );
  }

  @override
  RoutineItems createAlias(String alias) {
    return RoutineItems(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class RoutineItemsData extends DataClass
    implements Insertable<RoutineItemsData> {
  final int id;
  final int? apiId;
  final int index;
  final String? notes;
  final int version;
  final int isSynced;
  final String exerciseId;
  final int dayId;
  const RoutineItemsData({
    required this.id,
    this.apiId,
    required this.index,
    this.notes,
    required this.version,
    required this.isSynced,
    required this.exerciseId,
    required this.dayId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['index'] = Variable<int>(index);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<int>(isSynced);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['day_id'] = Variable<int>(dayId);
    return map;
  }

  RoutineItemsCompanion toCompanion(bool nullToAbsent) {
    return RoutineItemsCompanion(
      id: Value(id),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
      index: Value(index),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      version: Value(version),
      isSynced: Value(isSynced),
      exerciseId: Value(exerciseId),
      dayId: Value(dayId),
    );
  }

  factory RoutineItemsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineItemsData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      notes: serializer.fromJson<String?>(json['notes']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
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
      'notes': serializer.toJson<String?>(notes),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<int>(isSynced),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'dayId': serializer.toJson<int>(dayId),
    };
  }

  RoutineItemsData copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? index,
    Value<String?> notes = const Value.absent(),
    int? version,
    int? isSynced,
    String? exerciseId,
    int? dayId,
  }) => RoutineItemsData(
    id: id ?? this.id,
    apiId: apiId.present ? apiId.value : this.apiId,
    index: index ?? this.index,
    notes: notes.present ? notes.value : this.notes,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
    exerciseId: exerciseId ?? this.exerciseId,
    dayId: dayId ?? this.dayId,
  );
  RoutineItemsData copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItemsData(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      notes: data.notes.present ? data.notes.value : this.notes,
      version: data.version.present ? data.version.value : this.version,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      dayId: data.dayId.present ? data.dayId.value : this.dayId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineItemsData(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('notes: $notes, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('dayId: $dayId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    apiId,
    index,
    notes,
    version,
    isSynced,
    exerciseId,
    dayId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineItemsData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.notes == this.notes &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.exerciseId == this.exerciseId &&
          other.dayId == this.dayId);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItemsData> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<String?> notes;
  final Value<int> version;
  final Value<int> isSynced;
  final Value<String> exerciseId;
  final Value<int> dayId;
  const RoutineItemsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.notes = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.dayId = const Value.absent(),
  });
  RoutineItemsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    this.notes = const Value.absent(),
    required int version,
    required int isSynced,
    required String exerciseId,
    required int dayId,
  }) : index = Value(index),
       version = Value(version),
       isSynced = Value(isSynced),
       exerciseId = Value(exerciseId),
       dayId = Value(dayId);
  static Insertable<RoutineItemsData> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<String>? notes,
    Expression<int>? version,
    Expression<int>? isSynced,
    Expression<String>? exerciseId,
    Expression<int>? dayId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (notes != null) 'notes': notes,
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (dayId != null) 'day_id': dayId,
    });
  }

  RoutineItemsCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? index,
    Value<String?>? notes,
    Value<int>? version,
    Value<int>? isSynced,
    Value<String>? exerciseId,
    Value<int>? dayId,
  }) {
    return RoutineItemsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      notes: notes ?? this.notes,
      version: version ?? this.version,
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
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<int>(isSynced.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
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
          ..write('notes: $notes, ')
          ..write('version: $version, ')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> roundIndex = GeneratedColumn<int>(
    'round_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> repsCount = GeneratedColumn<int>(
    'reps_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (is_synced IN (0, 1))',
  );
  late final GeneratedColumn<int> routineItemId = GeneratedColumn<int>(
    'routine_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL REFERENCES routine_items(id)ON UPDATE CASCADE ON DELETE CASCADE',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    apiId,
    roundIndex,
    repsCount,
    version,
    isSynced,
    routineItemId,
  ];
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      roundIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round_index'],
      )!,
      repsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps_count'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
      routineItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}routine_item_id'],
      )!,
    );
  }

  @override
  RoutineSets createAlias(String alias) {
    return RoutineSets(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class RoutineSetsData extends DataClass implements Insertable<RoutineSetsData> {
  final int id;
  final int? apiId;
  final int roundIndex;
  final int repsCount;
  final int version;
  final int isSynced;
  final int routineItemId;
  const RoutineSetsData({
    required this.id,
    this.apiId,
    required this.roundIndex,
    required this.repsCount,
    required this.version,
    required this.isSynced,
    required this.routineItemId,
  });
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
    map['is_synced'] = Variable<int>(isSynced);
    map['routine_item_id'] = Variable<int>(routineItemId);
    return map;
  }

  RoutineSetsCompanion toCompanion(bool nullToAbsent) {
    return RoutineSetsCompanion(
      id: Value(id),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
      roundIndex: Value(roundIndex),
      repsCount: Value(repsCount),
      version: Value(version),
      isSynced: Value(isSynced),
      routineItemId: Value(routineItemId),
    );
  }

  factory RoutineSetsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineSetsData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      roundIndex: serializer.fromJson<int>(json['roundIndex']),
      repsCount: serializer.fromJson<int>(json['repsCount']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
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
      'isSynced': serializer.toJson<int>(isSynced),
      'routineItemId': serializer.toJson<int>(routineItemId),
    };
  }

  RoutineSetsData copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? roundIndex,
    int? repsCount,
    int? version,
    int? isSynced,
    int? routineItemId,
  }) => RoutineSetsData(
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
      roundIndex: data.roundIndex.present
          ? data.roundIndex.value
          : this.roundIndex,
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
    id,
    apiId,
    roundIndex,
    repsCount,
    version,
    isSynced,
    routineItemId,
  );
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
  final Value<int> isSynced;
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
    required int isSynced,
    required int routineItemId,
  }) : roundIndex = Value(roundIndex),
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
    Expression<int>? isSynced,
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

  RoutineSetsCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? roundIndex,
    Value<int>? repsCount,
    Value<int>? version,
    Value<int>? isSynced,
    Value<int>? routineItemId,
  }) {
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
      map['is_synced'] = Variable<int>(isSynced.value);
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
    'ts_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
    'day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
    'day_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> startedAt = GeneratedColumn<String>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> finishedAt = GeneratedColumn<String>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0.0',
    defaultValue: const CustomExpression('0.0'),
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0 CHECK (is_synced IN (0, 1))',
    defaultValue: const CustomExpression('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    tsId,
    dayId,
    dayName,
    startedAt,
    finishedAt,
    progress,
    apiId,
    version,
    isSynced,
  ];
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
      tsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ts_id'],
      )!,
      dayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_id'],
      )!,
      dayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_name'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finished_at'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  TSessions createAlias(String alias) {
    return TSessions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TSessionsData extends DataClass implements Insertable<TSessionsData> {
  final int tsId;
  final int dayId;
  final String dayName;
  final String startedAt;
  final String? finishedAt;
  final double progress;
  final int? apiId;
  final int version;
  final int isSynced;
  const TSessionsData({
    required this.tsId,
    required this.dayId,
    required this.dayName,
    required this.startedAt,
    this.finishedAt,
    required this.progress,
    this.apiId,
    required this.version,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ts_id'] = Variable<int>(tsId);
    map['day_id'] = Variable<int>(dayId);
    map['day_name'] = Variable<String>(dayName);
    map['started_at'] = Variable<String>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<String>(finishedAt);
    }
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<int>(isSynced);
    return map;
  }

  TSessionsCompanion toCompanion(bool nullToAbsent) {
    return TSessionsCompanion(
      tsId: Value(tsId),
      dayId: Value(dayId),
      dayName: Value(dayName),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      progress: Value(progress),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
      version: Value(version),
      isSynced: Value(isSynced),
    );
  }

  factory TSessionsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TSessionsData(
      tsId: serializer.fromJson<int>(json['tsId']),
      dayId: serializer.fromJson<int>(json['dayId']),
      dayName: serializer.fromJson<String>(json['dayName']),
      startedAt: serializer.fromJson<String>(json['startedAt']),
      finishedAt: serializer.fromJson<String?>(json['finishedAt']),
      progress: serializer.fromJson<double>(json['progress']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tsId': serializer.toJson<int>(tsId),
      'dayId': serializer.toJson<int>(dayId),
      'dayName': serializer.toJson<String>(dayName),
      'startedAt': serializer.toJson<String>(startedAt),
      'finishedAt': serializer.toJson<String?>(finishedAt),
      'progress': serializer.toJson<double>(progress),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<int>(isSynced),
    };
  }

  TSessionsData copyWith({
    int? tsId,
    int? dayId,
    String? dayName,
    String? startedAt,
    Value<String?> finishedAt = const Value.absent(),
    double? progress,
    Value<int?> apiId = const Value.absent(),
    int? version,
    int? isSynced,
  }) => TSessionsData(
    tsId: tsId ?? this.tsId,
    dayId: dayId ?? this.dayId,
    dayName: dayName ?? this.dayName,
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
      dayName: data.dayName.present ? data.dayName.value : this.dayName,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
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
          ..write('dayName: $dayName, ')
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
    tsId,
    dayId,
    dayName,
    startedAt,
    finishedAt,
    progress,
    apiId,
    version,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TSessionsData &&
          other.tsId == this.tsId &&
          other.dayId == this.dayId &&
          other.dayName == this.dayName &&
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
  final Value<String> dayName;
  final Value<String> startedAt;
  final Value<String?> finishedAt;
  final Value<double> progress;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<int> isSynced;
  const TSessionsCompanion({
    this.tsId = const Value.absent(),
    this.dayId = const Value.absent(),
    this.dayName = const Value.absent(),
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
    required String dayName,
    required String startedAt,
    this.finishedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : dayId = Value(dayId),
       dayName = Value(dayName),
       startedAt = Value(startedAt);
  static Insertable<TSessionsData> custom({
    Expression<int>? tsId,
    Expression<int>? dayId,
    Expression<String>? dayName,
    Expression<String>? startedAt,
    Expression<String>? finishedAt,
    Expression<double>? progress,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<int>? isSynced,
  }) {
    return RawValuesInsertable({
      if (tsId != null) 'ts_id': tsId,
      if (dayId != null) 'day_id': dayId,
      if (dayName != null) 'day_name': dayName,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (progress != null) 'progress': progress,
      if (apiId != null) 'api_id': apiId,
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  TSessionsCompanion copyWith({
    Value<int>? tsId,
    Value<int>? dayId,
    Value<String>? dayName,
    Value<String>? startedAt,
    Value<String?>? finishedAt,
    Value<double>? progress,
    Value<int?>? apiId,
    Value<int>? version,
    Value<int>? isSynced,
  }) {
    return TSessionsCompanion(
      tsId: tsId ?? this.tsId,
      dayId: dayId ?? this.dayId,
      dayName: dayName ?? this.dayName,
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
    if (dayName.present) {
      map['day_name'] = Variable<String>(dayName.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<String>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<String>(finishedAt.value);
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
      map['is_synced'] = Variable<int>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TSessionsCompanion(')
          ..write('tsId: $tsId, ')
          ..write('dayId: $dayId, ')
          ..write('dayName: $dayName, ')
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
    'log_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> exerciseIndex = GeneratedColumn<int>(
    'exercise_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> setIndex = GeneratedColumn<int>(
    'set_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> completedAt = GeneratedColumn<String>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0 CHECK (is_synced IN (0, 1))',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL REFERENCES t_sessions(ts_id)ON UPDATE CASCADE ON DELETE CASCADE',
  );
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
    sessionId,
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
      logId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}log_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      exerciseIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_index'],
      )!,
      setIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_index'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}completed_at'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
    );
  }

  @override
  TLogs createAlias(String alias) {
    return TLogs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TLogsData extends DataClass implements Insertable<TLogsData> {
  final int logId;
  final String exerciseId;
  final int exerciseIndex;
  final int setIndex;
  final int reps;
  final double weight;
  final String completedAt;
  final int? apiId;
  final int version;
  final int isSynced;
  final int sessionId;
  const TLogsData({
    required this.logId,
    required this.exerciseId,
    required this.exerciseIndex,
    required this.setIndex,
    required this.reps,
    required this.weight,
    required this.completedAt,
    this.apiId,
    required this.version,
    required this.isSynced,
    required this.sessionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['log_id'] = Variable<int>(logId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['exercise_index'] = Variable<int>(exerciseIndex);
    map['set_index'] = Variable<int>(setIndex);
    map['reps'] = Variable<int>(reps);
    map['weight'] = Variable<double>(weight);
    map['completed_at'] = Variable<String>(completedAt);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<int>(isSynced);
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
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
      version: Value(version),
      isSynced: Value(isSynced),
      sessionId: Value(sessionId),
    );
  }

  factory TLogsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TLogsData(
      logId: serializer.fromJson<int>(json['logId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseIndex: serializer.fromJson<int>(json['exerciseIndex']),
      setIndex: serializer.fromJson<int>(json['setIndex']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      completedAt: serializer.fromJson<String>(json['completedAt']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'logId': serializer.toJson<int>(logId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseIndex': serializer.toJson<int>(exerciseIndex),
      'setIndex': serializer.toJson<int>(setIndex),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double>(weight),
      'completedAt': serializer.toJson<String>(completedAt),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<int>(isSynced),
      'sessionId': serializer.toJson<int>(sessionId),
    };
  }

  TLogsData copyWith({
    int? logId,
    String? exerciseId,
    int? exerciseIndex,
    int? setIndex,
    int? reps,
    double? weight,
    String? completedAt,
    Value<int?> apiId = const Value.absent(),
    int? version,
    int? isSynced,
    int? sessionId,
  }) => TLogsData(
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
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      exerciseIndex: data.exerciseIndex.present
          ? data.exerciseIndex.value
          : this.exerciseIndex,
      setIndex: data.setIndex.present ? data.setIndex.value : this.setIndex,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
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
  int get hashCode => Object.hash(
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
    sessionId,
  );
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
  final Value<String> exerciseId;
  final Value<int> exerciseIndex;
  final Value<int> setIndex;
  final Value<int> reps;
  final Value<double> weight;
  final Value<String> completedAt;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<int> isSynced;
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
    required String exerciseId,
    required int exerciseIndex,
    required int setIndex,
    required int reps,
    required double weight,
    required String completedAt,
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int sessionId,
  }) : exerciseId = Value(exerciseId),
       exerciseIndex = Value(exerciseIndex),
       setIndex = Value(setIndex),
       reps = Value(reps),
       weight = Value(weight),
       completedAt = Value(completedAt),
       sessionId = Value(sessionId);
  static Insertable<TLogsData> custom({
    Expression<int>? logId,
    Expression<String>? exerciseId,
    Expression<int>? exerciseIndex,
    Expression<int>? setIndex,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<String>? completedAt,
    Expression<int>? apiId,
    Expression<int>? version,
    Expression<int>? isSynced,
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

  TLogsCompanion copyWith({
    Value<int>? logId,
    Value<String>? exerciseId,
    Value<int>? exerciseIndex,
    Value<int>? setIndex,
    Value<int>? reps,
    Value<double>? weight,
    Value<String>? completedAt,
    Value<int?>? apiId,
    Value<int>? version,
    Value<int>? isSynced,
    Value<int>? sessionId,
  }) {
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
      map['exercise_id'] = Variable<String>(exerciseId.value);
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
      map['completed_at'] = Variable<String>(completedAt.value);
    }
    if (apiId.present) {
      map['api_id'] = Variable<int>(apiId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<int>(isSynced.value);
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> lArm = GeneratedColumn<double>(
    'l_arm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> rArm = GeneratedColumn<double>(
    'r_arm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> lHumerus = GeneratedColumn<double>(
    'l_humerus',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> rHumerus = GeneratedColumn<double>(
    'r_humerus',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> lThigh = GeneratedColumn<double>(
    'l_thigh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> rThigh = GeneratedColumn<double>(
    'r_thigh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> lLeg = GeneratedColumn<double>(
    'l_leg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> rLeg = GeneratedColumn<double>(
    'r_leg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> neck = GeneratedColumn<double>(
    'neck',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> shoulders = GeneratedColumn<double>(
    'shoulders',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
    'waist',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
    'chest',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<double> hips = GeneratedColumn<double>(
    'hips',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> checkDate = GeneratedColumn<String>(
    'check_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  late final GeneratedColumn<int> isSynced = GeneratedColumn<int>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0 CHECK (is_synced IN (0, 1))',
    defaultValue: const CustomExpression('0'),
  );
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
    checkDate,
    version,
    isSynced,
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}api_id'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      lArm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}l_arm'],
      )!,
      rArm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}r_arm'],
      )!,
      lHumerus: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}l_humerus'],
      )!,
      rHumerus: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}r_humerus'],
      )!,
      lThigh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}l_thigh'],
      )!,
      rThigh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}r_thigh'],
      )!,
      lLeg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}l_leg'],
      )!,
      rLeg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}r_leg'],
      )!,
      neck: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}neck'],
      )!,
      shoulders: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}shoulders'],
      )!,
      waist: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}waist'],
      )!,
      chest: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}chest'],
      )!,
      hips: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hips'],
      )!,
      checkDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_date'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  Measurements createAlias(String alias) {
    return Measurements(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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
  final String checkDate;
  final int version;
  final int isSynced;
  const MeasurementsData({
    required this.id,
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
    required this.checkDate,
    required this.version,
    required this.isSynced,
  });
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
    map['check_date'] = Variable<String>(checkDate);
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<int>(isSynced);
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: Value(id),
      apiId: apiId == null && nullToAbsent
          ? const Value.absent()
          : Value(apiId),
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
      version: Value(version),
      isSynced: Value(isSynced),
    );
  }

  factory MeasurementsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
      checkDate: serializer.fromJson<String>(json['checkDate']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<int>(json['isSynced']),
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
      'checkDate': serializer.toJson<String>(checkDate),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<int>(isSynced),
    };
  }

  MeasurementsData copyWith({
    int? id,
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
    String? checkDate,
    int? version,
    int? isSynced,
  }) => MeasurementsData(
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
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
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
      version: data.version.present ? data.version.value : this.version,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
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
          ..write('checkDate: $checkDate, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced')
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
    checkDate,
    version,
    isSynced,
  );
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
          other.checkDate == this.checkDate &&
          other.version == this.version &&
          other.isSynced == this.isSynced);
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
  final Value<String> checkDate;
  final Value<int> version;
  final Value<int> isSynced;
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
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
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
    required String checkDate,
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : height = Value(height),
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
    Expression<String>? checkDate,
    Expression<int>? version,
    Expression<int>? isSynced,
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
      if (version != null) 'version': version,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  MeasurementsCompanion copyWith({
    Value<int>? id,
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
    Value<String>? checkDate,
    Value<int>? version,
    Value<int>? isSynced,
  }) {
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
      version: version ?? this.version,
      isSynced: isSynced ?? this.isSynced,
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
      map['check_date'] = Variable<String>(checkDate.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<int>(isSynced.value);
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
          ..write('checkDate: $checkDate, ')
          ..write('version: $version, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Accounts accounts = Accounts(this);
  late final Routines routines = Routines(this);
  late final DaysGroup daysGroup = DaysGroup(this);
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
    routines,
    daysGroup,
    exercises,
    routineItems,
    routineSets,
    tSessions,
    tLogs,
    measurements,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('days_group', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routines',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('days_group', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'exercises',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'exercises',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('routine_items', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'days_group',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'days_group',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('routine_items', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routine_items',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('routine_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'routine_items',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('routine_sets', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        't_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('t_logs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        't_sessions',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('t_logs', kind: UpdateKind.update)],
    ),
  ]);
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
