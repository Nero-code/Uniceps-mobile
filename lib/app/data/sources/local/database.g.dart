// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  get $primaryKey => {id};
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
  get $primaryKey => {id};
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
      'api_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _arNameMeta = const VerificationMeta('arName');
  @override
  late final GeneratedColumn<String> arName = GeneratedColumn<String>(
      'ar_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enNameMeta = const VerificationMeta('enName');
  @override
  late final GeneratedColumn<String> enName = GeneratedColumn<String>(
      'en_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, apiId, arName, enName];
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
    }
    if (data.containsKey('ar_name')) {
      context.handle(_arNameMeta,
          arName.isAcceptableOrUnknown(data['ar_name']!, _arNameMeta));
    } else if (isInserting) {
      context.missing(_arNameMeta);
    }
    if (data.containsKey('en_name')) {
      context.handle(_enNameMeta,
          enName.isAcceptableOrUnknown(data['en_name']!, _enNameMeta));
    } else if (isInserting) {
      context.missing(_enNameMeta);
    }
    return context;
  }

  @override
  get $primaryKey => {id};
  @override
  ExerciseGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      apiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}api_id']),
      arName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ar_name'])!,
      enName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}en_name'])!,
    );
  }

  @override
  $ExerciseGroupsTable createAlias(String alias) {
    return $ExerciseGroupsTable(attachedDatabase, alias);
  }
}

class ExerciseGroup extends DataClass implements Insertable<ExerciseGroup> {
  final int id;
  final int? apiId;
  final String arName;
  final String enName;
  const ExerciseGroup(
      {required this.id,
      this.apiId,
      required this.arName,
      required this.enName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['ar_name'] = Variable<String>(arName);
    map['en_name'] = Variable<String>(enName);
    return map;
  }

  ExerciseGroupsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseGroupsCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      arName: Value(arName),
      enName: Value(enName),
    );
  }

  factory ExerciseGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseGroup(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      arName: serializer.fromJson<String>(json['arName']),
      enName: serializer.fromJson<String>(json['enName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'arName': serializer.toJson<String>(arName),
      'enName': serializer.toJson<String>(enName),
    };
  }

  ExerciseGroup copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          String? arName,
          String? enName}) =>
      ExerciseGroup(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        arName: arName ?? this.arName,
        enName: enName ?? this.enName,
      );
  ExerciseGroup copyWithCompanion(ExerciseGroupsCompanion data) {
    return ExerciseGroup(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      arName: data.arName.present ? data.arName.value : this.arName,
      enName: data.enName.present ? data.enName.value : this.enName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseGroup(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('arName: $arName, ')
          ..write('enName: $enName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, arName, enName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseGroup &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.arName == this.arName &&
          other.enName == this.enName);
}

class ExerciseGroupsCompanion extends UpdateCompanion<ExerciseGroup> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<String> arName;
  final Value<String> enName;
  const ExerciseGroupsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.arName = const Value.absent(),
    this.enName = const Value.absent(),
  });
  ExerciseGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required String arName,
    required String enName,
  })  : arName = Value(arName),
        enName = Value(enName);
  static Insertable<ExerciseGroup> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<String>? arName,
    Expression<String>? enName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (arName != null) 'ar_name': arName,
      if (enName != null) 'en_name': enName,
    });
  }

  ExerciseGroupsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<String>? arName,
      Value<String>? enName}) {
    return ExerciseGroupsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      arName: arName ?? this.arName,
      enName: enName ?? this.enName,
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
    if (arName.present) {
      map['ar_name'] = Variable<String>(arName.value);
    }
    if (enName.present) {
      map['en_name'] = Variable<String>(enName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseGroupsCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('arName: $arName, ')
          ..write('enName: $enName')
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
  List<GeneratedColumn> get $columns => [id, apiId, name, muscleGroup];
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
  get $primaryKey => {id};
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
  final int muscleGroup;
  const Exercise(
      {required this.id,
      this.apiId,
      required this.name,
      required this.muscleGroup});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['name'] = Variable<String>(name);
    map['muscle_group'] = Variable<int>(muscleGroup);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      name: Value(name),
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
      'muscleGroup': serializer.toJson<int>(muscleGroup),
    };
  }

  Exercise copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          String? name,
          int? muscleGroup}) =>
      Exercise(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        name: name ?? this.name,
        muscleGroup: muscleGroup ?? this.muscleGroup,
      );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      name: data.name.present ? data.name.value : this.name,
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
          ..write('muscleGroup: $muscleGroup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, name, muscleGroup);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.muscleGroup == this.muscleGroup);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<String> name;
  final Value<int> muscleGroup;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.name = const Value.absent(),
    this.muscleGroup = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required String name,
    required int muscleGroup,
  })  : name = Value(name),
        muscleGroup = Value(muscleGroup);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<String>? name,
    Expression<int>? muscleGroup,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (name != null) 'name': name,
      if (muscleGroup != null) 'muscle_group': muscleGroup,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<String>? name,
      Value<int>? muscleGroup}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
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
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumn<int> exercise = GeneratedColumn<int>(
      'exercise', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
      'day', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES days_group (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, index, version, notes, isSynced, exercise, day];
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
    if (data.containsKey('exercise')) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta));
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    return context;
  }

  @override
  get $primaryKey => {id};
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
      exercise: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day'])!,
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
  final int exercise;
  final int day;
  const RoutineItem(
      {required this.id,
      this.apiId,
      required this.index,
      required this.version,
      this.notes,
      required this.isSynced,
      required this.exercise,
      required this.day});
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
    map['exercise'] = Variable<int>(exercise);
    map['day'] = Variable<int>(day);
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
      exercise: Value(exercise),
      day: Value(day),
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
      exercise: serializer.fromJson<int>(json['exercise']),
      day: serializer.fromJson<int>(json['day']),
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
      'exercise': serializer.toJson<int>(exercise),
      'day': serializer.toJson<int>(day),
    };
  }

  RoutineItem copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          int? version,
          Value<String?> notes = const Value.absent(),
          bool? isSynced,
          int? exercise,
          int? day}) =>
      RoutineItem(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        version: version ?? this.version,
        notes: notes.present ? notes.value : this.notes,
        isSynced: isSynced ?? this.isSynced,
        exercise: exercise ?? this.exercise,
        day: day ?? this.day,
      );
  RoutineItem copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItem(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      version: data.version.present ? data.version.value : this.version,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      day: data.day.present ? data.day.value : this.day,
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
          ..write('exercise: $exercise, ')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, apiId, index, version, notes, isSynced, exercise, day);
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
          other.exercise == this.exercise &&
          other.day == this.day);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItem> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<int> version;
  final Value<String?> notes;
  final Value<bool> isSynced;
  final Value<int> exercise;
  final Value<int> day;
  const RoutineItemsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.version = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.exercise = const Value.absent(),
    this.day = const Value.absent(),
  });
  RoutineItemsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    this.version = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSynced = const Value.absent(),
    required int exercise,
    required int day,
  })  : index = Value(index),
        exercise = Value(exercise),
        day = Value(day);
  static Insertable<RoutineItem> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<int>? version,
    Expression<String>? notes,
    Expression<bool>? isSynced,
    Expression<int>? exercise,
    Expression<int>? day,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (version != null) 'version': version,
      if (notes != null) 'notes': notes,
      if (isSynced != null) 'is_synced': isSynced,
      if (exercise != null) 'exercise': exercise,
      if (day != null) 'day': day,
    });
  }

  RoutineItemsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? index,
      Value<int>? version,
      Value<String?>? notes,
      Value<bool>? isSynced,
      Value<int>? exercise,
      Value<int>? day}) {
    return RoutineItemsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      version: version ?? this.version,
      notes: notes ?? this.notes,
      isSynced: isSynced ?? this.isSynced,
      exercise: exercise ?? this.exercise,
      day: day ?? this.day,
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
    if (exercise.present) {
      map['exercise'] = Variable<int>(exercise.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
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
          ..write('exercise: $exercise, ')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }
}

class $SetsTable extends Sets with TableInfo<$SetsTable, Set> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetsTable(this.attachedDatabase, [this._alias]);
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
          'REFERENCES routines (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, apiId, roundIndex, repsCount, version, isSynced, routineItemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sets';
  @override
  VerificationContext validateIntegrity(Insertable<Set> instance,
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
  get $primaryKey => {id};
  @override
  Set map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Set(
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
  $SetsTable createAlias(String alias) {
    return $SetsTable(attachedDatabase, alias);
  }
}

class Set extends DataClass implements Insertable<Set> {
  final int id;
  final int? apiId;
  final int roundIndex;
  final int repsCount;
  final int version;
  final bool isSynced;
  final int routineItemId;
  const Set(
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

  SetsCompanion toCompanion(bool nullToAbsent) {
    return SetsCompanion(
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

  factory Set.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Set(
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

  Set copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? roundIndex,
          int? repsCount,
          int? version,
          bool? isSynced,
          int? routineItemId}) =>
      Set(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        roundIndex: roundIndex ?? this.roundIndex,
        repsCount: repsCount ?? this.repsCount,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
        routineItemId: routineItemId ?? this.routineItemId,
      );
  Set copyWithCompanion(SetsCompanion data) {
    return Set(
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
    return (StringBuffer('Set(')
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
      (other is Set &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.roundIndex == this.roundIndex &&
          other.repsCount == this.repsCount &&
          other.version == this.version &&
          other.isSynced == this.isSynced &&
          other.routineItemId == this.routineItemId);
}

class SetsCompanion extends UpdateCompanion<Set> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> roundIndex;
  final Value<int> repsCount;
  final Value<int> version;
  final Value<bool> isSynced;
  final Value<int> routineItemId;
  const SetsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.roundIndex = const Value.absent(),
    this.repsCount = const Value.absent(),
    this.version = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.routineItemId = const Value.absent(),
  });
  SetsCompanion.insert({
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
  static Insertable<Set> custom({
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

  SetsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? roundIndex,
      Value<int>? repsCount,
      Value<int>? version,
      Value<bool>? isSynced,
      Value<int>? routineItemId}) {
    return SetsCompanion(
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
    return (StringBuffer('SetsCompanion(')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $DaysGroupTable daysGroup = $DaysGroupTable(this);
  late final $ExerciseGroupsTable exerciseGroups = $ExerciseGroupsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $RoutineItemsTable routineItems = $RoutineItemsTable(this);
  late final $SetsTable sets = $SetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [routines, daysGroup, exerciseGroups, exercises, routineItems, sets];
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
            on: TableUpdateQuery.onTableName('routines',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sets', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('routines',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('sets', kind: UpdateKind.update),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

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

  static MultiTypedResultKey<$SetsTable, List<Set>> _setsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.sets,
          aliasName:
              $_aliasNameGenerator(db.routines.id, db.sets.routineItemId));

  $$SetsTableProcessedTableManager get setsRefs {
    final manager = $$SetsTableTableManager($_db, $_db.sets)
        .filter((f) => f.routineItemId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_setsRefsTable($_db));
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

  Expression<bool> setsRefs(
      Expression<bool> Function($$SetsTableFilterComposer f) f) {
    final $$SetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sets,
        getReferencedColumn: (t) => t.routineItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SetsTableFilterComposer(
              $db: $db,
              $table: $db.sets,
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

  Expression<T> setsRefs<T extends Object>(
      Expression<T> Function($$SetsTableAnnotationComposer a) f) {
    final $$SetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sets,
        getReferencedColumn: (t) => t.routineItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SetsTableAnnotationComposer(
              $db: $db,
              $table: $db.sets,
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
    PrefetchHooks Function({bool daysGroupRefs, bool setsRefs})> {
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
          prefetchHooksCallback: ({daysGroupRefs = false, setsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (daysGroupRefs) db.daysGroup,
                if (setsRefs) db.sets
              ],
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
                        typedResults: items),
                  if (setsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoutinesTableReferences._setsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutinesTableReferences(db, table, p0).setsRefs,
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
    PrefetchHooks Function({bool daysGroupRefs, bool setsRefs})>;
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
                  $_aliasNameGenerator(db.daysGroup.id, db.routineItems.day));

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter((f) => f.day.id($_item.id));

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
        getReferencedColumn: (t) => t.day,
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
        getReferencedColumn: (t) => t.day,
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
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.day == item.id),
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
  Value<int?> apiId,
  required String arName,
  required String enName,
});
typedef $$ExerciseGroupsTableUpdateCompanionBuilder = ExerciseGroupsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  Value<String> arName,
  Value<String> enName,
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

  ColumnFilters<String> get arName => $composableBuilder(
      column: $table.arName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get enName => $composableBuilder(
      column: $table.enName, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get arName => $composableBuilder(
      column: $table.arName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get enName => $composableBuilder(
      column: $table.enName, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get arName =>
      $composableBuilder(column: $table.arName, builder: (column) => column);

  GeneratedColumn<String> get enName =>
      $composableBuilder(column: $table.enName, builder: (column) => column);

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
            Value<int?> apiId = const Value.absent(),
            Value<String> arName = const Value.absent(),
            Value<String> enName = const Value.absent(),
          }) =>
              ExerciseGroupsCompanion(
            id: id,
            apiId: apiId,
            arName: arName,
            enName: enName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required String arName,
            required String enName,
          }) =>
              ExerciseGroupsCompanion.insert(
            id: id,
            apiId: apiId,
            arName: arName,
            enName: enName,
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
  required int muscleGroup,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<String> name,
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
      _routineItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.routineItems,
          aliasName:
              $_aliasNameGenerator(db.exercises.id, db.routineItems.exercise));

  $$RoutineItemsTableProcessedTableManager get routineItemsRefs {
    final manager = $$RoutineItemsTableTableManager($_db, $_db.routineItems)
        .filter((f) => f.exercise.id($_item.id));

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
        getReferencedColumn: (t) => t.exercise,
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
        getReferencedColumn: (t) => t.exercise,
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
            Value<int> muscleGroup = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            apiId: apiId,
            name: name,
            muscleGroup: muscleGroup,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required String name,
            required int muscleGroup,
          }) =>
              ExercisesCompanion.insert(
            id: id,
            apiId: apiId,
            name: name,
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
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.exercise == item.id),
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
  required int exercise,
  required int day,
});
typedef $$RoutineItemsTableUpdateCompanionBuilder = RoutineItemsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> index,
  Value<int> version,
  Value<String?> notes,
  Value<bool> isSynced,
  Value<int> exercise,
  Value<int> day,
});

final class $$RoutineItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RoutineItemsTable, RoutineItem> {
  $$RoutineItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exerciseTable(_$AppDatabase db) =>
      db.exercises.createAlias(
          $_aliasNameGenerator(db.routineItems.exercise, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exercise {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exercise));
    final item = $_typedResult.readTableOrNull(_exerciseTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DaysGroupTable _dayTable(_$AppDatabase db) => db.daysGroup
      .createAlias($_aliasNameGenerator(db.routineItems.day, db.daysGroup.id));

  $$DaysGroupTableProcessedTableManager get day {
    final manager = $$DaysGroupTableTableManager($_db, $_db.daysGroup)
        .filter((f) => f.id($_item.day));
    final item = $_typedResult.readTableOrNull(_dayTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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

  $$ExercisesTableFilterComposer get exercise {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise,
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

  $$DaysGroupTableFilterComposer get day {
    final $$DaysGroupTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.day,
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

  $$ExercisesTableOrderingComposer get exercise {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise,
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

  $$DaysGroupTableOrderingComposer get day {
    final $$DaysGroupTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.day,
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

  $$ExercisesTableAnnotationComposer get exercise {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise,
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

  $$DaysGroupTableAnnotationComposer get day {
    final $$DaysGroupTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.day,
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
    PrefetchHooks Function({bool exercise, bool day})> {
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
            Value<int> exercise = const Value.absent(),
            Value<int> day = const Value.absent(),
          }) =>
              RoutineItemsCompanion(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            notes: notes,
            isSynced: isSynced,
            exercise: exercise,
            day: day,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int index,
            Value<int> version = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            required int exercise,
            required int day,
          }) =>
              RoutineItemsCompanion.insert(
            id: id,
            apiId: apiId,
            index: index,
            version: version,
            notes: notes,
            isSynced: isSynced,
            exercise: exercise,
            day: day,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoutineItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({exercise = false, day = false}) {
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
                if (exercise) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exercise,
                    referencedTable:
                        $$RoutineItemsTableReferences._exerciseTable(db),
                    referencedColumn:
                        $$RoutineItemsTableReferences._exerciseTable(db).id,
                  ) as T;
                }
                if (day) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.day,
                    referencedTable:
                        $$RoutineItemsTableReferences._dayTable(db),
                    referencedColumn:
                        $$RoutineItemsTableReferences._dayTable(db).id,
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
    PrefetchHooks Function({bool exercise, bool day})>;
typedef $$SetsTableCreateCompanionBuilder = SetsCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  required int roundIndex,
  required int repsCount,
  Value<int> version,
  Value<bool> isSynced,
  required int routineItemId,
});
typedef $$SetsTableUpdateCompanionBuilder = SetsCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> roundIndex,
  Value<int> repsCount,
  Value<int> version,
  Value<bool> isSynced,
  Value<int> routineItemId,
});

final class $$SetsTableReferences
    extends BaseReferences<_$AppDatabase, $SetsTable, Set> {
  $$SetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoutinesTable _routineItemIdTable(_$AppDatabase db) => db.routines
      .createAlias($_aliasNameGenerator(db.sets.routineItemId, db.routines.id));

  $$RoutinesTableProcessedTableManager get routineItemId {
    final manager = $$RoutinesTableTableManager($_db, $_db.routines)
        .filter((f) => f.id($_item.routineItemId));
    final item = $_typedResult.readTableOrNull(_routineItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SetsTableFilterComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableFilterComposer({
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

  $$RoutinesTableFilterComposer get routineItemId {
    final $$RoutinesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
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
}

class $$SetsTableOrderingComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableOrderingComposer({
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

  $$RoutinesTableOrderingComposer get routineItemId {
    final $$RoutinesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
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

class $$SetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableAnnotationComposer({
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

  $$RoutinesTableAnnotationComposer get routineItemId {
    final $$RoutinesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
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
}

class $$SetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SetsTable,
    Set,
    $$SetsTableFilterComposer,
    $$SetsTableOrderingComposer,
    $$SetsTableAnnotationComposer,
    $$SetsTableCreateCompanionBuilder,
    $$SetsTableUpdateCompanionBuilder,
    (Set, $$SetsTableReferences),
    Set,
    PrefetchHooks Function({bool routineItemId})> {
  $$SetsTableTableManager(_$AppDatabase db, $SetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> roundIndex = const Value.absent(),
            Value<int> repsCount = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> routineItemId = const Value.absent(),
          }) =>
              SetsCompanion(
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
              SetsCompanion.insert(
            id: id,
            apiId: apiId,
            roundIndex: roundIndex,
            repsCount: repsCount,
            version: version,
            isSynced: isSynced,
            routineItemId: routineItemId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SetsTableReferences(db, table, e)))
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
                        $$SetsTableReferences._routineItemIdTable(db),
                    referencedColumn:
                        $$SetsTableReferences._routineItemIdTable(db).id,
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

typedef $$SetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SetsTable,
    Set,
    $$SetsTableFilterComposer,
    $$SetsTableOrderingComposer,
    $$SetsTableAnnotationComposer,
    $$SetsTableCreateCompanionBuilder,
    $$SetsTableUpdateCompanionBuilder,
    (Set, $$SetsTableReferences),
    Set,
    PrefetchHooks Function({bool routineItemId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
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
  $$SetsTableTableManager get sets => $$SetsTableTableManager(_db, _db.sets);
}
