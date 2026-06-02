// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountsTable.$convertertype);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uid, email, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
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
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      type: $AccountsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
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
  final String uid;
  final String email;
  final AccountType type;
  final DateTime createdAt;
  const Account({
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
    {
      map['type'] = Variable<String>($AccountsTable.$convertertype.toSql(type));
    }
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

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      uid: serializer.fromJson<String>(json['uid']),
      email: serializer.fromJson<String>(json['email']),
      type: $AccountsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'email': serializer.toJson<String>(email),
      'type': serializer.toJson<String>(
        $AccountsTable.$convertertype.toJson(type),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Account copyWith({
    String? uid,
    String? email,
    AccountType? type,
    DateTime? createdAt,
  }) => Account(
    uid: uid ?? this.uid,
    email: email ?? this.email,
    type: type ?? this.type,
    createdAt: createdAt ?? this.createdAt,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      uid: data.uid.present ? data.uid.value : this.uid,
      email: data.email.present ? data.email.value : this.email,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
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
      (other is Account &&
          other.uid == this.uid &&
          other.email == this.email &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> uid;
  final Value<String> email;
  final Value<AccountType> type;
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
    required AccountType type,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       email = Value(email),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<Account> custom({
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

  AccountsCompanion copyWith({
    Value<String>? uid,
    Value<String>? email,
    Value<AccountType>? type,
    Value<DateTime>? createdAt,
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
      map['type'] = Variable<String>(
        $AccountsTable.$convertertype.toSql(type.value),
      );
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

class $RoutinesTable extends Routines with TableInfo<$RoutinesTable, Routine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCurrentMeta = const VerificationMeta(
    'isCurrent',
  );
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
    'is_current',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_current" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
  VerificationContext validateIntegrity(
    Insertable<Routine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_current')) {
      context.handle(
        _isCurrentMeta,
        isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Routine(
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_current'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
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
  const Routine({
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
    map['is_current'] = Variable<bool>(isCurrent);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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

  factory Routine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  Routine copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? version,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isCurrent,
    bool? isSynced,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Routine(
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

  RoutinesCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? version,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isCurrent,
    Value<bool>? isSynced,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _dayNameMeta = const VerificationMeta(
    'dayName',
  );
  @override
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
    'day_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<int> routineId = GeneratedColumn<int>(
    'routine_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routines (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
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
  VerificationContext validateIntegrity(
    Insertable<DaysGroupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('day_name')) {
      context.handle(
        _dayNameMeta,
        dayName.isAcceptableOrUnknown(data['day_name']!, _dayNameMeta),
      );
    } else if (isInserting) {
      context.missing(_dayNameMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}routine_id'],
      )!,
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
    map['is_synced'] = Variable<bool>(isSynced);
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

  DaysGroupData copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? index,
    int? version,
    String? dayName,
    bool? isSynced,
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
  }) : index = Value(index),
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

  DaysGroupCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? index,
    Value<int>? version,
    Value<String>? dayName,
    Value<bool>? isSynced,
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

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageNameMeta = const VerificationMeta(
    'imageName',
  );
  @override
  late final GeneratedColumn<String> imageName = GeneratedColumn<String>(
    'image_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _muscleGroupCodeMeta = const VerificationMeta(
    'muscleGroupCode',
  );
  @override
  late final GeneratedColumn<String> muscleGroupCode = GeneratedColumn<String>(
    'muscle_group_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _muscleGroupNameMeta = const VerificationMeta(
    'muscleGroupName',
  );
  @override
  late final GeneratedColumn<String> muscleGroupName = GeneratedColumn<String>(
    'muscle_group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _muscleHeadCodeMeta = const VerificationMeta(
    'muscleHeadCode',
  );
  @override
  late final GeneratedColumn<String> muscleHeadCode = GeneratedColumn<String>(
    'muscle_head_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _muscleHeadNameMeta = const VerificationMeta(
    'muscleHeadName',
  );
  @override
  late final GeneratedColumn<String> muscleHeadName = GeneratedColumn<String>(
    'muscle_head_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lateralsMeta = const VerificationMeta(
    'laterals',
  );
  @override
  late final GeneratedColumn<String> laterals = GeneratedColumn<String>(
    'laterals',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toolCodeMeta = const VerificationMeta(
    'toolCode',
  );
  @override
  late final GeneratedColumn<String> toolCode = GeneratedColumn<String>(
    'tool_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toolNameMeta = const VerificationMeta(
    'toolName',
  );
  @override
  late final GeneratedColumn<String> toolName = GeneratedColumn<String>(
    'tool_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _auxMuscle1Meta = const VerificationMeta(
    'auxMuscle1',
  );
  @override
  late final GeneratedColumn<String> auxMuscle1 = GeneratedColumn<String>(
    'aux_muscle1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _auxMuscle2Meta = const VerificationMeta(
    'auxMuscle2',
  );
  @override
  late final GeneratedColumn<String> auxMuscle2 = GeneratedColumn<String>(
    'aux_muscle2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _auxMuscle3Meta = const VerificationMeta(
    'auxMuscle3',
  );
  @override
  late final GeneratedColumn<String> auxMuscle3 = GeneratedColumn<String>(
    'aux_muscle3',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    apiId,
    name,
    imageName,
    muscleGroupCode,
    muscleGroupName,
    muscleHeadCode,
    muscleHeadName,
    laterals,
    toolCode,
    toolName,
    auxMuscle1,
    auxMuscle2,
    auxMuscle3,
    description,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_apiIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_name')) {
      context.handle(
        _imageNameMeta,
        imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta),
      );
    }
    if (data.containsKey('muscle_group_code')) {
      context.handle(
        _muscleGroupCodeMeta,
        muscleGroupCode.isAcceptableOrUnknown(
          data['muscle_group_code']!,
          _muscleGroupCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_muscleGroupCodeMeta);
    }
    if (data.containsKey('muscle_group_name')) {
      context.handle(
        _muscleGroupNameMeta,
        muscleGroupName.isAcceptableOrUnknown(
          data['muscle_group_name']!,
          _muscleGroupNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_muscleGroupNameMeta);
    }
    if (data.containsKey('muscle_head_code')) {
      context.handle(
        _muscleHeadCodeMeta,
        muscleHeadCode.isAcceptableOrUnknown(
          data['muscle_head_code']!,
          _muscleHeadCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_muscleHeadCodeMeta);
    }
    if (data.containsKey('muscle_head_name')) {
      context.handle(
        _muscleHeadNameMeta,
        muscleHeadName.isAcceptableOrUnknown(
          data['muscle_head_name']!,
          _muscleHeadNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_muscleHeadNameMeta);
    }
    if (data.containsKey('laterals')) {
      context.handle(
        _lateralsMeta,
        laterals.isAcceptableOrUnknown(data['laterals']!, _lateralsMeta),
      );
    } else if (isInserting) {
      context.missing(_lateralsMeta);
    }
    if (data.containsKey('tool_code')) {
      context.handle(
        _toolCodeMeta,
        toolCode.isAcceptableOrUnknown(data['tool_code']!, _toolCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_toolCodeMeta);
    }
    if (data.containsKey('tool_name')) {
      context.handle(
        _toolNameMeta,
        toolName.isAcceptableOrUnknown(data['tool_name']!, _toolNameMeta),
      );
    } else if (isInserting) {
      context.missing(_toolNameMeta);
    }
    if (data.containsKey('aux_muscle1')) {
      context.handle(
        _auxMuscle1Meta,
        auxMuscle1.isAcceptableOrUnknown(data['aux_muscle1']!, _auxMuscle1Meta),
      );
    }
    if (data.containsKey('aux_muscle2')) {
      context.handle(
        _auxMuscle2Meta,
        auxMuscle2.isAcceptableOrUnknown(data['aux_muscle2']!, _auxMuscle2Meta),
      );
    }
    if (data.containsKey('aux_muscle3')) {
      context.handle(
        _auxMuscle3Meta,
        auxMuscle3.isAcceptableOrUnknown(data['aux_muscle3']!, _auxMuscle3Meta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {apiId};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_name'],
      ),
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
      laterals: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}laterals'],
      )!,
      toolCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tool_code'],
      )!,
      toolName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tool_name'],
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
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String apiId;
  final String name;
  final String? imageName;
  final String muscleGroupCode;
  final String muscleGroupName;
  final String muscleHeadCode;
  final String muscleHeadName;
  final String laterals;
  final String toolCode;
  final String toolName;
  final String? auxMuscle1;
  final String? auxMuscle2;
  final String? auxMuscle3;
  final String? description;
  final DateTime timestamp;
  const Exercise({
    required this.apiId,
    required this.name,
    this.imageName,
    required this.muscleGroupCode,
    required this.muscleGroupName,
    required this.muscleHeadCode,
    required this.muscleHeadName,
    required this.laterals,
    required this.toolCode,
    required this.toolName,
    this.auxMuscle1,
    this.auxMuscle2,
    this.auxMuscle3,
    this.description,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    map['muscle_group_code'] = Variable<String>(muscleGroupCode);
    map['muscle_group_name'] = Variable<String>(muscleGroupName);
    map['muscle_head_code'] = Variable<String>(muscleHeadCode);
    map['muscle_head_name'] = Variable<String>(muscleHeadName);
    map['laterals'] = Variable<String>(laterals);
    map['tool_code'] = Variable<String>(toolCode);
    map['tool_name'] = Variable<String>(toolName);
    if (!nullToAbsent || auxMuscle1 != null) {
      map['aux_muscle1'] = Variable<String>(auxMuscle1);
    }
    if (!nullToAbsent || auxMuscle2 != null) {
      map['aux_muscle2'] = Variable<String>(auxMuscle2);
    }
    if (!nullToAbsent || auxMuscle3 != null) {
      map['aux_muscle3'] = Variable<String>(auxMuscle3);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      apiId: Value(apiId),
      name: Value(name),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
      muscleGroupCode: Value(muscleGroupCode),
      muscleGroupName: Value(muscleGroupName),
      muscleHeadCode: Value(muscleHeadCode),
      muscleHeadName: Value(muscleHeadName),
      laterals: Value(laterals),
      toolCode: Value(toolCode),
      toolName: Value(toolName),
      auxMuscle1: auxMuscle1 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle1),
      auxMuscle2: auxMuscle2 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle2),
      auxMuscle3: auxMuscle3 == null && nullToAbsent
          ? const Value.absent()
          : Value(auxMuscle3),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      timestamp: Value(timestamp),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      apiId: serializer.fromJson<String>(json['apiId']),
      name: serializer.fromJson<String>(json['name']),
      imageName: serializer.fromJson<String?>(json['imageName']),
      muscleGroupCode: serializer.fromJson<String>(json['muscleGroupCode']),
      muscleGroupName: serializer.fromJson<String>(json['muscleGroupName']),
      muscleHeadCode: serializer.fromJson<String>(json['muscleHeadCode']),
      muscleHeadName: serializer.fromJson<String>(json['muscleHeadName']),
      laterals: serializer.fromJson<String>(json['laterals']),
      toolCode: serializer.fromJson<String>(json['toolCode']),
      toolName: serializer.fromJson<String>(json['toolName']),
      auxMuscle1: serializer.fromJson<String?>(json['auxMuscle1']),
      auxMuscle2: serializer.fromJson<String?>(json['auxMuscle2']),
      auxMuscle3: serializer.fromJson<String?>(json['auxMuscle3']),
      description: serializer.fromJson<String?>(json['description']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apiId': serializer.toJson<String>(apiId),
      'name': serializer.toJson<String>(name),
      'imageName': serializer.toJson<String?>(imageName),
      'muscleGroupCode': serializer.toJson<String>(muscleGroupCode),
      'muscleGroupName': serializer.toJson<String>(muscleGroupName),
      'muscleHeadCode': serializer.toJson<String>(muscleHeadCode),
      'muscleHeadName': serializer.toJson<String>(muscleHeadName),
      'laterals': serializer.toJson<String>(laterals),
      'toolCode': serializer.toJson<String>(toolCode),
      'toolName': serializer.toJson<String>(toolName),
      'auxMuscle1': serializer.toJson<String?>(auxMuscle1),
      'auxMuscle2': serializer.toJson<String?>(auxMuscle2),
      'auxMuscle3': serializer.toJson<String?>(auxMuscle3),
      'description': serializer.toJson<String?>(description),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Exercise copyWith({
    String? apiId,
    String? name,
    Value<String?> imageName = const Value.absent(),
    String? muscleGroupCode,
    String? muscleGroupName,
    String? muscleHeadCode,
    String? muscleHeadName,
    String? laterals,
    String? toolCode,
    String? toolName,
    Value<String?> auxMuscle1 = const Value.absent(),
    Value<String?> auxMuscle2 = const Value.absent(),
    Value<String?> auxMuscle3 = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? timestamp,
  }) => Exercise(
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    imageName: imageName.present ? imageName.value : this.imageName,
    muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
    muscleGroupName: muscleGroupName ?? this.muscleGroupName,
    muscleHeadCode: muscleHeadCode ?? this.muscleHeadCode,
    muscleHeadName: muscleHeadName ?? this.muscleHeadName,
    laterals: laterals ?? this.laterals,
    toolCode: toolCode ?? this.toolCode,
    toolName: toolName ?? this.toolName,
    auxMuscle1: auxMuscle1.present ? auxMuscle1.value : this.auxMuscle1,
    auxMuscle2: auxMuscle2.present ? auxMuscle2.value : this.auxMuscle2,
    auxMuscle3: auxMuscle3.present ? auxMuscle3.value : this.auxMuscle3,
    description: description.present ? description.value : this.description,
    timestamp: timestamp ?? this.timestamp,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      name: data.name.present ? data.name.value : this.name,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
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
      laterals: data.laterals.present ? data.laterals.value : this.laterals,
      toolCode: data.toolCode.present ? data.toolCode.value : this.toolCode,
      toolName: data.toolName.present ? data.toolName.value : this.toolName,
      auxMuscle1: data.auxMuscle1.present
          ? data.auxMuscle1.value
          : this.auxMuscle1,
      auxMuscle2: data.auxMuscle2.present
          ? data.auxMuscle2.value
          : this.auxMuscle2,
      auxMuscle3: data.auxMuscle3.present
          ? data.auxMuscle3.value
          : this.auxMuscle3,
      description: data.description.present
          ? data.description.value
          : this.description,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('imageName: $imageName, ')
          ..write('muscleGroupCode: $muscleGroupCode, ')
          ..write('muscleGroupName: $muscleGroupName, ')
          ..write('muscleHeadCode: $muscleHeadCode, ')
          ..write('muscleHeadName: $muscleHeadName, ')
          ..write('laterals: $laterals, ')
          ..write('toolCode: $toolCode, ')
          ..write('toolName: $toolName, ')
          ..write('auxMuscle1: $auxMuscle1, ')
          ..write('auxMuscle2: $auxMuscle2, ')
          ..write('auxMuscle3: $auxMuscle3, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    apiId,
    name,
    imageName,
    muscleGroupCode,
    muscleGroupName,
    muscleHeadCode,
    muscleHeadName,
    laterals,
    toolCode,
    toolName,
    auxMuscle1,
    auxMuscle2,
    auxMuscle3,
    description,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.imageName == this.imageName &&
          other.muscleGroupCode == this.muscleGroupCode &&
          other.muscleGroupName == this.muscleGroupName &&
          other.muscleHeadCode == this.muscleHeadCode &&
          other.muscleHeadName == this.muscleHeadName &&
          other.laterals == this.laterals &&
          other.toolCode == this.toolCode &&
          other.toolName == this.toolName &&
          other.auxMuscle1 == this.auxMuscle1 &&
          other.auxMuscle2 == this.auxMuscle2 &&
          other.auxMuscle3 == this.auxMuscle3 &&
          other.description == this.description &&
          other.timestamp == this.timestamp);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> apiId;
  final Value<String> name;
  final Value<String?> imageName;
  final Value<String> muscleGroupCode;
  final Value<String> muscleGroupName;
  final Value<String> muscleHeadCode;
  final Value<String> muscleHeadName;
  final Value<String> laterals;
  final Value<String> toolCode;
  final Value<String> toolName;
  final Value<String?> auxMuscle1;
  final Value<String?> auxMuscle2;
  final Value<String?> auxMuscle3;
  final Value<String?> description;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.apiId = const Value.absent(),
    this.name = const Value.absent(),
    this.imageName = const Value.absent(),
    this.muscleGroupCode = const Value.absent(),
    this.muscleGroupName = const Value.absent(),
    this.muscleHeadCode = const Value.absent(),
    this.muscleHeadName = const Value.absent(),
    this.laterals = const Value.absent(),
    this.toolCode = const Value.absent(),
    this.toolName = const Value.absent(),
    this.auxMuscle1 = const Value.absent(),
    this.auxMuscle2 = const Value.absent(),
    this.auxMuscle3 = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String apiId,
    required String name,
    this.imageName = const Value.absent(),
    required String muscleGroupCode,
    required String muscleGroupName,
    required String muscleHeadCode,
    required String muscleHeadName,
    required String laterals,
    required String toolCode,
    required String toolName,
    this.auxMuscle1 = const Value.absent(),
    this.auxMuscle2 = const Value.absent(),
    this.auxMuscle3 = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : apiId = Value(apiId),
       name = Value(name),
       muscleGroupCode = Value(muscleGroupCode),
       muscleGroupName = Value(muscleGroupName),
       muscleHeadCode = Value(muscleHeadCode),
       muscleHeadName = Value(muscleHeadName),
       laterals = Value(laterals),
       toolCode = Value(toolCode),
       toolName = Value(toolName);
  static Insertable<Exercise> custom({
    Expression<String>? apiId,
    Expression<String>? name,
    Expression<String>? imageName,
    Expression<String>? muscleGroupCode,
    Expression<String>? muscleGroupName,
    Expression<String>? muscleHeadCode,
    Expression<String>? muscleHeadName,
    Expression<String>? laterals,
    Expression<String>? toolCode,
    Expression<String>? toolName,
    Expression<String>? auxMuscle1,
    Expression<String>? auxMuscle2,
    Expression<String>? auxMuscle3,
    Expression<String>? description,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (name != null) 'name': name,
      if (imageName != null) 'image_name': imageName,
      if (muscleGroupCode != null) 'muscle_group_code': muscleGroupCode,
      if (muscleGroupName != null) 'muscle_group_name': muscleGroupName,
      if (muscleHeadCode != null) 'muscle_head_code': muscleHeadCode,
      if (muscleHeadName != null) 'muscle_head_name': muscleHeadName,
      if (laterals != null) 'laterals': laterals,
      if (toolCode != null) 'tool_code': toolCode,
      if (toolName != null) 'tool_name': toolName,
      if (auxMuscle1 != null) 'aux_muscle1': auxMuscle1,
      if (auxMuscle2 != null) 'aux_muscle2': auxMuscle2,
      if (auxMuscle3 != null) 'aux_muscle3': auxMuscle3,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? apiId,
    Value<String>? name,
    Value<String?>? imageName,
    Value<String>? muscleGroupCode,
    Value<String>? muscleGroupName,
    Value<String>? muscleHeadCode,
    Value<String>? muscleHeadName,
    Value<String>? laterals,
    Value<String>? toolCode,
    Value<String>? toolName,
    Value<String?>? auxMuscle1,
    Value<String?>? auxMuscle2,
    Value<String?>? auxMuscle3,
    Value<String?>? description,
    Value<DateTime>? timestamp,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      imageName: imageName ?? this.imageName,
      muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
      muscleGroupName: muscleGroupName ?? this.muscleGroupName,
      muscleHeadCode: muscleHeadCode ?? this.muscleHeadCode,
      muscleHeadName: muscleHeadName ?? this.muscleHeadName,
      laterals: laterals ?? this.laterals,
      toolCode: toolCode ?? this.toolCode,
      toolName: toolName ?? this.toolName,
      auxMuscle1: auxMuscle1 ?? this.auxMuscle1,
      auxMuscle2: auxMuscle2 ?? this.auxMuscle2,
      auxMuscle3: auxMuscle3 ?? this.auxMuscle3,
      description: description ?? this.description,
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
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
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
    if (laterals.present) {
      map['laterals'] = Variable<String>(laterals.value);
    }
    if (toolCode.present) {
      map['tool_code'] = Variable<String>(toolCode.value);
    }
    if (toolName.present) {
      map['tool_name'] = Variable<String>(toolName.value);
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
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
          ..write('imageName: $imageName, ')
          ..write('muscleGroupCode: $muscleGroupCode, ')
          ..write('muscleGroupName: $muscleGroupName, ')
          ..write('muscleHeadCode: $muscleHeadCode, ')
          ..write('muscleHeadName: $muscleHeadName, ')
          ..write('laterals: $laterals, ')
          ..write('toolCode: $toolCode, ')
          ..write('toolName: $toolName, ')
          ..write('auxMuscle1: $auxMuscle1, ')
          ..write('auxMuscle2: $auxMuscle2, ')
          ..write('auxMuscle3: $auxMuscle3, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (api_id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
    'day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES days_group (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
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
  VerificationContext validateIntegrity(
    Insertable<RoutineItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('day_id')) {
      context.handle(
        _dayIdMeta,
        dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta),
      );
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
        DriftSqlType.bool,
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
  $RoutineItemsTable createAlias(String alias) {
    return $RoutineItemsTable(attachedDatabase, alias);
  }
}

class RoutineItem extends DataClass implements Insertable<RoutineItem> {
  final int id;
  final int? apiId;
  final int index;
  final String? notes;
  final int version;
  final bool isSynced;
  final String exerciseId;
  final int dayId;
  const RoutineItem({
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
    map['is_synced'] = Variable<bool>(isSynced);
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

  factory RoutineItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineItem(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      notes: serializer.fromJson<String?>(json['notes']),
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
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
      'isSynced': serializer.toJson<bool>(isSynced),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'dayId': serializer.toJson<int>(dayId),
    };
  }

  RoutineItem copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? index,
    Value<String?> notes = const Value.absent(),
    int? version,
    bool? isSynced,
    String? exerciseId,
    int? dayId,
  }) => RoutineItem(
    id: id ?? this.id,
    apiId: apiId.present ? apiId.value : this.apiId,
    index: index ?? this.index,
    notes: notes.present ? notes.value : this.notes,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
    exerciseId: exerciseId ?? this.exerciseId,
    dayId: dayId ?? this.dayId,
  );
  RoutineItem copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItem(
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
    return (StringBuffer('RoutineItem(')
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
      (other is RoutineItem &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.notes == this.notes &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.exerciseId == this.exerciseId &&
          other.dayId == this.dayId);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItem> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<String?> notes;
  final Value<int> version;
  final Value<bool> isSynced;
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
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    required String exerciseId,
    required int dayId,
  }) : index = Value(index),
       exerciseId = Value(exerciseId),
       dayId = Value(dayId);
  static Insertable<RoutineItem> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<String>? notes,
    Expression<int>? version,
    Expression<bool>? isSynced,
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
    Value<bool>? isSynced,
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
      map['is_synced'] = Variable<bool>(isSynced.value);
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

class $RoutineSetsTable extends RoutineSets
    with TableInfo<$RoutineSetsTable, RoutineSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundIndexMeta = const VerificationMeta(
    'roundIndex',
  );
  @override
  late final GeneratedColumn<int> roundIndex = GeneratedColumn<int>(
    'round_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsCountMeta = const VerificationMeta(
    'repsCount',
  );
  @override
  late final GeneratedColumn<int> repsCount = GeneratedColumn<int>(
    'reps_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _routineItemIdMeta = const VerificationMeta(
    'routineItemId',
  );
  @override
  late final GeneratedColumn<int> routineItemId = GeneratedColumn<int>(
    'routine_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routine_items (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
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
  VerificationContext validateIntegrity(
    Insertable<RoutineSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('round_index')) {
      context.handle(
        _roundIndexMeta,
        roundIndex.isAcceptableOrUnknown(data['round_index']!, _roundIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_roundIndexMeta);
    }
    if (data.containsKey('reps_count')) {
      context.handle(
        _repsCountMeta,
        repsCount.isAcceptableOrUnknown(data['reps_count']!, _repsCountMeta),
      );
    } else if (isInserting) {
      context.missing(_repsCountMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('routine_item_id')) {
      context.handle(
        _routineItemIdMeta,
        routineItemId.isAcceptableOrUnknown(
          data['routine_item_id']!,
          _routineItemIdMeta,
        ),
      );
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      routineItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}routine_item_id'],
      )!,
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
  const RoutineSet({
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
    map['is_synced'] = Variable<bool>(isSynced);
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

  factory RoutineSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  RoutineSet copyWith({
    int? id,
    Value<int?> apiId = const Value.absent(),
    int? roundIndex,
    int? repsCount,
    int? version,
    bool? isSynced,
    int? routineItemId,
  }) => RoutineSet(
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
  }) : roundIndex = Value(roundIndex),
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

  RoutineSetsCompanion copyWith({
    Value<int>? id,
    Value<int?>? apiId,
    Value<int>? roundIndex,
    Value<int>? repsCount,
    Value<int>? version,
    Value<bool>? isSynced,
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
    'ts_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
    'day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayNameMeta = const VerificationMeta(
    'dayName',
  );
  @override
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
    'day_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  VerificationContext validateIntegrity(
    Insertable<TSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ts_id')) {
      context.handle(
        _tsIdMeta,
        tsId.isAcceptableOrUnknown(data['ts_id']!, _tsIdMeta),
      );
    }
    if (data.containsKey('day_id')) {
      context.handle(
        _dayIdMeta,
        dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('day_name')) {
      context.handle(
        _dayNameMeta,
        dayName.isAcceptableOrUnknown(data['day_name']!, _dayNameMeta),
      );
    } else if (isInserting) {
      context.missing(_dayNameMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tsId};
  @override
  TSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TSession(
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
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
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
  final String dayName;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final double progress;
  final int? apiId;
  final int version;
  final bool isSynced;
  const TSession({
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

  factory TSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TSession(
      tsId: serializer.fromJson<int>(json['tsId']),
      dayId: serializer.fromJson<int>(json['dayId']),
      dayName: serializer.fromJson<String>(json['dayName']),
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
      'dayName': serializer.toJson<String>(dayName),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'progress': serializer.toJson<double>(progress),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  TSession copyWith({
    int? tsId,
    int? dayId,
    String? dayName,
    DateTime? startedAt,
    Value<DateTime?> finishedAt = const Value.absent(),
    double? progress,
    Value<int?> apiId = const Value.absent(),
    int? version,
    bool? isSynced,
  }) => TSession(
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
  TSession copyWithCompanion(TSessionsCompanion data) {
    return TSession(
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
    return (StringBuffer('TSession(')
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
      (other is TSession &&
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

class TSessionsCompanion extends UpdateCompanion<TSession> {
  final Value<int> tsId;
  final Value<int> dayId;
  final Value<String> dayName;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<double> progress;
  final Value<int?> apiId;
  final Value<int> version;
  final Value<bool> isSynced;
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
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    this.progress = const Value.absent(),
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : dayId = Value(dayId),
       dayName = Value(dayName),
       startedAt = Value(startedAt);
  static Insertable<TSession> custom({
    Expression<int>? tsId,
    Expression<int>? dayId,
    Expression<String>? dayName,
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
    Value<DateTime>? startedAt,
    Value<DateTime?>? finishedAt,
    Value<double>? progress,
    Value<int?>? apiId,
    Value<int>? version,
    Value<bool>? isSynced,
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

class $TLogsTable extends TLogs with TableInfo<$TLogsTable, TLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _logIdMeta = const VerificationMeta('logId');
  @override
  late final GeneratedColumn<int> logId = GeneratedColumn<int>(
    'log_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIndexMeta = const VerificationMeta(
    'exerciseIndex',
  );
  @override
  late final GeneratedColumn<int> exerciseIndex = GeneratedColumn<int>(
    'exercise_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setIndexMeta = const VerificationMeta(
    'setIndex',
  );
  @override
  late final GeneratedColumn<int> setIndex = GeneratedColumn<int>(
    'set_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedRepsMeta = const VerificationMeta(
    'finishedReps',
  );
  @override
  late final GeneratedColumn<int> finishedReps = GeneratedColumn<int>(
    'finished_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES t_sessions (ts_id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    logId,
    exerciseId,
    exerciseIndex,
    setIndex,
    reps,
    finishedReps,
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
  VerificationContext validateIntegrity(
    Insertable<TLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('log_id')) {
      context.handle(
        _logIdMeta,
        logId.isAcceptableOrUnknown(data['log_id']!, _logIdMeta),
      );
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_index')) {
      context.handle(
        _exerciseIndexMeta,
        exerciseIndex.isAcceptableOrUnknown(
          data['exercise_index']!,
          _exerciseIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseIndexMeta);
    }
    if (data.containsKey('set_index')) {
      context.handle(
        _setIndexMeta,
        setIndex.isAcceptableOrUnknown(data['set_index']!, _setIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_setIndexMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('finished_reps')) {
      context.handle(
        _finishedRepsMeta,
        finishedReps.isAcceptableOrUnknown(
          data['finished_reps']!,
          _finishedRepsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finishedRepsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
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
      finishedReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}finished_reps'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
    );
  }

  @override
  $TLogsTable createAlias(String alias) {
    return $TLogsTable(attachedDatabase, alias);
  }
}

class TLog extends DataClass implements Insertable<TLog> {
  final int logId;
  final String exerciseId;
  final int exerciseIndex;
  final int setIndex;
  final int reps;
  final int finishedReps;
  final double weight;
  final DateTime completedAt;
  final int? apiId;
  final int version;
  final bool isSynced;
  final int sessionId;
  const TLog({
    required this.logId,
    required this.exerciseId,
    required this.exerciseIndex,
    required this.setIndex,
    required this.reps,
    required this.finishedReps,
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
    map['finished_reps'] = Variable<int>(finishedReps);
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
      finishedReps: Value(finishedReps),
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

  factory TLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TLog(
      logId: serializer.fromJson<int>(json['logId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseIndex: serializer.fromJson<int>(json['exerciseIndex']),
      setIndex: serializer.fromJson<int>(json['setIndex']),
      reps: serializer.fromJson<int>(json['reps']),
      finishedReps: serializer.fromJson<int>(json['finishedReps']),
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
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseIndex': serializer.toJson<int>(exerciseIndex),
      'setIndex': serializer.toJson<int>(setIndex),
      'reps': serializer.toJson<int>(reps),
      'finishedReps': serializer.toJson<int>(finishedReps),
      'weight': serializer.toJson<double>(weight),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'apiId': serializer.toJson<int?>(apiId),
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
      'sessionId': serializer.toJson<int>(sessionId),
    };
  }

  TLog copyWith({
    int? logId,
    String? exerciseId,
    int? exerciseIndex,
    int? setIndex,
    int? reps,
    int? finishedReps,
    double? weight,
    DateTime? completedAt,
    Value<int?> apiId = const Value.absent(),
    int? version,
    bool? isSynced,
    int? sessionId,
  }) => TLog(
    logId: logId ?? this.logId,
    exerciseId: exerciseId ?? this.exerciseId,
    exerciseIndex: exerciseIndex ?? this.exerciseIndex,
    setIndex: setIndex ?? this.setIndex,
    reps: reps ?? this.reps,
    finishedReps: finishedReps ?? this.finishedReps,
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
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      exerciseIndex: data.exerciseIndex.present
          ? data.exerciseIndex.value
          : this.exerciseIndex,
      setIndex: data.setIndex.present ? data.setIndex.value : this.setIndex,
      reps: data.reps.present ? data.reps.value : this.reps,
      finishedReps: data.finishedReps.present
          ? data.finishedReps.value
          : this.finishedReps,
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
    return (StringBuffer('TLog(')
          ..write('logId: $logId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseIndex: $exerciseIndex, ')
          ..write('setIndex: $setIndex, ')
          ..write('reps: $reps, ')
          ..write('finishedReps: $finishedReps, ')
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
    finishedReps,
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
      (other is TLog &&
          other.logId == this.logId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseIndex == this.exerciseIndex &&
          other.setIndex == this.setIndex &&
          other.reps == this.reps &&
          other.finishedReps == this.finishedReps &&
          other.weight == this.weight &&
          other.completedAt == this.completedAt &&
          other.apiId == this.apiId &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.sessionId == this.sessionId);
}

class TLogsCompanion extends UpdateCompanion<TLog> {
  final Value<int> logId;
  final Value<String> exerciseId;
  final Value<int> exerciseIndex;
  final Value<int> setIndex;
  final Value<int> reps;
  final Value<int> finishedReps;
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
    this.finishedReps = const Value.absent(),
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
    required int finishedReps,
    required double weight,
    required DateTime completedAt,
    this.apiId = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int sessionId,
  }) : exerciseId = Value(exerciseId),
       exerciseIndex = Value(exerciseIndex),
       setIndex = Value(setIndex),
       reps = Value(reps),
       finishedReps = Value(finishedReps),
       weight = Value(weight),
       completedAt = Value(completedAt),
       sessionId = Value(sessionId);
  static Insertable<TLog> custom({
    Expression<int>? logId,
    Expression<String>? exerciseId,
    Expression<int>? exerciseIndex,
    Expression<int>? setIndex,
    Expression<int>? reps,
    Expression<int>? finishedReps,
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
      if (finishedReps != null) 'finished_reps': finishedReps,
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
    Value<int>? finishedReps,
    Value<double>? weight,
    Value<DateTime>? completedAt,
    Value<int?>? apiId,
    Value<int>? version,
    Value<bool>? isSynced,
    Value<int>? sessionId,
  }) {
    return TLogsCompanion(
      logId: logId ?? this.logId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseIndex: exerciseIndex ?? this.exerciseIndex,
      setIndex: setIndex ?? this.setIndex,
      reps: reps ?? this.reps,
      finishedReps: finishedReps ?? this.finishedReps,
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
    if (finishedReps.present) {
      map['finished_reps'] = Variable<int>(finishedReps.value);
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
          ..write('finishedReps: $finishedReps, ')
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

class $MeasurementsTable extends Measurements
    with TableInfo<$MeasurementsTable, Measurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<int> apiId = GeneratedColumn<int>(
    'api_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lArmMeta = const VerificationMeta('lArm');
  @override
  late final GeneratedColumn<double> lArm = GeneratedColumn<double>(
    'l_arm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rArmMeta = const VerificationMeta('rArm');
  @override
  late final GeneratedColumn<double> rArm = GeneratedColumn<double>(
    'r_arm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lHumerusMeta = const VerificationMeta(
    'lHumerus',
  );
  @override
  late final GeneratedColumn<double> lHumerus = GeneratedColumn<double>(
    'l_humerus',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rHumerusMeta = const VerificationMeta(
    'rHumerus',
  );
  @override
  late final GeneratedColumn<double> rHumerus = GeneratedColumn<double>(
    'r_humerus',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lThighMeta = const VerificationMeta('lThigh');
  @override
  late final GeneratedColumn<double> lThigh = GeneratedColumn<double>(
    'l_thigh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rThighMeta = const VerificationMeta('rThigh');
  @override
  late final GeneratedColumn<double> rThigh = GeneratedColumn<double>(
    'r_thigh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lLegMeta = const VerificationMeta('lLeg');
  @override
  late final GeneratedColumn<double> lLeg = GeneratedColumn<double>(
    'l_leg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rLegMeta = const VerificationMeta('rLeg');
  @override
  late final GeneratedColumn<double> rLeg = GeneratedColumn<double>(
    'r_leg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _neckMeta = const VerificationMeta('neck');
  @override
  late final GeneratedColumn<double> neck = GeneratedColumn<double>(
    'neck',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shouldersMeta = const VerificationMeta(
    'shoulders',
  );
  @override
  late final GeneratedColumn<double> shoulders = GeneratedColumn<double>(
    'shoulders',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waistMeta = const VerificationMeta('waist');
  @override
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
    'waist',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chestMeta = const VerificationMeta('chest');
  @override
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
    'chest',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hipsMeta = const VerificationMeta('hips');
  @override
  late final GeneratedColumn<double> hips = GeneratedColumn<double>(
    'hips',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkDateMeta = const VerificationMeta(
    'checkDate',
  );
  @override
  late final GeneratedColumn<DateTime> checkDate = GeneratedColumn<DateTime>(
    'check_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  VerificationContext validateIntegrity(
    Insertable<Measurement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('l_arm')) {
      context.handle(
        _lArmMeta,
        lArm.isAcceptableOrUnknown(data['l_arm']!, _lArmMeta),
      );
    } else if (isInserting) {
      context.missing(_lArmMeta);
    }
    if (data.containsKey('r_arm')) {
      context.handle(
        _rArmMeta,
        rArm.isAcceptableOrUnknown(data['r_arm']!, _rArmMeta),
      );
    } else if (isInserting) {
      context.missing(_rArmMeta);
    }
    if (data.containsKey('l_humerus')) {
      context.handle(
        _lHumerusMeta,
        lHumerus.isAcceptableOrUnknown(data['l_humerus']!, _lHumerusMeta),
      );
    } else if (isInserting) {
      context.missing(_lHumerusMeta);
    }
    if (data.containsKey('r_humerus')) {
      context.handle(
        _rHumerusMeta,
        rHumerus.isAcceptableOrUnknown(data['r_humerus']!, _rHumerusMeta),
      );
    } else if (isInserting) {
      context.missing(_rHumerusMeta);
    }
    if (data.containsKey('l_thigh')) {
      context.handle(
        _lThighMeta,
        lThigh.isAcceptableOrUnknown(data['l_thigh']!, _lThighMeta),
      );
    } else if (isInserting) {
      context.missing(_lThighMeta);
    }
    if (data.containsKey('r_thigh')) {
      context.handle(
        _rThighMeta,
        rThigh.isAcceptableOrUnknown(data['r_thigh']!, _rThighMeta),
      );
    } else if (isInserting) {
      context.missing(_rThighMeta);
    }
    if (data.containsKey('l_leg')) {
      context.handle(
        _lLegMeta,
        lLeg.isAcceptableOrUnknown(data['l_leg']!, _lLegMeta),
      );
    } else if (isInserting) {
      context.missing(_lLegMeta);
    }
    if (data.containsKey('r_leg')) {
      context.handle(
        _rLegMeta,
        rLeg.isAcceptableOrUnknown(data['r_leg']!, _rLegMeta),
      );
    } else if (isInserting) {
      context.missing(_rLegMeta);
    }
    if (data.containsKey('neck')) {
      context.handle(
        _neckMeta,
        neck.isAcceptableOrUnknown(data['neck']!, _neckMeta),
      );
    } else if (isInserting) {
      context.missing(_neckMeta);
    }
    if (data.containsKey('shoulders')) {
      context.handle(
        _shouldersMeta,
        shoulders.isAcceptableOrUnknown(data['shoulders']!, _shouldersMeta),
      );
    } else if (isInserting) {
      context.missing(_shouldersMeta);
    }
    if (data.containsKey('waist')) {
      context.handle(
        _waistMeta,
        waist.isAcceptableOrUnknown(data['waist']!, _waistMeta),
      );
    } else if (isInserting) {
      context.missing(_waistMeta);
    }
    if (data.containsKey('chest')) {
      context.handle(
        _chestMeta,
        chest.isAcceptableOrUnknown(data['chest']!, _chestMeta),
      );
    } else if (isInserting) {
      context.missing(_chestMeta);
    }
    if (data.containsKey('hips')) {
      context.handle(
        _hipsMeta,
        hips.isAcceptableOrUnknown(data['hips']!, _hipsMeta),
      );
    } else if (isInserting) {
      context.missing(_hipsMeta);
    }
    if (data.containsKey('check_date')) {
      context.handle(
        _checkDateMeta,
        checkDate.isAcceptableOrUnknown(data['check_date']!, _checkDateMeta),
      );
    } else if (isInserting) {
      context.missing(_checkDateMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Measurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Measurement(
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
        DriftSqlType.dateTime,
        data['${effectivePrefix}check_date'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $MeasurementsTable createAlias(String alias) {
    return $MeasurementsTable(attachedDatabase, alias);
  }
}

class Measurement extends DataClass implements Insertable<Measurement> {
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
  final int version;
  final bool isSynced;
  const Measurement({
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
    map['check_date'] = Variable<DateTime>(checkDate);
    map['version'] = Variable<int>(version);
    map['is_synced'] = Variable<bool>(isSynced);
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

  factory Measurement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Measurement(
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
      version: serializer.fromJson<int>(json['version']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
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
      'version': serializer.toJson<int>(version),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Measurement copyWith({
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
    DateTime? checkDate,
    int? version,
    bool? isSynced,
  }) => Measurement(
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
  Measurement copyWithCompanion(MeasurementsCompanion data) {
    return Measurement(
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
    return (StringBuffer('Measurement(')
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
      (other is Measurement &&
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

class MeasurementsCompanion extends UpdateCompanion<Measurement> {
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
  final Value<int> version;
  final Value<bool> isSynced;
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
    required DateTime checkDate,
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
  static Insertable<Measurement> custom({
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
    Expression<int>? version,
    Expression<bool>? isSynced,
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
    Value<DateTime>? checkDate,
    Value<int>? version,
    Value<bool>? isSynced,
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
      map['check_date'] = Variable<DateTime>(checkDate.value);
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

class $IngredientsTable extends Ingredients
    with TableInfo<$IngredientsTable, IngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  @override
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingSizeInGramsMeta =
      const VerificationMeta('servingSizeInGrams');
  @override
  late final GeneratedColumn<String> servingSizeInGrams =
      GeneratedColumn<String>(
        'serving_size_in_grams',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<String> calories = GeneratedColumn<String>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<String> protein = GeneratedColumn<String>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<String> carbs = GeneratedColumn<String>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatsMeta = const VerificationMeta('fats');
  @override
  late final GeneratedColumn<String> fats = GeneratedColumn<String>(
    'fats',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    code,
    nameAr,
    nameEn,
    category,
    servingSizeInGrams,
    calories,
    protein,
    carbs,
    fats,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('serving_size_in_grams')) {
      context.handle(
        _servingSizeInGramsMeta,
        servingSizeInGrams.isAcceptableOrUnknown(
          data['serving_size_in_grams']!,
          _servingSizeInGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingSizeInGramsMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fats')) {
      context.handle(
        _fatsMeta,
        fats.isAcceptableOrUnknown(data['fats']!, _fatsMeta),
      );
    } else if (isInserting) {
      context.missing(_fatsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  IngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientData(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      servingSizeInGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serving_size_in_grams'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calories'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protein'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}carbs'],
      )!,
      fats: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fats'],
      )!,
    );
  }

  @override
  $IngredientsTable createAlias(String alias) {
    return $IngredientsTable(attachedDatabase, alias);
  }
}

class IngredientData extends DataClass implements Insertable<IngredientData> {
  final String code;
  final String nameAr;
  final String nameEn;
  final String category;
  final String servingSizeInGrams;
  final String calories;
  final String protein;
  final String carbs;
  final String fats;
  const IngredientData({
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['category'] = Variable<String>(category);
    map['serving_size_in_grams'] = Variable<String>(servingSizeInGrams);
    map['calories'] = Variable<String>(calories);
    map['protein'] = Variable<String>(protein);
    map['carbs'] = Variable<String>(carbs);
    map['fats'] = Variable<String>(fats);
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      code: Value(code),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      category: Value(category),
      servingSizeInGrams: Value(servingSizeInGrams),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fats: Value(fats),
    );
  }

  factory IngredientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientData(
      code: serializer.fromJson<String>(json['code']),
      nameAr: serializer.fromJson<String>(json['nameAr']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      category: serializer.fromJson<String>(json['category']),
      servingSizeInGrams: serializer.fromJson<String>(
        json['servingSizeInGrams'],
      ),
      calories: serializer.fromJson<String>(json['calories']),
      protein: serializer.fromJson<String>(json['protein']),
      carbs: serializer.fromJson<String>(json['carbs']),
      fats: serializer.fromJson<String>(json['fats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'nameAr': serializer.toJson<String>(nameAr),
      'nameEn': serializer.toJson<String>(nameEn),
      'category': serializer.toJson<String>(category),
      'servingSizeInGrams': serializer.toJson<String>(servingSizeInGrams),
      'calories': serializer.toJson<String>(calories),
      'protein': serializer.toJson<String>(protein),
      'carbs': serializer.toJson<String>(carbs),
      'fats': serializer.toJson<String>(fats),
    };
  }

  IngredientData copyWith({
    String? code,
    String? nameAr,
    String? nameEn,
    String? category,
    String? servingSizeInGrams,
    String? calories,
    String? protein,
    String? carbs,
    String? fats,
  }) => IngredientData(
    code: code ?? this.code,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    category: category ?? this.category,
    servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbs: carbs ?? this.carbs,
    fats: fats ?? this.fats,
  );
  IngredientData copyWithCompanion(IngredientsCompanion data) {
    return IngredientData(
      code: data.code.present ? data.code.value : this.code,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      category: data.category.present ? data.category.value : this.category,
      servingSizeInGrams: data.servingSizeInGrams.present
          ? data.servingSizeInGrams.value
          : this.servingSizeInGrams,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fats: data.fats.present ? data.fats.value : this.fats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientData(')
          ..write('code: $code, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category, ')
          ..write('servingSizeInGrams: $servingSizeInGrams, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fats: $fats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    code,
    nameAr,
    nameEn,
    category,
    servingSizeInGrams,
    calories,
    protein,
    carbs,
    fats,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientData &&
          other.code == this.code &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.category == this.category &&
          other.servingSizeInGrams == this.servingSizeInGrams &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fats == this.fats);
}

class IngredientsCompanion extends UpdateCompanion<IngredientData> {
  final Value<String> code;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> category;
  final Value<String> servingSizeInGrams;
  final Value<String> calories;
  final Value<String> protein;
  final Value<String> carbs;
  final Value<String> fats;
  final Value<int> rowid;
  const IngredientsCompanion({
    this.code = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.category = const Value.absent(),
    this.servingSizeInGrams = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fats = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientsCompanion.insert({
    required String code,
    required String nameAr,
    required String nameEn,
    required String category,
    required String servingSizeInGrams,
    required String calories,
    required String protein,
    required String carbs,
    required String fats,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       nameAr = Value(nameAr),
       nameEn = Value(nameEn),
       category = Value(category),
       servingSizeInGrams = Value(servingSizeInGrams),
       calories = Value(calories),
       protein = Value(protein),
       carbs = Value(carbs),
       fats = Value(fats);
  static Insertable<IngredientData> custom({
    Expression<String>? code,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? category,
    Expression<String>? servingSizeInGrams,
    Expression<String>? calories,
    Expression<String>? protein,
    Expression<String>? carbs,
    Expression<String>? fats,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (category != null) 'category': category,
      if (servingSizeInGrams != null)
        'serving_size_in_grams': servingSizeInGrams,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fats != null) 'fats': fats,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientsCompanion copyWith({
    Value<String>? code,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<String>? category,
    Value<String>? servingSizeInGrams,
    Value<String>? calories,
    Value<String>? protein,
    Value<String>? carbs,
    Value<String>? fats,
    Value<int>? rowid,
  }) {
    return IngredientsCompanion(
      code: code ?? this.code,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      category: category ?? this.category,
      servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fats: fats ?? this.fats,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (servingSizeInGrams.present) {
      map['serving_size_in_grams'] = Variable<String>(servingSizeInGrams.value);
    }
    if (calories.present) {
      map['calories'] = Variable<String>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<String>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<String>(carbs.value);
    }
    if (fats.present) {
      map['fats'] = Variable<String>(fats.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('code: $code, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category, ')
          ..write('servingSizeInGrams: $servingSizeInGrams, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fats: $fats, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DietPlansTable extends DietPlans
    with TableInfo<$DietPlansTable, DietPlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DietPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCurrentMeta = const VerificationMeta(
    'isCurrent',
  );
  @override
  late final GeneratedColumn<bool> isCurrent = GeneratedColumn<bool>(
    'is_current',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_current" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    isCurrent,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diet_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<DietPlanData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_current')) {
      context.handle(
        _isCurrentMeta,
        isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DietPlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DietPlanData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
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
        DriftSqlType.bool,
        data['${effectivePrefix}is_current'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DietPlansTable createAlias(String alias) {
    return $DietPlansTable(attachedDatabase, alias);
  }
}

class DietPlanData extends DataClass implements Insertable<DietPlanData> {
  final int id;
  final String name;
  final String? description;
  final bool isCurrent;
  final DateTime createdAt;
  const DietPlanData({
    required this.id,
    required this.name,
    this.description,
    required this.isCurrent,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_current'] = Variable<bool>(isCurrent);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DietPlansCompanion toCompanion(bool nullToAbsent) {
    return DietPlansCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCurrent: Value(isCurrent),
      createdAt: Value(createdAt),
    );
  }

  factory DietPlanData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DietPlanData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isCurrent': serializer.toJson<bool>(isCurrent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DietPlanData copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isCurrent,
    DateTime? createdAt,
  }) => DietPlanData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isCurrent: isCurrent ?? this.isCurrent,
    createdAt: createdAt ?? this.createdAt,
  );
  DietPlanData copyWithCompanion(DietPlansCompanion data) {
    return DietPlanData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DietPlanData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, isCurrent, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DietPlanData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isCurrent == this.isCurrent &&
          other.createdAt == this.createdAt);
}

class DietPlansCompanion extends UpdateCompanion<DietPlanData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isCurrent;
  final Value<DateTime> createdAt;
  const DietPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DietPlansCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<DietPlanData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isCurrent,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isCurrent != null) 'is_current': isCurrent,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DietPlansCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isCurrent,
    Value<DateTime>? createdAt,
  }) {
    return DietPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DietDaysTable extends DietDays
    with TableInfo<$DietDaysTable, DietDayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DietDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dietPlanIdMeta = const VerificationMeta(
    'dietPlanId',
  );
  @override
  late final GeneratedColumn<int> dietPlanId = GeneratedColumn<int>(
    'diet_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diet_plans (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, index, dietPlanId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diet_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<DietDayData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('diet_plan_id')) {
      context.handle(
        _dietPlanIdMeta,
        dietPlanId.isAcceptableOrUnknown(
          data['diet_plan_id']!,
          _dietPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dietPlanIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DietDayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DietDayData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      dietPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diet_plan_id'],
      )!,
    );
  }

  @override
  $DietDaysTable createAlias(String alias) {
    return $DietDaysTable(attachedDatabase, alias);
  }
}

class DietDayData extends DataClass implements Insertable<DietDayData> {
  final int id;
  final String name;
  final int index;
  final int dietPlanId;
  const DietDayData({
    required this.id,
    required this.name,
    required this.index,
    required this.dietPlanId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['index'] = Variable<int>(index);
    map['diet_plan_id'] = Variable<int>(dietPlanId);
    return map;
  }

  DietDaysCompanion toCompanion(bool nullToAbsent) {
    return DietDaysCompanion(
      id: Value(id),
      name: Value(name),
      index: Value(index),
      dietPlanId: Value(dietPlanId),
    );
  }

  factory DietDayData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DietDayData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      index: serializer.fromJson<int>(json['index']),
      dietPlanId: serializer.fromJson<int>(json['dietPlanId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'index': serializer.toJson<int>(index),
      'dietPlanId': serializer.toJson<int>(dietPlanId),
    };
  }

  DietDayData copyWith({int? id, String? name, int? index, int? dietPlanId}) =>
      DietDayData(
        id: id ?? this.id,
        name: name ?? this.name,
        index: index ?? this.index,
        dietPlanId: dietPlanId ?? this.dietPlanId,
      );
  DietDayData copyWithCompanion(DietDaysCompanion data) {
    return DietDayData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      index: data.index.present ? data.index.value : this.index,
      dietPlanId: data.dietPlanId.present
          ? data.dietPlanId.value
          : this.dietPlanId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DietDayData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('index: $index, ')
          ..write('dietPlanId: $dietPlanId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, index, dietPlanId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DietDayData &&
          other.id == this.id &&
          other.name == this.name &&
          other.index == this.index &&
          other.dietPlanId == this.dietPlanId);
}

class DietDaysCompanion extends UpdateCompanion<DietDayData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> index;
  final Value<int> dietPlanId;
  const DietDaysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.index = const Value.absent(),
    this.dietPlanId = const Value.absent(),
  });
  DietDaysCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int index,
    required int dietPlanId,
  }) : name = Value(name),
       index = Value(index),
       dietPlanId = Value(dietPlanId);
  static Insertable<DietDayData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? index,
    Expression<int>? dietPlanId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (index != null) 'index': index,
      if (dietPlanId != null) 'diet_plan_id': dietPlanId,
    });
  }

  DietDaysCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? index,
    Value<int>? dietPlanId,
  }) {
    return DietDaysCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      index: index ?? this.index,
      dietPlanId: dietPlanId ?? this.dietPlanId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (dietPlanId.present) {
      map['diet_plan_id'] = Variable<int>(dietPlanId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietDaysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('index: $index, ')
          ..write('dietPlanId: $dietPlanId')
          ..write(')'))
        .toString();
  }
}

class $DietMealsTable extends DietMeals
    with TableInfo<$DietMealsTable, DietMealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DietMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dietDayIdMeta = const VerificationMeta(
    'dietDayId',
  );
  @override
  late final GeneratedColumn<int> dietDayId = GeneratedColumn<int>(
    'diet_day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diet_days (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, index, dietDayId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diet_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<DietMealData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('diet_day_id')) {
      context.handle(
        _dietDayIdMeta,
        dietDayId.isAcceptableOrUnknown(data['diet_day_id']!, _dietDayIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dietDayIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DietMealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DietMealData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      dietDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diet_day_id'],
      )!,
    );
  }

  @override
  $DietMealsTable createAlias(String alias) {
    return $DietMealsTable(attachedDatabase, alias);
  }
}

class DietMealData extends DataClass implements Insertable<DietMealData> {
  final int id;
  final String name;
  final int index;
  final int dietDayId;
  const DietMealData({
    required this.id,
    required this.name,
    required this.index,
    required this.dietDayId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['index'] = Variable<int>(index);
    map['diet_day_id'] = Variable<int>(dietDayId);
    return map;
  }

  DietMealsCompanion toCompanion(bool nullToAbsent) {
    return DietMealsCompanion(
      id: Value(id),
      name: Value(name),
      index: Value(index),
      dietDayId: Value(dietDayId),
    );
  }

  factory DietMealData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DietMealData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      index: serializer.fromJson<int>(json['index']),
      dietDayId: serializer.fromJson<int>(json['dietDayId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'index': serializer.toJson<int>(index),
      'dietDayId': serializer.toJson<int>(dietDayId),
    };
  }

  DietMealData copyWith({int? id, String? name, int? index, int? dietDayId}) =>
      DietMealData(
        id: id ?? this.id,
        name: name ?? this.name,
        index: index ?? this.index,
        dietDayId: dietDayId ?? this.dietDayId,
      );
  DietMealData copyWithCompanion(DietMealsCompanion data) {
    return DietMealData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      index: data.index.present ? data.index.value : this.index,
      dietDayId: data.dietDayId.present ? data.dietDayId.value : this.dietDayId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DietMealData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('index: $index, ')
          ..write('dietDayId: $dietDayId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, index, dietDayId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DietMealData &&
          other.id == this.id &&
          other.name == this.name &&
          other.index == this.index &&
          other.dietDayId == this.dietDayId);
}

class DietMealsCompanion extends UpdateCompanion<DietMealData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> index;
  final Value<int> dietDayId;
  const DietMealsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.index = const Value.absent(),
    this.dietDayId = const Value.absent(),
  });
  DietMealsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int index,
    required int dietDayId,
  }) : name = Value(name),
       index = Value(index),
       dietDayId = Value(dietDayId);
  static Insertable<DietMealData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? index,
    Expression<int>? dietDayId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (index != null) 'index': index,
      if (dietDayId != null) 'diet_day_id': dietDayId,
    });
  }

  DietMealsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? index,
    Value<int>? dietDayId,
  }) {
    return DietMealsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      index: index ?? this.index,
      dietDayId: dietDayId ?? this.dietDayId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (dietDayId.present) {
      map['diet_day_id'] = Variable<int>(dietDayId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietMealsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('index: $index, ')
          ..write('dietDayId: $dietDayId')
          ..write(')'))
        .toString();
  }
}

class $DietMealIngredientsTable extends DietMealIngredients
    with TableInfo<$DietMealIngredientsTable, DietMealIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DietMealIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  @override
  late final GeneratedColumn<String> nameAr = GeneratedColumn<String>(
    'name_ar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servingSizeInGramsMeta =
      const VerificationMeta('servingSizeInGrams');
  @override
  late final GeneratedColumn<double> servingSizeInGrams =
      GeneratedColumn<double>(
        'serving_size_in_grams',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatsMeta = const VerificationMeta('fats');
  @override
  late final GeneratedColumn<double> fats = GeneratedColumn<double>(
    'fats',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dietMealIdMeta = const VerificationMeta(
    'dietMealId',
  );
  @override
  late final GeneratedColumn<int> dietMealId = GeneratedColumn<int>(
    'diet_meal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES diet_meals (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    amount,
    index,
    code,
    nameAr,
    nameEn,
    category,
    servingSizeInGrams,
    calories,
    protein,
    carbs,
    fats,
    dietMealId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diet_meal_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<DietMealIngredientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(
        _nameArMeta,
        nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('serving_size_in_grams')) {
      context.handle(
        _servingSizeInGramsMeta,
        servingSizeInGrams.isAcceptableOrUnknown(
          data['serving_size_in_grams']!,
          _servingSizeInGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingSizeInGramsMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    if (data.containsKey('fats')) {
      context.handle(
        _fatsMeta,
        fats.isAcceptableOrUnknown(data['fats']!, _fatsMeta),
      );
    } else if (isInserting) {
      context.missing(_fatsMeta);
    }
    if (data.containsKey('diet_meal_id')) {
      context.handle(
        _dietMealIdMeta,
        dietMealId.isAcceptableOrUnknown(
          data['diet_meal_id']!,
          _dietMealIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dietMealIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DietMealIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DietMealIngredientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      nameAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ar'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      servingSizeInGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}serving_size_in_grams'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
      fats: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fats'],
      )!,
      dietMealId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diet_meal_id'],
      )!,
    );
  }

  @override
  $DietMealIngredientsTable createAlias(String alias) {
    return $DietMealIngredientsTable(attachedDatabase, alias);
  }
}

class DietMealIngredientData extends DataClass
    implements Insertable<DietMealIngredientData> {
  final int id;
  final double amount;
  final int index;
  final String code;
  final String nameAr;
  final String nameEn;
  final String category;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final int dietMealId;
  const DietMealIngredientData({
    required this.id,
    required this.amount,
    required this.index,
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.dietMealId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['index'] = Variable<int>(index);
    map['code'] = Variable<String>(code);
    map['name_ar'] = Variable<String>(nameAr);
    map['name_en'] = Variable<String>(nameEn);
    map['category'] = Variable<String>(category);
    map['serving_size_in_grams'] = Variable<double>(servingSizeInGrams);
    map['calories'] = Variable<double>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbs'] = Variable<double>(carbs);
    map['fats'] = Variable<double>(fats);
    map['diet_meal_id'] = Variable<int>(dietMealId);
    return map;
  }

  DietMealIngredientsCompanion toCompanion(bool nullToAbsent) {
    return DietMealIngredientsCompanion(
      id: Value(id),
      amount: Value(amount),
      index: Value(index),
      code: Value(code),
      nameAr: Value(nameAr),
      nameEn: Value(nameEn),
      category: Value(category),
      servingSizeInGrams: Value(servingSizeInGrams),
      calories: Value(calories),
      protein: Value(protein),
      carbs: Value(carbs),
      fats: Value(fats),
      dietMealId: Value(dietMealId),
    );
  }

  factory DietMealIngredientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DietMealIngredientData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      index: serializer.fromJson<int>(json['index']),
      code: serializer.fromJson<String>(json['code']),
      nameAr: serializer.fromJson<String>(json['nameAr']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      category: serializer.fromJson<String>(json['category']),
      servingSizeInGrams: serializer.fromJson<double>(
        json['servingSizeInGrams'],
      ),
      calories: serializer.fromJson<double>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbs: serializer.fromJson<double>(json['carbs']),
      fats: serializer.fromJson<double>(json['fats']),
      dietMealId: serializer.fromJson<int>(json['dietMealId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'index': serializer.toJson<int>(index),
      'code': serializer.toJson<String>(code),
      'nameAr': serializer.toJson<String>(nameAr),
      'nameEn': serializer.toJson<String>(nameEn),
      'category': serializer.toJson<String>(category),
      'servingSizeInGrams': serializer.toJson<double>(servingSizeInGrams),
      'calories': serializer.toJson<double>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbs': serializer.toJson<double>(carbs),
      'fats': serializer.toJson<double>(fats),
      'dietMealId': serializer.toJson<int>(dietMealId),
    };
  }

  DietMealIngredientData copyWith({
    int? id,
    double? amount,
    int? index,
    String? code,
    String? nameAr,
    String? nameEn,
    String? category,
    double? servingSizeInGrams,
    double? calories,
    double? protein,
    double? carbs,
    double? fats,
    int? dietMealId,
  }) => DietMealIngredientData(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    index: index ?? this.index,
    code: code ?? this.code,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    category: category ?? this.category,
    servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbs: carbs ?? this.carbs,
    fats: fats ?? this.fats,
    dietMealId: dietMealId ?? this.dietMealId,
  );
  DietMealIngredientData copyWithCompanion(DietMealIngredientsCompanion data) {
    return DietMealIngredientData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      index: data.index.present ? data.index.value : this.index,
      code: data.code.present ? data.code.value : this.code,
      nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      category: data.category.present ? data.category.value : this.category,
      servingSizeInGrams: data.servingSizeInGrams.present
          ? data.servingSizeInGrams.value
          : this.servingSizeInGrams,
      calories: data.calories.present ? data.calories.value : this.calories,
      protein: data.protein.present ? data.protein.value : this.protein,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      fats: data.fats.present ? data.fats.value : this.fats,
      dietMealId: data.dietMealId.present
          ? data.dietMealId.value
          : this.dietMealId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DietMealIngredientData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('index: $index, ')
          ..write('code: $code, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category, ')
          ..write('servingSizeInGrams: $servingSizeInGrams, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fats: $fats, ')
          ..write('dietMealId: $dietMealId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    amount,
    index,
    code,
    nameAr,
    nameEn,
    category,
    servingSizeInGrams,
    calories,
    protein,
    carbs,
    fats,
    dietMealId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DietMealIngredientData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.index == this.index &&
          other.code == this.code &&
          other.nameAr == this.nameAr &&
          other.nameEn == this.nameEn &&
          other.category == this.category &&
          other.servingSizeInGrams == this.servingSizeInGrams &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbs == this.carbs &&
          other.fats == this.fats &&
          other.dietMealId == this.dietMealId);
}

class DietMealIngredientsCompanion
    extends UpdateCompanion<DietMealIngredientData> {
  final Value<int> id;
  final Value<double> amount;
  final Value<int> index;
  final Value<String> code;
  final Value<String> nameAr;
  final Value<String> nameEn;
  final Value<String> category;
  final Value<double> servingSizeInGrams;
  final Value<double> calories;
  final Value<double> protein;
  final Value<double> carbs;
  final Value<double> fats;
  final Value<int> dietMealId;
  const DietMealIngredientsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.index = const Value.absent(),
    this.code = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.category = const Value.absent(),
    this.servingSizeInGrams = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbs = const Value.absent(),
    this.fats = const Value.absent(),
    this.dietMealId = const Value.absent(),
  });
  DietMealIngredientsCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required int index,
    required String code,
    required String nameAr,
    required String nameEn,
    required String category,
    required double servingSizeInGrams,
    required double calories,
    required double protein,
    required double carbs,
    required double fats,
    required int dietMealId,
  }) : amount = Value(amount),
       index = Value(index),
       code = Value(code),
       nameAr = Value(nameAr),
       nameEn = Value(nameEn),
       category = Value(category),
       servingSizeInGrams = Value(servingSizeInGrams),
       calories = Value(calories),
       protein = Value(protein),
       carbs = Value(carbs),
       fats = Value(fats),
       dietMealId = Value(dietMealId);
  static Insertable<DietMealIngredientData> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<int>? index,
    Expression<String>? code,
    Expression<String>? nameAr,
    Expression<String>? nameEn,
    Expression<String>? category,
    Expression<double>? servingSizeInGrams,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? carbs,
    Expression<double>? fats,
    Expression<int>? dietMealId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (index != null) 'index': index,
      if (code != null) 'code': code,
      if (nameAr != null) 'name_ar': nameAr,
      if (nameEn != null) 'name_en': nameEn,
      if (category != null) 'category': category,
      if (servingSizeInGrams != null)
        'serving_size_in_grams': servingSizeInGrams,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbs != null) 'carbs': carbs,
      if (fats != null) 'fats': fats,
      if (dietMealId != null) 'diet_meal_id': dietMealId,
    });
  }

  DietMealIngredientsCompanion copyWith({
    Value<int>? id,
    Value<double>? amount,
    Value<int>? index,
    Value<String>? code,
    Value<String>? nameAr,
    Value<String>? nameEn,
    Value<String>? category,
    Value<double>? servingSizeInGrams,
    Value<double>? calories,
    Value<double>? protein,
    Value<double>? carbs,
    Value<double>? fats,
    Value<int>? dietMealId,
  }) {
    return DietMealIngredientsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      index: index ?? this.index,
      code: code ?? this.code,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      category: category ?? this.category,
      servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fats: fats ?? this.fats,
      dietMealId: dietMealId ?? this.dietMealId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (servingSizeInGrams.present) {
      map['serving_size_in_grams'] = Variable<double>(servingSizeInGrams.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (fats.present) {
      map['fats'] = Variable<double>(fats.value);
    }
    if (dietMealId.present) {
      map['diet_meal_id'] = Variable<int>(dietMealId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietMealIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('index: $index, ')
          ..write('code: $code, ')
          ..write('nameAr: $nameAr, ')
          ..write('nameEn: $nameEn, ')
          ..write('category: $category, ')
          ..write('servingSizeInGrams: $servingSizeInGrams, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbs: $carbs, ')
          ..write('fats: $fats, ')
          ..write('dietMealId: $dietMealId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $DaysGroupTable daysGroup = $DaysGroupTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $RoutineItemsTable routineItems = $RoutineItemsTable(this);
  late final $RoutineSetsTable routineSets = $RoutineSetsTable(this);
  late final $TSessionsTable tSessions = $TSessionsTable(this);
  late final $TLogsTable tLogs = $TLogsTable(this);
  late final $MeasurementsTable measurements = $MeasurementsTable(this);
  late final $IngredientsTable ingredients = $IngredientsTable(this);
  late final $DietPlansTable dietPlans = $DietPlansTable(this);
  late final $DietDaysTable dietDays = $DietDaysTable(this);
  late final $DietMealsTable dietMeals = $DietMealsTable(this);
  late final $DietMealIngredientsTable dietMealIngredients =
      $DietMealIngredientsTable(this);
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
    ingredients,
    dietPlans,
    dietDays,
    dietMeals,
    dietMealIngredients,
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
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diet_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diet_days', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diet_days',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diet_meals', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'diet_meals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diet_meal_ingredients', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      required String uid,
      required String email,
      required AccountType type,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<String> uid,
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
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountType, AccountType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function()
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<AccountType> type = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                uid: uid,
                email: email,
                type: type,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String email,
                required AccountType type,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                uid: uid,
                email: email,
                type: type,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function()
    >;
typedef $$RoutinesTableCreateCompanionBuilder =
    RoutinesCompanion Function({
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
typedef $$RoutinesTableUpdateCompanionBuilder =
    RoutinesCompanion Function({
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
  _daysGroupRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.daysGroup,
    aliasName: $_aliasNameGenerator(db.routines.id, db.daysGroup.routineId),
  );

  $$DaysGroupTableProcessedTableManager get daysGroupRefs {
    final manager = $$DaysGroupTableTableManager(
      $_db,
      $_db.daysGroup,
    ).filter((f) => f.routineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_daysGroupRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> daysGroupRefs(
    Expression<bool> Function($$DaysGroupTableFilterComposer f) f,
  ) {
    final $$DaysGroupTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.daysGroup,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DaysGroupTableFilterComposer(
            $db: $db,
            $table: $db.daysGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
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
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> daysGroupRefs<T extends Object>(
    Expression<T> Function($$DaysGroupTableAnnotationComposer a) f,
  ) {
    final $$DaysGroupTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.daysGroup,
      getReferencedColumn: (t) => t.routineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DaysGroupTableAnnotationComposer(
            $db: $db,
            $table: $db.daysGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutinesTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool daysGroupRefs})
        > {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RoutinesCompanion(
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
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RoutinesCompanion.insert(
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({daysGroupRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (daysGroupRefs) db.daysGroup],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (daysGroupRefs)
                    await $_getPrefetchedData<
                      Routine,
                      $RoutinesTable,
                      DaysGroupData
                    >(
                      currentTable: table,
                      referencedTable: $$RoutinesTableReferences
                          ._daysGroupRefsTable(db),
                      managerFromTypedResult: (p0) => $$RoutinesTableReferences(
                        db,
                        table,
                        p0,
                      ).daysGroupRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.routineId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoutinesTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool daysGroupRefs})
    >;
typedef $$DaysGroupTableCreateCompanionBuilder =
    DaysGroupCompanion Function({
      Value<int> id,
      Value<int?> apiId,
      required int index,
      Value<int> version,
      required String dayName,
      Value<bool> isSynced,
      required int routineId,
    });
typedef $$DaysGroupTableUpdateCompanionBuilder =
    DaysGroupCompanion Function({
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
        $_aliasNameGenerator(db.daysGroup.routineId, db.routines.id),
      );

  $$RoutinesTableProcessedTableManager get routineId {
    final $_column = $_itemColumn<int>('routine_id')!;

    final manager = $$RoutinesTableTableManager(
      $_db,
      $_db.routines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RoutineItemsTable, List<RoutineItem>>
  _routineItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routineItems,
    aliasName: $_aliasNameGenerator(db.daysGroup.id, db.routineItems.dayId),
  );

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager(
      $_db,
      $_db.routineItems,
    ).filter((f) => f.dayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_routineItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayName => $composableBuilder(
    column: $table.dayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutinesTableFilterComposer get routineId {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableFilterComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> routineItemsRefs(
    Expression<bool> Function($$RoutineItemsTableFilterComposer f) f,
  ) {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.dayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableFilterComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayName => $composableBuilder(
    column: $table.dayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinesTableOrderingComposer get routineId {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineId,
      referencedTable: $db.routines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableOrderingComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinesTableAnnotationComposer(
            $db: $db,
            $table: $db.routines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> routineItemsRefs<T extends Object>(
    Expression<T> Function($$RoutineItemsTableAnnotationComposer a) f,
  ) {
    final $$RoutineItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.dayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DaysGroupTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool routineId, bool routineItemsRefs})
        > {
  $$DaysGroupTableTableManager(_$AppDatabase db, $DaysGroupTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DaysGroupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DaysGroupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DaysGroupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> dayName = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> routineId = const Value.absent(),
              }) => DaysGroupCompanion(
                id: id,
                apiId: apiId,
                index: index,
                version: version,
                dayName: dayName,
                isSynced: isSynced,
                routineId: routineId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                required int index,
                Value<int> version = const Value.absent(),
                required String dayName,
                Value<bool> isSynced = const Value.absent(),
                required int routineId,
              }) => DaysGroupCompanion.insert(
                id: id,
                apiId: apiId,
                index: index,
                version: version,
                dayName: dayName,
                isSynced: isSynced,
                routineId: routineId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DaysGroupTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({routineId = false, routineItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (routineItemsRefs) db.routineItems,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (routineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.routineId,
                                    referencedTable: $$DaysGroupTableReferences
                                        ._routineIdTable(db),
                                    referencedColumn: $$DaysGroupTableReferences
                                        ._routineIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (routineItemsRefs)
                        await $_getPrefetchedData<
                          DaysGroupData,
                          $DaysGroupTable,
                          RoutineItem
                        >(
                          currentTable: table,
                          referencedTable: $$DaysGroupTableReferences
                              ._routineItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DaysGroupTableReferences(
                                db,
                                table,
                                p0,
                              ).routineItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DaysGroupTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool routineId, bool routineItemsRefs})
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      required String apiId,
      required String name,
      Value<String?> imageName,
      required String muscleGroupCode,
      required String muscleGroupName,
      required String muscleHeadCode,
      required String muscleHeadName,
      required String laterals,
      required String toolCode,
      required String toolName,
      Value<String?> auxMuscle1,
      Value<String?> auxMuscle2,
      Value<String?> auxMuscle3,
      Value<String?> description,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<String> apiId,
      Value<String> name,
      Value<String?> imageName,
      Value<String> muscleGroupCode,
      Value<String> muscleGroupName,
      Value<String> muscleHeadCode,
      Value<String> muscleHeadName,
      Value<String> laterals,
      Value<String> toolCode,
      Value<String> toolName,
      Value<String?> auxMuscle1,
      Value<String?> auxMuscle2,
      Value<String?> auxMuscle3,
      Value<String?> description,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoutineItemsTable, List<RoutineItem>>
  _routineItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routineItems,
    aliasName: $_aliasNameGenerator(
      db.exercises.apiId,
      db.routineItems.exerciseId,
    ),
  );

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter(
          (f) => f.exerciseId.apiId.sqlEquals($_itemColumn<String>('api_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_routineItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
  ColumnFilters<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get muscleGroupCode => $composableBuilder(
    column: $table.muscleGroupCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get muscleGroupName => $composableBuilder(
    column: $table.muscleGroupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get muscleHeadCode => $composableBuilder(
    column: $table.muscleHeadCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get muscleHeadName => $composableBuilder(
    column: $table.muscleHeadName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get laterals => $composableBuilder(
    column: $table.laterals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toolCode => $composableBuilder(
    column: $table.toolCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toolName => $composableBuilder(
    column: $table.toolName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get auxMuscle1 => $composableBuilder(
    column: $table.auxMuscle1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get auxMuscle2 => $composableBuilder(
    column: $table.auxMuscle2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get auxMuscle3 => $composableBuilder(
    column: $table.auxMuscle3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> routineItemsRefs(
    Expression<bool> Function($$RoutineItemsTableFilterComposer f) f,
  ) {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiId,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableFilterComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
  ColumnOrderings<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get muscleGroupCode => $composableBuilder(
    column: $table.muscleGroupCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get muscleGroupName => $composableBuilder(
    column: $table.muscleGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get muscleHeadCode => $composableBuilder(
    column: $table.muscleHeadCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get muscleHeadName => $composableBuilder(
    column: $table.muscleHeadName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get laterals => $composableBuilder(
    column: $table.laterals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toolCode => $composableBuilder(
    column: $table.toolCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toolName => $composableBuilder(
    column: $table.toolName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get auxMuscle1 => $composableBuilder(
    column: $table.auxMuscle1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get auxMuscle2 => $composableBuilder(
    column: $table.auxMuscle2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get auxMuscle3 => $composableBuilder(
    column: $table.auxMuscle3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageName =>
      $composableBuilder(column: $table.imageName, builder: (column) => column);

  GeneratedColumn<String> get muscleGroupCode => $composableBuilder(
    column: $table.muscleGroupCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get muscleGroupName => $composableBuilder(
    column: $table.muscleGroupName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get muscleHeadCode => $composableBuilder(
    column: $table.muscleHeadCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get muscleHeadName => $composableBuilder(
    column: $table.muscleHeadName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get laterals =>
      $composableBuilder(column: $table.laterals, builder: (column) => column);

  GeneratedColumn<String> get toolCode =>
      $composableBuilder(column: $table.toolCode, builder: (column) => column);

  GeneratedColumn<String> get toolName =>
      $composableBuilder(column: $table.toolName, builder: (column) => column);

  GeneratedColumn<String> get auxMuscle1 => $composableBuilder(
    column: $table.auxMuscle1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get auxMuscle2 => $composableBuilder(
    column: $table.auxMuscle2,
    builder: (column) => column,
  );

  GeneratedColumn<String> get auxMuscle3 => $composableBuilder(
    column: $table.auxMuscle3,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  Expression<T> routineItemsRefs<T extends Object>(
    Expression<T> Function($$RoutineItemsTableAnnotationComposer a) f,
  ) {
    final $$RoutineItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.apiId,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool routineItemsRefs})
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> apiId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<String> muscleGroupCode = const Value.absent(),
                Value<String> muscleGroupName = const Value.absent(),
                Value<String> muscleHeadCode = const Value.absent(),
                Value<String> muscleHeadName = const Value.absent(),
                Value<String> laterals = const Value.absent(),
                Value<String> toolCode = const Value.absent(),
                Value<String> toolName = const Value.absent(),
                Value<String?> auxMuscle1 = const Value.absent(),
                Value<String?> auxMuscle2 = const Value.absent(),
                Value<String?> auxMuscle3 = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(
                apiId: apiId,
                name: name,
                imageName: imageName,
                muscleGroupCode: muscleGroupCode,
                muscleGroupName: muscleGroupName,
                muscleHeadCode: muscleHeadCode,
                muscleHeadName: muscleHeadName,
                laterals: laterals,
                toolCode: toolCode,
                toolName: toolName,
                auxMuscle1: auxMuscle1,
                auxMuscle2: auxMuscle2,
                auxMuscle3: auxMuscle3,
                description: description,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String apiId,
                required String name,
                Value<String?> imageName = const Value.absent(),
                required String muscleGroupCode,
                required String muscleGroupName,
                required String muscleHeadCode,
                required String muscleHeadName,
                required String laterals,
                required String toolCode,
                required String toolName,
                Value<String?> auxMuscle1 = const Value.absent(),
                Value<String?> auxMuscle2 = const Value.absent(),
                Value<String?> auxMuscle3 = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(
                apiId: apiId,
                name: name,
                imageName: imageName,
                muscleGroupCode: muscleGroupCode,
                muscleGroupName: muscleGroupName,
                muscleHeadCode: muscleHeadCode,
                muscleHeadName: muscleHeadName,
                laterals: laterals,
                toolCode: toolCode,
                toolName: toolName,
                auxMuscle1: auxMuscle1,
                auxMuscle2: auxMuscle2,
                auxMuscle3: auxMuscle3,
                description: description,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routineItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (routineItemsRefs) db.routineItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (routineItemsRefs)
                    await $_getPrefetchedData<
                      Exercise,
                      $ExercisesTable,
                      RoutineItem
                    >(
                      currentTable: table,
                      referencedTable: $$ExercisesTableReferences
                          ._routineItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ExercisesTableReferences(
                            db,
                            table,
                            p0,
                          ).routineItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.exerciseId == item.apiId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool routineItemsRefs})
    >;
typedef $$RoutineItemsTableCreateCompanionBuilder =
    RoutineItemsCompanion Function({
      Value<int> id,
      Value<int?> apiId,
      required int index,
      Value<String?> notes,
      Value<int> version,
      Value<bool> isSynced,
      required String exerciseId,
      required int dayId,
    });
typedef $$RoutineItemsTableUpdateCompanionBuilder =
    RoutineItemsCompanion Function({
      Value<int> id,
      Value<int?> apiId,
      Value<int> index,
      Value<String?> notes,
      Value<int> version,
      Value<bool> isSynced,
      Value<String> exerciseId,
      Value<int> dayId,
    });

final class $$RoutineItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RoutineItemsTable, RoutineItem> {
  $$RoutineItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(db.routineItems.exerciseId, db.exercises.apiId),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.apiId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DaysGroupTable _dayIdTable(_$AppDatabase db) =>
      db.daysGroup.createAlias(
        $_aliasNameGenerator(db.routineItems.dayId, db.daysGroup.id),
      );

  $$DaysGroupTableProcessedTableManager get dayId {
    final $_column = $_itemColumn<int>('day_id')!;

    final manager = $$DaysGroupTableTableManager(
      $_db,
      $_db.daysGroup,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RoutineSetsTable, List<RoutineSet>>
  _routineSetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routineSets,
    aliasName: $_aliasNameGenerator(
      db.routineItems.id,
      db.routineSets.routineItemId,
    ),
  );

  $$RoutineSetsTableProcessedTableManager get routineSetsRefs {
    final manager = $$RoutineSetsTableTableManager(
      $_db,
      $_db.routineSets,
    ).filter((f) => f.routineItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_routineSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.apiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DaysGroupTableFilterComposer get dayId {
    final $$DaysGroupTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.daysGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DaysGroupTableFilterComposer(
            $db: $db,
            $table: $db.daysGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> routineSetsRefs(
    Expression<bool> Function($$RoutineSetsTableFilterComposer f) f,
  ) {
    final $$RoutineSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineSets,
      getReferencedColumn: (t) => t.routineItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineSetsTableFilterComposer(
            $db: $db,
            $table: $db.routineSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.apiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DaysGroupTableOrderingComposer get dayId {
    final $$DaysGroupTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.daysGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DaysGroupTableOrderingComposer(
            $db: $db,
            $table: $db.daysGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.apiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DaysGroupTableAnnotationComposer get dayId {
    final $$DaysGroupTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayId,
      referencedTable: $db.daysGroup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DaysGroupTableAnnotationComposer(
            $db: $db,
            $table: $db.daysGroup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> routineSetsRefs<T extends Object>(
    Expression<T> Function($$RoutineSetsTableAnnotationComposer a) f,
  ) {
    final $$RoutineSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routineSets,
      getReferencedColumn: (t) => t.routineItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.routineSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutineItemsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({
            bool exerciseId,
            bool dayId,
            bool routineSetsRefs,
          })
        > {
  $$RoutineItemsTableTableManager(_$AppDatabase db, $RoutineItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> dayId = const Value.absent(),
              }) => RoutineItemsCompanion(
                id: id,
                apiId: apiId,
                index: index,
                notes: notes,
                version: version,
                isSynced: isSynced,
                exerciseId: exerciseId,
                dayId: dayId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                required int index,
                Value<String?> notes = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required String exerciseId,
                required int dayId,
              }) => RoutineItemsCompanion.insert(
                id: id,
                apiId: apiId,
                index: index,
                notes: notes,
                version: version,
                isSynced: isSynced,
                exerciseId: exerciseId,
                dayId: dayId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutineItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({exerciseId = false, dayId = false, routineSetsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (routineSetsRefs) db.routineSets,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$RoutineItemsTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$RoutineItemsTableReferences
                                            ._exerciseIdTable(db)
                                            .apiId,
                                  )
                                  as T;
                        }
                        if (dayId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dayId,
                                    referencedTable:
                                        $$RoutineItemsTableReferences
                                            ._dayIdTable(db),
                                    referencedColumn:
                                        $$RoutineItemsTableReferences
                                            ._dayIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (routineSetsRefs)
                        await $_getPrefetchedData<
                          RoutineItem,
                          $RoutineItemsTable,
                          RoutineSet
                        >(
                          currentTable: table,
                          referencedTable: $$RoutineItemsTableReferences
                              ._routineSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutineItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).routineSetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.routineItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutineItemsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({
        bool exerciseId,
        bool dayId,
        bool routineSetsRefs,
      })
    >;
typedef $$RoutineSetsTableCreateCompanionBuilder =
    RoutineSetsCompanion Function({
      Value<int> id,
      Value<int?> apiId,
      required int roundIndex,
      required int repsCount,
      Value<int> version,
      Value<bool> isSynced,
      required int routineItemId,
    });
typedef $$RoutineSetsTableUpdateCompanionBuilder =
    RoutineSetsCompanion Function({
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
      db.routineItems.createAlias(
        $_aliasNameGenerator(db.routineSets.routineItemId, db.routineItems.id),
      );

  $$RoutineItemsTableProcessedTableManager get routineItemId {
    final $_column = $_itemColumn<int>('routine_item_id')!;

    final manager = $$RoutineItemsTableTableManager(
      $_db,
      $_db.routineItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routineItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roundIndex => $composableBuilder(
    column: $table.roundIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repsCount => $composableBuilder(
    column: $table.repsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutineItemsTableFilterComposer get routineItemId {
    final $$RoutineItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineItemId,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableFilterComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roundIndex => $composableBuilder(
    column: $table.roundIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repsCount => $composableBuilder(
    column: $table.repsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutineItemsTableOrderingComposer get routineItemId {
    final $$RoutineItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routineItemId,
      referencedTable: $db.routineItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableOrderingComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.roundIndex,
    builder: (column) => column,
  );

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
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutineItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.routineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutineSetsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool routineItemId})
        > {
  $$RoutineSetsTableTableManager(_$AppDatabase db, $RoutineSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutineSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutineSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutineSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> roundIndex = const Value.absent(),
                Value<int> repsCount = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> routineItemId = const Value.absent(),
              }) => RoutineSetsCompanion(
                id: id,
                apiId: apiId,
                roundIndex: roundIndex,
                repsCount: repsCount,
                version: version,
                isSynced: isSynced,
                routineItemId: routineItemId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                required int roundIndex,
                required int repsCount,
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required int routineItemId,
              }) => RoutineSetsCompanion.insert(
                id: id,
                apiId: apiId,
                roundIndex: roundIndex,
                repsCount: repsCount,
                version: version,
                isSynced: isSynced,
                routineItemId: routineItemId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutineSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routineItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (routineItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.routineItemId,
                                referencedTable: $$RoutineSetsTableReferences
                                    ._routineItemIdTable(db),
                                referencedColumn: $$RoutineSetsTableReferences
                                    ._routineItemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RoutineSetsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool routineItemId})
    >;
typedef $$TSessionsTableCreateCompanionBuilder =
    TSessionsCompanion Function({
      Value<int> tsId,
      required int dayId,
      required String dayName,
      required DateTime startedAt,
      Value<DateTime?> finishedAt,
      Value<double> progress,
      Value<int?> apiId,
      Value<int> version,
      Value<bool> isSynced,
    });
typedef $$TSessionsTableUpdateCompanionBuilder =
    TSessionsCompanion Function({
      Value<int> tsId,
      Value<int> dayId,
      Value<String> dayName,
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
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tLogs,
    aliasName: $_aliasNameGenerator(db.tSessions.tsId, db.tLogs.sessionId),
  );

  $$TLogsTableProcessedTableManager get tLogsRefs {
    final manager = $$TLogsTableTableManager(
      $_db,
      $_db.tLogs,
    ).filter((f) => f.sessionId.tsId.sqlEquals($_itemColumn<int>('ts_id')!));

    final cache = $_typedResult.readTableOrNull(_tLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.tsId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayId => $composableBuilder(
    column: $table.dayId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayName => $composableBuilder(
    column: $table.dayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tLogsRefs(
    Expression<bool> Function($$TLogsTableFilterComposer f) f,
  ) {
    final $$TLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tsId,
      referencedTable: $db.tLogs,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TLogsTableFilterComposer(
            $db: $db,
            $table: $db.tLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.tsId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayId => $composableBuilder(
    column: $table.dayId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayName => $composableBuilder(
    column: $table.dayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get dayName =>
      $composableBuilder(column: $table.dayName, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> tLogsRefs<T extends Object>(
    Expression<T> Function($$TLogsTableAnnotationComposer a) f,
  ) {
    final $$TLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tsId,
      referencedTable: $db.tLogs,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.tLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TSessionsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool tLogsRefs})
        > {
  $$TSessionsTableTableManager(_$AppDatabase db, $TSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> tsId = const Value.absent(),
                Value<int> dayId = const Value.absent(),
                Value<String> dayName = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => TSessionsCompanion(
                tsId: tsId,
                dayId: dayId,
                dayName: dayName,
                startedAt: startedAt,
                finishedAt: finishedAt,
                progress: progress,
                apiId: apiId,
                version: version,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> tsId = const Value.absent(),
                required int dayId,
                required String dayName,
                required DateTime startedAt,
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => TSessionsCompanion.insert(
                tsId: tsId,
                dayId: dayId,
                dayName: dayName,
                startedAt: startedAt,
                finishedAt: finishedAt,
                progress: progress,
                apiId: apiId,
                version: version,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tLogsRefs) db.tLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tLogsRefs)
                    await $_getPrefetchedData<TSession, $TSessionsTable, TLog>(
                      currentTable: table,
                      referencedTable: $$TSessionsTableReferences
                          ._tLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TSessionsTableReferences(db, table, p0).tLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sessionId == item.tsId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TSessionsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool tLogsRefs})
    >;
typedef $$TLogsTableCreateCompanionBuilder =
    TLogsCompanion Function({
      Value<int> logId,
      required String exerciseId,
      required int exerciseIndex,
      required int setIndex,
      required int reps,
      required int finishedReps,
      required double weight,
      required DateTime completedAt,
      Value<int?> apiId,
      Value<int> version,
      Value<bool> isSynced,
      required int sessionId,
    });
typedef $$TLogsTableUpdateCompanionBuilder =
    TLogsCompanion Function({
      Value<int> logId,
      Value<String> exerciseId,
      Value<int> exerciseIndex,
      Value<int> setIndex,
      Value<int> reps,
      Value<int> finishedReps,
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
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$TSessionsTableTableManager(
      $_db,
      $_db.tSessions,
    ).filter((f) => f.tsId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
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
    column: $table.logId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseIndex => $composableBuilder(
    column: $table.exerciseIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setIndex => $composableBuilder(
    column: $table.setIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finishedReps => $composableBuilder(
    column: $table.finishedReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$TSessionsTableFilterComposer get sessionId {
    final $$TSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.tSessions,
      getReferencedColumn: (t) => t.tsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TSessionsTableFilterComposer(
            $db: $db,
            $table: $db.tSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.logId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseIndex => $composableBuilder(
    column: $table.exerciseIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setIndex => $composableBuilder(
    column: $table.setIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finishedReps => $composableBuilder(
    column: $table.finishedReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$TSessionsTableOrderingComposer get sessionId {
    final $$TSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.tSessions,
      getReferencedColumn: (t) => t.tsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.tSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseIndex => $composableBuilder(
    column: $table.exerciseIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get setIndex =>
      $composableBuilder(column: $table.setIndex, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get finishedReps => $composableBuilder(
    column: $table.finishedReps,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

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
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.tSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TLogsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool sessionId})
        > {
  $$TLogsTableTableManager(_$AppDatabase db, $TLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> logId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> exerciseIndex = const Value.absent(),
                Value<int> setIndex = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int> finishedReps = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
              }) => TLogsCompanion(
                logId: logId,
                exerciseId: exerciseId,
                exerciseIndex: exerciseIndex,
                setIndex: setIndex,
                reps: reps,
                finishedReps: finishedReps,
                weight: weight,
                completedAt: completedAt,
                apiId: apiId,
                version: version,
                isSynced: isSynced,
                sessionId: sessionId,
              ),
          createCompanionCallback:
              ({
                Value<int> logId = const Value.absent(),
                required String exerciseId,
                required int exerciseIndex,
                required int setIndex,
                required int reps,
                required int finishedReps,
                required double weight,
                required DateTime completedAt,
                Value<int?> apiId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required int sessionId,
              }) => TLogsCompanion.insert(
                logId: logId,
                exerciseId: exerciseId,
                exerciseIndex: exerciseIndex,
                setIndex: setIndex,
                reps: reps,
                finishedReps: finishedReps,
                weight: weight,
                completedAt: completedAt,
                apiId: apiId,
                version: version,
                isSynced: isSynced,
                sessionId: sessionId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TLogsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable: $$TLogsTableReferences
                                    ._sessionIdTable(db),
                                referencedColumn: $$TLogsTableReferences
                                    ._sessionIdTable(db)
                                    .tsId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TLogsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool sessionId})
    >;
typedef $$MeasurementsTableCreateCompanionBuilder =
    MeasurementsCompanion Function({
      Value<int> id,
      Value<int?> apiId,
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
      Value<int> version,
      Value<bool> isSynced,
    });
typedef $$MeasurementsTableUpdateCompanionBuilder =
    MeasurementsCompanion Function({
      Value<int> id,
      Value<int?> apiId,
      Value<double> height,
      Value<double> weight,
      Value<double> lArm,
      Value<double> rArm,
      Value<double> lHumerus,
      Value<double> rHumerus,
      Value<double> lThigh,
      Value<double> rThigh,
      Value<double> lLeg,
      Value<double> rLeg,
      Value<double> neck,
      Value<double> shoulders,
      Value<double> waist,
      Value<double> chest,
      Value<double> hips,
      Value<DateTime> checkDate,
      Value<int> version,
      Value<bool> isSynced,
    });

class $$MeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lArm => $composableBuilder(
    column: $table.lArm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rArm => $composableBuilder(
    column: $table.rArm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lHumerus => $composableBuilder(
    column: $table.lHumerus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rHumerus => $composableBuilder(
    column: $table.rHumerus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lThigh => $composableBuilder(
    column: $table.lThigh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rThigh => $composableBuilder(
    column: $table.rThigh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lLeg => $composableBuilder(
    column: $table.lLeg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rLeg => $composableBuilder(
    column: $table.rLeg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get neck => $composableBuilder(
    column: $table.neck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get shoulders => $composableBuilder(
    column: $table.shoulders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hips => $composableBuilder(
    column: $table.hips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkDate => $composableBuilder(
    column: $table.checkDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lArm => $composableBuilder(
    column: $table.lArm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rArm => $composableBuilder(
    column: $table.rArm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lHumerus => $composableBuilder(
    column: $table.lHumerus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rHumerus => $composableBuilder(
    column: $table.rHumerus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lThigh => $composableBuilder(
    column: $table.lThigh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rThigh => $composableBuilder(
    column: $table.rThigh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lLeg => $composableBuilder(
    column: $table.lLeg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rLeg => $composableBuilder(
    column: $table.rLeg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get neck => $composableBuilder(
    column: $table.neck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get shoulders => $composableBuilder(
    column: $table.shoulders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hips => $composableBuilder(
    column: $table.hips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkDate => $composableBuilder(
    column: $table.checkDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableAnnotationComposer({
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

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get lArm =>
      $composableBuilder(column: $table.lArm, builder: (column) => column);

  GeneratedColumn<double> get rArm =>
      $composableBuilder(column: $table.rArm, builder: (column) => column);

  GeneratedColumn<double> get lHumerus =>
      $composableBuilder(column: $table.lHumerus, builder: (column) => column);

  GeneratedColumn<double> get rHumerus =>
      $composableBuilder(column: $table.rHumerus, builder: (column) => column);

  GeneratedColumn<double> get lThigh =>
      $composableBuilder(column: $table.lThigh, builder: (column) => column);

  GeneratedColumn<double> get rThigh =>
      $composableBuilder(column: $table.rThigh, builder: (column) => column);

  GeneratedColumn<double> get lLeg =>
      $composableBuilder(column: $table.lLeg, builder: (column) => column);

  GeneratedColumn<double> get rLeg =>
      $composableBuilder(column: $table.rLeg, builder: (column) => column);

  GeneratedColumn<double> get neck =>
      $composableBuilder(column: $table.neck, builder: (column) => column);

  GeneratedColumn<double> get shoulders =>
      $composableBuilder(column: $table.shoulders, builder: (column) => column);

  GeneratedColumn<double> get waist =>
      $composableBuilder(column: $table.waist, builder: (column) => column);

  GeneratedColumn<double> get chest =>
      $composableBuilder(column: $table.chest, builder: (column) => column);

  GeneratedColumn<double> get hips =>
      $composableBuilder(column: $table.hips, builder: (column) => column);

  GeneratedColumn<DateTime> get checkDate =>
      $composableBuilder(column: $table.checkDate, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$MeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeasurementsTable,
          Measurement,
          $$MeasurementsTableFilterComposer,
          $$MeasurementsTableOrderingComposer,
          $$MeasurementsTableAnnotationComposer,
          $$MeasurementsTableCreateCompanionBuilder,
          $$MeasurementsTableUpdateCompanionBuilder,
          (
            Measurement,
            BaseReferences<_$AppDatabase, $MeasurementsTable, Measurement>,
          ),
          Measurement,
          PrefetchHooks Function()
        > {
  $$MeasurementsTableTableManager(_$AppDatabase db, $MeasurementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
                Value<double> height = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<double> lArm = const Value.absent(),
                Value<double> rArm = const Value.absent(),
                Value<double> lHumerus = const Value.absent(),
                Value<double> rHumerus = const Value.absent(),
                Value<double> lThigh = const Value.absent(),
                Value<double> rThigh = const Value.absent(),
                Value<double> lLeg = const Value.absent(),
                Value<double> rLeg = const Value.absent(),
                Value<double> neck = const Value.absent(),
                Value<double> shoulders = const Value.absent(),
                Value<double> waist = const Value.absent(),
                Value<double> chest = const Value.absent(),
                Value<double> hips = const Value.absent(),
                Value<DateTime> checkDate = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => MeasurementsCompanion(
                id: id,
                apiId: apiId,
                height: height,
                weight: weight,
                lArm: lArm,
                rArm: rArm,
                lHumerus: lHumerus,
                rHumerus: rHumerus,
                lThigh: lThigh,
                rThigh: rThigh,
                lLeg: lLeg,
                rLeg: rLeg,
                neck: neck,
                shoulders: shoulders,
                waist: waist,
                chest: chest,
                hips: hips,
                checkDate: checkDate,
                version: version,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> apiId = const Value.absent(),
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
                Value<int> version = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => MeasurementsCompanion.insert(
                id: id,
                apiId: apiId,
                height: height,
                weight: weight,
                lArm: lArm,
                rArm: rArm,
                lHumerus: lHumerus,
                rHumerus: rHumerus,
                lThigh: lThigh,
                rThigh: rThigh,
                lLeg: lLeg,
                rLeg: rLeg,
                neck: neck,
                shoulders: shoulders,
                waist: waist,
                chest: chest,
                hips: hips,
                checkDate: checkDate,
                version: version,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeasurementsTable,
      Measurement,
      $$MeasurementsTableFilterComposer,
      $$MeasurementsTableOrderingComposer,
      $$MeasurementsTableAnnotationComposer,
      $$MeasurementsTableCreateCompanionBuilder,
      $$MeasurementsTableUpdateCompanionBuilder,
      (
        Measurement,
        BaseReferences<_$AppDatabase, $MeasurementsTable, Measurement>,
      ),
      Measurement,
      PrefetchHooks Function()
    >;
typedef $$IngredientsTableCreateCompanionBuilder =
    IngredientsCompanion Function({
      required String code,
      required String nameAr,
      required String nameEn,
      required String category,
      required String servingSizeInGrams,
      required String calories,
      required String protein,
      required String carbs,
      required String fats,
      Value<int> rowid,
    });
typedef $$IngredientsTableUpdateCompanionBuilder =
    IngredientsCompanion Function({
      Value<String> code,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<String> category,
      Value<String> servingSizeInGrams,
      Value<String> calories,
      Value<String> protein,
      Value<String> carbs,
      Value<String> fats,
      Value<int> rowid,
    });

class $$IngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fats => $composableBuilder(
    column: $table.fats,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fats => $composableBuilder(
    column: $table.fats,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => column,
  );

  GeneratedColumn<String> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<String> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<String> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<String> get fats =>
      $composableBuilder(column: $table.fats, builder: (column) => column);
}

class $$IngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientsTable,
          IngredientData,
          $$IngredientsTableFilterComposer,
          $$IngredientsTableOrderingComposer,
          $$IngredientsTableAnnotationComposer,
          $$IngredientsTableCreateCompanionBuilder,
          $$IngredientsTableUpdateCompanionBuilder,
          (
            IngredientData,
            BaseReferences<_$AppDatabase, $IngredientsTable, IngredientData>,
          ),
          IngredientData,
          PrefetchHooks Function()
        > {
  $$IngredientsTableTableManager(_$AppDatabase db, $IngredientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> servingSizeInGrams = const Value.absent(),
                Value<String> calories = const Value.absent(),
                Value<String> protein = const Value.absent(),
                Value<String> carbs = const Value.absent(),
                Value<String> fats = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientsCompanion(
                code: code,
                nameAr: nameAr,
                nameEn: nameEn,
                category: category,
                servingSizeInGrams: servingSizeInGrams,
                calories: calories,
                protein: protein,
                carbs: carbs,
                fats: fats,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String nameAr,
                required String nameEn,
                required String category,
                required String servingSizeInGrams,
                required String calories,
                required String protein,
                required String carbs,
                required String fats,
                Value<int> rowid = const Value.absent(),
              }) => IngredientsCompanion.insert(
                code: code,
                nameAr: nameAr,
                nameEn: nameEn,
                category: category,
                servingSizeInGrams: servingSizeInGrams,
                calories: calories,
                protein: protein,
                carbs: carbs,
                fats: fats,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientsTable,
      IngredientData,
      $$IngredientsTableFilterComposer,
      $$IngredientsTableOrderingComposer,
      $$IngredientsTableAnnotationComposer,
      $$IngredientsTableCreateCompanionBuilder,
      $$IngredientsTableUpdateCompanionBuilder,
      (
        IngredientData,
        BaseReferences<_$AppDatabase, $IngredientsTable, IngredientData>,
      ),
      IngredientData,
      PrefetchHooks Function()
    >;
typedef $$DietPlansTableCreateCompanionBuilder =
    DietPlansCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<bool> isCurrent,
      Value<DateTime> createdAt,
    });
typedef $$DietPlansTableUpdateCompanionBuilder =
    DietPlansCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<bool> isCurrent,
      Value<DateTime> createdAt,
    });

final class $$DietPlansTableReferences
    extends BaseReferences<_$AppDatabase, $DietPlansTable, DietPlanData> {
  $$DietPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DietDaysTable, List<DietDayData>>
  _dietDaysRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dietDays,
    aliasName: $_aliasNameGenerator(db.dietPlans.id, db.dietDays.dietPlanId),
  );

  $$DietDaysTableProcessedTableManager get dietDaysRefs {
    final manager = $$DietDaysTableTableManager(
      $_db,
      $_db.dietDays,
    ).filter((f) => f.dietPlanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dietDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DietPlansTableFilterComposer
    extends Composer<_$AppDatabase, $DietPlansTable> {
  $$DietPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dietDaysRefs(
    Expression<bool> Function($$DietDaysTableFilterComposer f) f,
  ) {
    final $$DietDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dietDays,
      getReferencedColumn: (t) => t.dietPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietDaysTableFilterComposer(
            $db: $db,
            $table: $db.dietDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DietPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $DietPlansTable> {
  $$DietPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCurrent => $composableBuilder(
    column: $table.isCurrent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DietPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $DietPlansTable> {
  $$DietPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCurrent =>
      $composableBuilder(column: $table.isCurrent, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> dietDaysRefs<T extends Object>(
    Expression<T> Function($$DietDaysTableAnnotationComposer a) f,
  ) {
    final $$DietDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dietDays,
      getReferencedColumn: (t) => t.dietPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.dietDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DietPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DietPlansTable,
          DietPlanData,
          $$DietPlansTableFilterComposer,
          $$DietPlansTableOrderingComposer,
          $$DietPlansTableAnnotationComposer,
          $$DietPlansTableCreateCompanionBuilder,
          $$DietPlansTableUpdateCompanionBuilder,
          (DietPlanData, $$DietPlansTableReferences),
          DietPlanData,
          PrefetchHooks Function({bool dietDaysRefs})
        > {
  $$DietPlansTableTableManager(_$AppDatabase db, $DietPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DietPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DietPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DietPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DietPlansCompanion(
                id: id,
                name: name,
                description: description,
                isCurrent: isCurrent,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isCurrent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DietPlansCompanion.insert(
                id: id,
                name: name,
                description: description,
                isCurrent: isCurrent,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DietPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dietDaysRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dietDaysRefs) db.dietDays],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dietDaysRefs)
                    await $_getPrefetchedData<
                      DietPlanData,
                      $DietPlansTable,
                      DietDayData
                    >(
                      currentTable: table,
                      referencedTable: $$DietPlansTableReferences
                          ._dietDaysRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DietPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).dietDaysRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.dietPlanId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DietPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DietPlansTable,
      DietPlanData,
      $$DietPlansTableFilterComposer,
      $$DietPlansTableOrderingComposer,
      $$DietPlansTableAnnotationComposer,
      $$DietPlansTableCreateCompanionBuilder,
      $$DietPlansTableUpdateCompanionBuilder,
      (DietPlanData, $$DietPlansTableReferences),
      DietPlanData,
      PrefetchHooks Function({bool dietDaysRefs})
    >;
typedef $$DietDaysTableCreateCompanionBuilder =
    DietDaysCompanion Function({
      Value<int> id,
      required String name,
      required int index,
      required int dietPlanId,
    });
typedef $$DietDaysTableUpdateCompanionBuilder =
    DietDaysCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> index,
      Value<int> dietPlanId,
    });

final class $$DietDaysTableReferences
    extends BaseReferences<_$AppDatabase, $DietDaysTable, DietDayData> {
  $$DietDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DietPlansTable _dietPlanIdTable(_$AppDatabase db) =>
      db.dietPlans.createAlias(
        $_aliasNameGenerator(db.dietDays.dietPlanId, db.dietPlans.id),
      );

  $$DietPlansTableProcessedTableManager get dietPlanId {
    final $_column = $_itemColumn<int>('diet_plan_id')!;

    final manager = $$DietPlansTableTableManager(
      $_db,
      $_db.dietPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dietPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DietMealsTable, List<DietMealData>>
  _dietMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dietMeals,
    aliasName: $_aliasNameGenerator(db.dietDays.id, db.dietMeals.dietDayId),
  );

  $$DietMealsTableProcessedTableManager get dietMealsRefs {
    final manager = $$DietMealsTableTableManager(
      $_db,
      $_db.dietMeals,
    ).filter((f) => f.dietDayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dietMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DietDaysTableFilterComposer
    extends Composer<_$AppDatabase, $DietDaysTable> {
  $$DietDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  $$DietPlansTableFilterComposer get dietPlanId {
    final $$DietPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietPlanId,
      referencedTable: $db.dietPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietPlansTableFilterComposer(
            $db: $db,
            $table: $db.dietPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dietMealsRefs(
    Expression<bool> Function($$DietMealsTableFilterComposer f) f,
  ) {
    final $$DietMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dietMeals,
      getReferencedColumn: (t) => t.dietDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealsTableFilterComposer(
            $db: $db,
            $table: $db.dietMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DietDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $DietDaysTable> {
  $$DietDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  $$DietPlansTableOrderingComposer get dietPlanId {
    final $$DietPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietPlanId,
      referencedTable: $db.dietPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietPlansTableOrderingComposer(
            $db: $db,
            $table: $db.dietPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DietDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $DietDaysTable> {
  $$DietDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  $$DietPlansTableAnnotationComposer get dietPlanId {
    final $$DietPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietPlanId,
      referencedTable: $db.dietPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.dietPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dietMealsRefs<T extends Object>(
    Expression<T> Function($$DietMealsTableAnnotationComposer a) f,
  ) {
    final $$DietMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dietMeals,
      getReferencedColumn: (t) => t.dietDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.dietMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DietDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DietDaysTable,
          DietDayData,
          $$DietDaysTableFilterComposer,
          $$DietDaysTableOrderingComposer,
          $$DietDaysTableAnnotationComposer,
          $$DietDaysTableCreateCompanionBuilder,
          $$DietDaysTableUpdateCompanionBuilder,
          (DietDayData, $$DietDaysTableReferences),
          DietDayData,
          PrefetchHooks Function({bool dietPlanId, bool dietMealsRefs})
        > {
  $$DietDaysTableTableManager(_$AppDatabase db, $DietDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DietDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DietDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DietDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<int> dietPlanId = const Value.absent(),
              }) => DietDaysCompanion(
                id: id,
                name: name,
                index: index,
                dietPlanId: dietPlanId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int index,
                required int dietPlanId,
              }) => DietDaysCompanion.insert(
                id: id,
                name: name,
                index: index,
                dietPlanId: dietPlanId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DietDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dietPlanId = false, dietMealsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dietMealsRefs) db.dietMeals],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (dietPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dietPlanId,
                                referencedTable: $$DietDaysTableReferences
                                    ._dietPlanIdTable(db),
                                referencedColumn: $$DietDaysTableReferences
                                    ._dietPlanIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dietMealsRefs)
                    await $_getPrefetchedData<
                      DietDayData,
                      $DietDaysTable,
                      DietMealData
                    >(
                      currentTable: table,
                      referencedTable: $$DietDaysTableReferences
                          ._dietMealsRefsTable(db),
                      managerFromTypedResult: (p0) => $$DietDaysTableReferences(
                        db,
                        table,
                        p0,
                      ).dietMealsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.dietDayId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DietDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DietDaysTable,
      DietDayData,
      $$DietDaysTableFilterComposer,
      $$DietDaysTableOrderingComposer,
      $$DietDaysTableAnnotationComposer,
      $$DietDaysTableCreateCompanionBuilder,
      $$DietDaysTableUpdateCompanionBuilder,
      (DietDayData, $$DietDaysTableReferences),
      DietDayData,
      PrefetchHooks Function({bool dietPlanId, bool dietMealsRefs})
    >;
typedef $$DietMealsTableCreateCompanionBuilder =
    DietMealsCompanion Function({
      Value<int> id,
      required String name,
      required int index,
      required int dietDayId,
    });
typedef $$DietMealsTableUpdateCompanionBuilder =
    DietMealsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> index,
      Value<int> dietDayId,
    });

final class $$DietMealsTableReferences
    extends BaseReferences<_$AppDatabase, $DietMealsTable, DietMealData> {
  $$DietMealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DietDaysTable _dietDayIdTable(_$AppDatabase db) =>
      db.dietDays.createAlias(
        $_aliasNameGenerator(db.dietMeals.dietDayId, db.dietDays.id),
      );

  $$DietDaysTableProcessedTableManager get dietDayId {
    final $_column = $_itemColumn<int>('diet_day_id')!;

    final manager = $$DietDaysTableTableManager(
      $_db,
      $_db.dietDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dietDayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $DietMealIngredientsTable,
    List<DietMealIngredientData>
  >
  _dietMealIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dietMealIngredients,
        aliasName: $_aliasNameGenerator(
          db.dietMeals.id,
          db.dietMealIngredients.dietMealId,
        ),
      );

  $$DietMealIngredientsTableProcessedTableManager get dietMealIngredientsRefs {
    final manager = $$DietMealIngredientsTableTableManager(
      $_db,
      $_db.dietMealIngredients,
    ).filter((f) => f.dietMealId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dietMealIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DietMealsTableFilterComposer
    extends Composer<_$AppDatabase, $DietMealsTable> {
  $$DietMealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  $$DietDaysTableFilterComposer get dietDayId {
    final $$DietDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietDayId,
      referencedTable: $db.dietDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietDaysTableFilterComposer(
            $db: $db,
            $table: $db.dietDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dietMealIngredientsRefs(
    Expression<bool> Function($$DietMealIngredientsTableFilterComposer f) f,
  ) {
    final $$DietMealIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dietMealIngredients,
      getReferencedColumn: (t) => t.dietMealId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.dietMealIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DietMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $DietMealsTable> {
  $$DietMealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  $$DietDaysTableOrderingComposer get dietDayId {
    final $$DietDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietDayId,
      referencedTable: $db.dietDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietDaysTableOrderingComposer(
            $db: $db,
            $table: $db.dietDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DietMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DietMealsTable> {
  $$DietMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  $$DietDaysTableAnnotationComposer get dietDayId {
    final $$DietDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietDayId,
      referencedTable: $db.dietDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.dietDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dietMealIngredientsRefs<T extends Object>(
    Expression<T> Function($$DietMealIngredientsTableAnnotationComposer a) f,
  ) {
    final $$DietMealIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.dietMealIngredients,
          getReferencedColumn: (t) => t.dietMealId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DietMealIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.dietMealIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DietMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DietMealsTable,
          DietMealData,
          $$DietMealsTableFilterComposer,
          $$DietMealsTableOrderingComposer,
          $$DietMealsTableAnnotationComposer,
          $$DietMealsTableCreateCompanionBuilder,
          $$DietMealsTableUpdateCompanionBuilder,
          (DietMealData, $$DietMealsTableReferences),
          DietMealData,
          PrefetchHooks Function({bool dietDayId, bool dietMealIngredientsRefs})
        > {
  $$DietMealsTableTableManager(_$AppDatabase db, $DietMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DietMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DietMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DietMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<int> dietDayId = const Value.absent(),
              }) => DietMealsCompanion(
                id: id,
                name: name,
                index: index,
                dietDayId: dietDayId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int index,
                required int dietDayId,
              }) => DietMealsCompanion.insert(
                id: id,
                name: name,
                index: index,
                dietDayId: dietDayId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DietMealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dietDayId = false, dietMealIngredientsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dietMealIngredientsRefs) db.dietMealIngredients,
                  ],
                  addJoins:
                      <
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
                          dynamic
                        >
                      >(state) {
                        if (dietDayId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dietDayId,
                                    referencedTable: $$DietMealsTableReferences
                                        ._dietDayIdTable(db),
                                    referencedColumn: $$DietMealsTableReferences
                                        ._dietDayIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dietMealIngredientsRefs)
                        await $_getPrefetchedData<
                          DietMealData,
                          $DietMealsTable,
                          DietMealIngredientData
                        >(
                          currentTable: table,
                          referencedTable: $$DietMealsTableReferences
                              ._dietMealIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DietMealsTableReferences(
                                db,
                                table,
                                p0,
                              ).dietMealIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dietMealId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DietMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DietMealsTable,
      DietMealData,
      $$DietMealsTableFilterComposer,
      $$DietMealsTableOrderingComposer,
      $$DietMealsTableAnnotationComposer,
      $$DietMealsTableCreateCompanionBuilder,
      $$DietMealsTableUpdateCompanionBuilder,
      (DietMealData, $$DietMealsTableReferences),
      DietMealData,
      PrefetchHooks Function({bool dietDayId, bool dietMealIngredientsRefs})
    >;
typedef $$DietMealIngredientsTableCreateCompanionBuilder =
    DietMealIngredientsCompanion Function({
      Value<int> id,
      required double amount,
      required int index,
      required String code,
      required String nameAr,
      required String nameEn,
      required String category,
      required double servingSizeInGrams,
      required double calories,
      required double protein,
      required double carbs,
      required double fats,
      required int dietMealId,
    });
typedef $$DietMealIngredientsTableUpdateCompanionBuilder =
    DietMealIngredientsCompanion Function({
      Value<int> id,
      Value<double> amount,
      Value<int> index,
      Value<String> code,
      Value<String> nameAr,
      Value<String> nameEn,
      Value<String> category,
      Value<double> servingSizeInGrams,
      Value<double> calories,
      Value<double> protein,
      Value<double> carbs,
      Value<double> fats,
      Value<int> dietMealId,
    });

final class $$DietMealIngredientsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DietMealIngredientsTable,
          DietMealIngredientData
        > {
  $$DietMealIngredientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DietMealsTable _dietMealIdTable(_$AppDatabase db) =>
      db.dietMeals.createAlias(
        $_aliasNameGenerator(
          db.dietMealIngredients.dietMealId,
          db.dietMeals.id,
        ),
      );

  $$DietMealsTableProcessedTableManager get dietMealId {
    final $_column = $_itemColumn<int>('diet_meal_id')!;

    final manager = $$DietMealsTableTableManager(
      $_db,
      $_db.dietMeals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dietMealIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DietMealIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $DietMealIngredientsTable> {
  $$DietMealIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fats => $composableBuilder(
    column: $table.fats,
    builder: (column) => ColumnFilters(column),
  );

  $$DietMealsTableFilterComposer get dietMealId {
    final $$DietMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietMealId,
      referencedTable: $db.dietMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealsTableFilterComposer(
            $db: $db,
            $table: $db.dietMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DietMealIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $DietMealIngredientsTable> {
  $$DietMealIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAr => $composableBuilder(
    column: $table.nameAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fats => $composableBuilder(
    column: $table.fats,
    builder: (column) => ColumnOrderings(column),
  );

  $$DietMealsTableOrderingComposer get dietMealId {
    final $$DietMealsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietMealId,
      referencedTable: $db.dietMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealsTableOrderingComposer(
            $db: $db,
            $table: $db.dietMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DietMealIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DietMealIngredientsTable> {
  $$DietMealIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get nameAr =>
      $composableBuilder(column: $table.nameAr, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get servingSizeInGrams => $composableBuilder(
    column: $table.servingSizeInGrams,
    builder: (column) => column,
  );

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get fats =>
      $composableBuilder(column: $table.fats, builder: (column) => column);

  $$DietMealsTableAnnotationComposer get dietMealId {
    final $$DietMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietMealId,
      referencedTable: $db.dietMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.dietMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DietMealIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DietMealIngredientsTable,
          DietMealIngredientData,
          $$DietMealIngredientsTableFilterComposer,
          $$DietMealIngredientsTableOrderingComposer,
          $$DietMealIngredientsTableAnnotationComposer,
          $$DietMealIngredientsTableCreateCompanionBuilder,
          $$DietMealIngredientsTableUpdateCompanionBuilder,
          (DietMealIngredientData, $$DietMealIngredientsTableReferences),
          DietMealIngredientData,
          PrefetchHooks Function({bool dietMealId})
        > {
  $$DietMealIngredientsTableTableManager(
    _$AppDatabase db,
    $DietMealIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DietMealIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DietMealIngredientsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DietMealIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> nameAr = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> servingSizeInGrams = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<double> fats = const Value.absent(),
                Value<int> dietMealId = const Value.absent(),
              }) => DietMealIngredientsCompanion(
                id: id,
                amount: amount,
                index: index,
                code: code,
                nameAr: nameAr,
                nameEn: nameEn,
                category: category,
                servingSizeInGrams: servingSizeInGrams,
                calories: calories,
                protein: protein,
                carbs: carbs,
                fats: fats,
                dietMealId: dietMealId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double amount,
                required int index,
                required String code,
                required String nameAr,
                required String nameEn,
                required String category,
                required double servingSizeInGrams,
                required double calories,
                required double protein,
                required double carbs,
                required double fats,
                required int dietMealId,
              }) => DietMealIngredientsCompanion.insert(
                id: id,
                amount: amount,
                index: index,
                code: code,
                nameAr: nameAr,
                nameEn: nameEn,
                category: category,
                servingSizeInGrams: servingSizeInGrams,
                calories: calories,
                protein: protein,
                carbs: carbs,
                fats: fats,
                dietMealId: dietMealId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DietMealIngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dietMealId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic
                    >
                  >(state) {
                    if (dietMealId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dietMealId,
                                referencedTable:
                                    $$DietMealIngredientsTableReferences
                                        ._dietMealIdTable(db),
                                referencedColumn:
                                    $$DietMealIngredientsTableReferences
                                        ._dietMealIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DietMealIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DietMealIngredientsTable,
      DietMealIngredientData,
      $$DietMealIngredientsTableFilterComposer,
      $$DietMealIngredientsTableOrderingComposer,
      $$DietMealIngredientsTableAnnotationComposer,
      $$DietMealIngredientsTableCreateCompanionBuilder,
      $$DietMealIngredientsTableUpdateCompanionBuilder,
      (DietMealIngredientData, $$DietMealIngredientsTableReferences),
      DietMealIngredientData,
      PrefetchHooks Function({bool dietMealId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$DaysGroupTableTableManager get daysGroup =>
      $$DaysGroupTableTableManager(_db, _db.daysGroup);
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
  $$MeasurementsTableTableManager get measurements =>
      $$MeasurementsTableTableManager(_db, _db.measurements);
  $$IngredientsTableTableManager get ingredients =>
      $$IngredientsTableTableManager(_db, _db.ingredients);
  $$DietPlansTableTableManager get dietPlans =>
      $$DietPlansTableTableManager(_db, _db.dietPlans);
  $$DietDaysTableTableManager get dietDays =>
      $$DietDaysTableTableManager(_db, _db.dietDays);
  $$DietMealsTableTableManager get dietMeals =>
      $$DietMealsTableTableManager(_db, _db.dietMeals);
  $$DietMealIngredientsTableTableManager get dietMealIngredients =>
      $$DietMealIngredientsTableTableManager(_db, _db.dietMealIngredients);
}
