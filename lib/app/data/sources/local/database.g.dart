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
  List<GeneratedColumn> get $columns =>
      [id, apiId, name, description, isCurrent, createdAt, updatedAt];
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
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isCurrent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_current'])!,
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
  final String name;
  final String? description;
  final bool isCurrent;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Routine(
      {required this.id,
      this.apiId,
      required this.name,
      this.description,
      required this.isCurrent,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_current'] = Variable<bool>(isCurrent);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCurrent: Value(isCurrent),
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
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
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
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isCurrent': serializer.toJson<bool>(isCurrent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Routine copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          bool? isCurrent,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Routine(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        isCurrent: isCurrent ?? this.isCurrent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Routine copyWithCompanion(RoutinesCompanion data) {
    return Routine(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      isCurrent: data.isCurrent.present ? data.isCurrent.value : this.isCurrent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Routine(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, apiId, name, description, isCurrent, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Routine &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.name == this.name &&
          other.description == this.description &&
          other.isCurrent == this.isCurrent &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoutinesCompanion extends UpdateCompanion<Routine> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isCurrent;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RoutinesCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isCurrent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Routine> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isCurrent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isCurrent != null) 'is_current': isCurrent,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RoutinesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<String>? name,
      Value<String?>? description,
      Value<bool>? isCurrent,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return RoutinesCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
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
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCurrent: $isCurrent, ')
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
  static const VerificationMeta _dayNameMeta =
      const VerificationMeta('dayName');
  @override
  late final GeneratedColumn<String> dayName = GeneratedColumn<String>(
      'day_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _routineMeta =
      const VerificationMeta('routine');
  @override
  late final GeneratedColumn<int> routine = GeneratedColumn<int>(
      'routine', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES routines (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, apiId, index, dayName, routine];
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
    if (data.containsKey('day_name')) {
      context.handle(_dayNameMeta,
          dayName.isAcceptableOrUnknown(data['day_name']!, _dayNameMeta));
    } else if (isInserting) {
      context.missing(_dayNameMeta);
    }
    if (data.containsKey('routine')) {
      context.handle(_routineMeta,
          routine.isAcceptableOrUnknown(data['routine']!, _routineMeta));
    } else if (isInserting) {
      context.missing(_routineMeta);
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
      dayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}day_name'])!,
      routine: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}routine'])!,
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
  final String dayName;
  final int routine;
  const DaysGroupData(
      {required this.id,
      this.apiId,
      required this.index,
      required this.dayName,
      required this.routine});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || apiId != null) {
      map['api_id'] = Variable<int>(apiId);
    }
    map['index'] = Variable<int>(index);
    map['day_name'] = Variable<String>(dayName);
    map['routine'] = Variable<int>(routine);
    return map;
  }

  DaysGroupCompanion toCompanion(bool nullToAbsent) {
    return DaysGroupCompanion(
      id: Value(id),
      apiId:
          apiId == null && nullToAbsent ? const Value.absent() : Value(apiId),
      index: Value(index),
      dayName: Value(dayName),
      routine: Value(routine),
    );
  }

  factory DaysGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DaysGroupData(
      id: serializer.fromJson<int>(json['id']),
      apiId: serializer.fromJson<int?>(json['apiId']),
      index: serializer.fromJson<int>(json['index']),
      dayName: serializer.fromJson<String>(json['dayName']),
      routine: serializer.fromJson<int>(json['routine']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'apiId': serializer.toJson<int?>(apiId),
      'index': serializer.toJson<int>(index),
      'dayName': serializer.toJson<String>(dayName),
      'routine': serializer.toJson<int>(routine),
    };
  }

  DaysGroupData copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          String? dayName,
          int? routine}) =>
      DaysGroupData(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        dayName: dayName ?? this.dayName,
        routine: routine ?? this.routine,
      );
  DaysGroupData copyWithCompanion(DaysGroupCompanion data) {
    return DaysGroupData(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      dayName: data.dayName.present ? data.dayName.value : this.dayName,
      routine: data.routine.present ? data.routine.value : this.routine,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DaysGroupData(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('dayName: $dayName, ')
          ..write('routine: $routine')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, index, dayName, routine);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DaysGroupData &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.dayName == this.dayName &&
          other.routine == this.routine);
}

class DaysGroupCompanion extends UpdateCompanion<DaysGroupData> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<String> dayName;
  final Value<int> routine;
  const DaysGroupCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.dayName = const Value.absent(),
    this.routine = const Value.absent(),
  });
  DaysGroupCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    required String dayName,
    required int routine,
  })  : index = Value(index),
        dayName = Value(dayName),
        routine = Value(routine);
  static Insertable<DaysGroupData> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<String>? dayName,
    Expression<int>? routine,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (dayName != null) 'day_name': dayName,
      if (routine != null) 'routine': routine,
    });
  }

  DaysGroupCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? index,
      Value<String>? dayName,
      Value<int>? routine}) {
    return DaysGroupCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      dayName: dayName ?? this.dayName,
      routine: routine ?? this.routine,
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
    if (dayName.present) {
      map['day_name'] = Variable<String>(dayName.value);
    }
    if (routine.present) {
      map['routine'] = Variable<int>(routine.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysGroupCompanion(')
          ..write('id: $id, ')
          ..write('apiId: $apiId, ')
          ..write('index: $index, ')
          ..write('dayName: $dayName, ')
          ..write('routine: $routine')
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
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
      [id, apiId, index, notes, exercise, day];
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
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
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
  final String? notes;
  final int exercise;
  final int day;
  const RoutineItem(
      {required this.id,
      this.apiId,
      required this.index,
      this.notes,
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
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
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
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
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
      notes: serializer.fromJson<String?>(json['notes']),
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
      'notes': serializer.toJson<String?>(notes),
      'exercise': serializer.toJson<int>(exercise),
      'day': serializer.toJson<int>(day),
    };
  }

  RoutineItem copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? index,
          Value<String?> notes = const Value.absent(),
          int? exercise,
          int? day}) =>
      RoutineItem(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        index: index ?? this.index,
        notes: notes.present ? notes.value : this.notes,
        exercise: exercise ?? this.exercise,
        day: day ?? this.day,
      );
  RoutineItem copyWithCompanion(RoutineItemsCompanion data) {
    return RoutineItem(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      index: data.index.present ? data.index.value : this.index,
      notes: data.notes.present ? data.notes.value : this.notes,
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
          ..write('notes: $notes, ')
          ..write('exercise: $exercise, ')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apiId, index, notes, exercise, day);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineItem &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.index == this.index &&
          other.notes == this.notes &&
          other.exercise == this.exercise &&
          other.day == this.day);
}

class RoutineItemsCompanion extends UpdateCompanion<RoutineItem> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> index;
  final Value<String?> notes;
  final Value<int> exercise;
  final Value<int> day;
  const RoutineItemsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.index = const Value.absent(),
    this.notes = const Value.absent(),
    this.exercise = const Value.absent(),
    this.day = const Value.absent(),
  });
  RoutineItemsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int index,
    this.notes = const Value.absent(),
    required int exercise,
    required int day,
  })  : index = Value(index),
        exercise = Value(exercise),
        day = Value(day);
  static Insertable<RoutineItem> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? index,
    Expression<String>? notes,
    Expression<int>? exercise,
    Expression<int>? day,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (index != null) 'index': index,
      if (notes != null) 'notes': notes,
      if (exercise != null) 'exercise': exercise,
      if (day != null) 'day': day,
    });
  }

  RoutineItemsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? index,
      Value<String?>? notes,
      Value<int>? exercise,
      Value<int>? day}) {
    return RoutineItemsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      index: index ?? this.index,
      notes: notes ?? this.notes,
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
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
          ..write('notes: $notes, ')
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
      [id, apiId, roundIndex, repsCount, routineItemId];
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
  final int routineItemId;
  const Set(
      {required this.id,
      this.apiId,
      required this.roundIndex,
      required this.repsCount,
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
      'routineItemId': serializer.toJson<int>(routineItemId),
    };
  }

  Set copyWith(
          {int? id,
          Value<int?> apiId = const Value.absent(),
          int? roundIndex,
          int? repsCount,
          int? routineItemId}) =>
      Set(
        id: id ?? this.id,
        apiId: apiId.present ? apiId.value : this.apiId,
        roundIndex: roundIndex ?? this.roundIndex,
        repsCount: repsCount ?? this.repsCount,
        routineItemId: routineItemId ?? this.routineItemId,
      );
  Set copyWithCompanion(SetsCompanion data) {
    return Set(
      id: data.id.present ? data.id.value : this.id,
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      roundIndex:
          data.roundIndex.present ? data.roundIndex.value : this.roundIndex,
      repsCount: data.repsCount.present ? data.repsCount.value : this.repsCount,
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
          ..write('routineItemId: $routineItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, apiId, roundIndex, repsCount, routineItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Set &&
          other.id == this.id &&
          other.apiId == this.apiId &&
          other.roundIndex == this.roundIndex &&
          other.repsCount == this.repsCount &&
          other.routineItemId == this.routineItemId);
}

class SetsCompanion extends UpdateCompanion<Set> {
  final Value<int> id;
  final Value<int?> apiId;
  final Value<int> roundIndex;
  final Value<int> repsCount;
  final Value<int> routineItemId;
  const SetsCompanion({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    this.roundIndex = const Value.absent(),
    this.repsCount = const Value.absent(),
    this.routineItemId = const Value.absent(),
  });
  SetsCompanion.insert({
    this.id = const Value.absent(),
    this.apiId = const Value.absent(),
    required int roundIndex,
    required int repsCount,
    required int routineItemId,
  })  : roundIndex = Value(roundIndex),
        repsCount = Value(repsCount),
        routineItemId = Value(routineItemId);
  static Insertable<Set> custom({
    Expression<int>? id,
    Expression<int>? apiId,
    Expression<int>? roundIndex,
    Expression<int>? repsCount,
    Expression<int>? routineItemId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (apiId != null) 'api_id': apiId,
      if (roundIndex != null) 'round_index': roundIndex,
      if (repsCount != null) 'reps_count': repsCount,
      if (routineItemId != null) 'routine_item_id': routineItemId,
    });
  }

  SetsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? apiId,
      Value<int>? roundIndex,
      Value<int>? repsCount,
      Value<int>? routineItemId}) {
    return SetsCompanion(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      roundIndex: roundIndex ?? this.roundIndex,
      repsCount: repsCount ?? this.repsCount,
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
  required String name,
  Value<String?> description,
  Value<bool> isCurrent,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$RoutinesTableUpdateCompanionBuilder = RoutinesCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<String> name,
  Value<String?> description,
  Value<bool> isCurrent,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$RoutinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutinesTable,
    Routine,
    $$RoutinesTableFilterComposer,
    $$RoutinesTableOrderingComposer,
    $$RoutinesTableCreateCompanionBuilder,
    $$RoutinesTableUpdateCompanionBuilder> {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoutinesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoutinesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isCurrent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RoutinesCompanion(
            id: id,
            apiId: apiId,
            name: name,
            description: description,
            isCurrent: isCurrent,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<bool> isCurrent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RoutinesCompanion.insert(
            id: id,
            apiId: apiId,
            name: name,
            description: description,
            isCurrent: isCurrent,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$RoutinesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCurrent => $state.composableBuilder(
      column: $state.table.isCurrent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter daysGroupRefs(
      ComposableFilter Function($$DaysGroupTableFilterComposer f) f) {
    final $$DaysGroupTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.daysGroup,
        getReferencedColumn: (t) => t.routine,
        builder: (joinBuilder, parentComposers) =>
            $$DaysGroupTableFilterComposer(ComposerState(
                $state.db, $state.db.daysGroup, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter setsRefs(
      ComposableFilter Function($$SetsTableFilterComposer f) f) {
    final $$SetsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.sets,
        getReferencedColumn: (t) => t.routineItemId,
        builder: (joinBuilder, parentComposers) => $$SetsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sets, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$RoutinesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCurrent => $state.composableBuilder(
      column: $state.table.isCurrent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DaysGroupTableCreateCompanionBuilder = DaysGroupCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  required int index,
  required String dayName,
  required int routine,
});
typedef $$DaysGroupTableUpdateCompanionBuilder = DaysGroupCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> index,
  Value<String> dayName,
  Value<int> routine,
});

class $$DaysGroupTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DaysGroupTable,
    DaysGroupData,
    $$DaysGroupTableFilterComposer,
    $$DaysGroupTableOrderingComposer,
    $$DaysGroupTableCreateCompanionBuilder,
    $$DaysGroupTableUpdateCompanionBuilder> {
  $$DaysGroupTableTableManager(_$AppDatabase db, $DaysGroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DaysGroupTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DaysGroupTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> index = const Value.absent(),
            Value<String> dayName = const Value.absent(),
            Value<int> routine = const Value.absent(),
          }) =>
              DaysGroupCompanion(
            id: id,
            apiId: apiId,
            index: index,
            dayName: dayName,
            routine: routine,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int index,
            required String dayName,
            required int routine,
          }) =>
              DaysGroupCompanion.insert(
            id: id,
            apiId: apiId,
            index: index,
            dayName: dayName,
            routine: routine,
          ),
        ));
}

class $$DaysGroupTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DaysGroupTable> {
  $$DaysGroupTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dayName => $state.composableBuilder(
      column: $state.table.dayName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RoutinesTableFilterComposer get routine {
    final $$RoutinesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routine,
        referencedTable: $state.db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$RoutinesTableFilterComposer(ComposerState(
                $state.db, $state.db.routines, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter routineItemsRefs(
      ComposableFilter Function($$RoutineItemsTableFilterComposer f) f) {
    final $$RoutineItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.routineItems,
        getReferencedColumn: (t) => t.day,
        builder: (joinBuilder, parentComposers) =>
            $$RoutineItemsTableFilterComposer(ComposerState($state.db,
                $state.db.routineItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$DaysGroupTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DaysGroupTable> {
  $$DaysGroupTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dayName => $state.composableBuilder(
      column: $state.table.dayName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RoutinesTableOrderingComposer get routine {
    final $$RoutinesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routine,
        referencedTable: $state.db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$RoutinesTableOrderingComposer(ComposerState(
                $state.db, $state.db.routines, joinBuilder, parentComposers)));
    return composer;
  }
}

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

class $$ExerciseGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseGroupsTable,
    ExerciseGroup,
    $$ExerciseGroupsTableFilterComposer,
    $$ExerciseGroupsTableOrderingComposer,
    $$ExerciseGroupsTableCreateCompanionBuilder,
    $$ExerciseGroupsTableUpdateCompanionBuilder> {
  $$ExerciseGroupsTableTableManager(
      _$AppDatabase db, $ExerciseGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExerciseGroupsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExerciseGroupsTableOrderingComposer(ComposerState(db, table)),
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
        ));
}

class $$ExerciseGroupsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExerciseGroupsTable> {
  $$ExerciseGroupsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get arName => $state.composableBuilder(
      column: $state.table.arName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter exercisesRefs(
      ComposableFilter Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.muscleGroup,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ExerciseGroupsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExerciseGroupsTable> {
  $$ExerciseGroupsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get arName => $state.composableBuilder(
      column: $state.table.arName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get enName => $state.composableBuilder(
      column: $state.table.enName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

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

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExercisesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExercisesTableOrderingComposer(ComposerState(db, table)),
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
        ));
}

class $$ExercisesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ExerciseGroupsTableFilterComposer get muscleGroup {
    final $$ExerciseGroupsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroup,
        referencedTable: $state.db.exerciseGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExerciseGroupsTableFilterComposer(ComposerState($state.db,
                $state.db.exerciseGroups, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter routineItemsRefs(
      ComposableFilter Function($$RoutineItemsTableFilterComposer f) f) {
    final $$RoutineItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.routineItems,
        getReferencedColumn: (t) => t.exercise,
        builder: (joinBuilder, parentComposers) =>
            $$RoutineItemsTableFilterComposer(ComposerState($state.db,
                $state.db.routineItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ExerciseGroupsTableOrderingComposer get muscleGroup {
    final $$ExerciseGroupsTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.muscleGroup,
            referencedTable: $state.db.exerciseGroups,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ExerciseGroupsTableOrderingComposer(ComposerState($state.db,
                    $state.db.exerciseGroups, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$RoutineItemsTableCreateCompanionBuilder = RoutineItemsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  required int index,
  Value<String?> notes,
  required int exercise,
  required int day,
});
typedef $$RoutineItemsTableUpdateCompanionBuilder = RoutineItemsCompanion
    Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> index,
  Value<String?> notes,
  Value<int> exercise,
  Value<int> day,
});

class $$RoutineItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutineItemsTable,
    RoutineItem,
    $$RoutineItemsTableFilterComposer,
    $$RoutineItemsTableOrderingComposer,
    $$RoutineItemsTableCreateCompanionBuilder,
    $$RoutineItemsTableUpdateCompanionBuilder> {
  $$RoutineItemsTableTableManager(_$AppDatabase db, $RoutineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoutineItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoutineItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> index = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> exercise = const Value.absent(),
            Value<int> day = const Value.absent(),
          }) =>
              RoutineItemsCompanion(
            id: id,
            apiId: apiId,
            index: index,
            notes: notes,
            exercise: exercise,
            day: day,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int index,
            Value<String?> notes = const Value.absent(),
            required int exercise,
            required int day,
          }) =>
              RoutineItemsCompanion.insert(
            id: id,
            apiId: apiId,
            index: index,
            notes: notes,
            exercise: exercise,
            day: day,
          ),
        ));
}

class $$RoutineItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RoutineItemsTable> {
  $$RoutineItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ExercisesTableFilterComposer get exercise {
    final $$ExercisesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableFilterComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }

  $$DaysGroupTableFilterComposer get day {
    final $$DaysGroupTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.day,
        referencedTable: $state.db.daysGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$DaysGroupTableFilterComposer(ComposerState(
                $state.db, $state.db.daysGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RoutineItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RoutineItemsTable> {
  $$RoutineItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ExercisesTableOrderingComposer get exercise {
    final $$ExercisesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise,
        referencedTable: $state.db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ExercisesTableOrderingComposer(ComposerState(
                $state.db, $state.db.exercises, joinBuilder, parentComposers)));
    return composer;
  }

  $$DaysGroupTableOrderingComposer get day {
    final $$DaysGroupTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.day,
        referencedTable: $state.db.daysGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$DaysGroupTableOrderingComposer(ComposerState(
                $state.db, $state.db.daysGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SetsTableCreateCompanionBuilder = SetsCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  required int roundIndex,
  required int repsCount,
  required int routineItemId,
});
typedef $$SetsTableUpdateCompanionBuilder = SetsCompanion Function({
  Value<int> id,
  Value<int?> apiId,
  Value<int> roundIndex,
  Value<int> repsCount,
  Value<int> routineItemId,
});

class $$SetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SetsTable,
    Set,
    $$SetsTableFilterComposer,
    $$SetsTableOrderingComposer,
    $$SetsTableCreateCompanionBuilder,
    $$SetsTableUpdateCompanionBuilder> {
  $$SetsTableTableManager(_$AppDatabase db, $SetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SetsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SetsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            Value<int> roundIndex = const Value.absent(),
            Value<int> repsCount = const Value.absent(),
            Value<int> routineItemId = const Value.absent(),
          }) =>
              SetsCompanion(
            id: id,
            apiId: apiId,
            roundIndex: roundIndex,
            repsCount: repsCount,
            routineItemId: routineItemId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> apiId = const Value.absent(),
            required int roundIndex,
            required int repsCount,
            required int routineItemId,
          }) =>
              SetsCompanion.insert(
            id: id,
            apiId: apiId,
            roundIndex: roundIndex,
            repsCount: repsCount,
            routineItemId: routineItemId,
          ),
        ));
}

class $$SetsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SetsTable> {
  $$SetsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get roundIndex => $state.composableBuilder(
      column: $state.table.roundIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get repsCount => $state.composableBuilder(
      column: $state.table.repsCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RoutinesTableFilterComposer get routineItemId {
    final $$RoutinesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
        referencedTable: $state.db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$RoutinesTableFilterComposer(ComposerState(
                $state.db, $state.db.routines, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SetsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SetsTable> {
  $$SetsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get apiId => $state.composableBuilder(
      column: $state.table.apiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get roundIndex => $state.composableBuilder(
      column: $state.table.roundIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get repsCount => $state.composableBuilder(
      column: $state.table.repsCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RoutinesTableOrderingComposer get routineItemId {
    final $$RoutinesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routineItemId,
        referencedTable: $state.db.routines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$RoutinesTableOrderingComposer(ComposerState(
                $state.db, $state.db.routines, joinBuilder, parentComposers)));
    return composer;
  }
}

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
