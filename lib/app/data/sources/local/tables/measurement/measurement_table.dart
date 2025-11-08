import 'package:drift/drift.dart';

class Measurements extends Table {
  late final id = integer().autoIncrement()();
  late final apiId = integer().nullable()();
  late final height = real()();
  late final weight = real()();
  late final lArm = real()();
  late final rArm = real()();
  late final lHumerus = real()();
  late final rHumerus = real()();
  late final lThigh = real()();
  late final rThigh = real()();
  late final lLeg = real()();
  late final rLeg = real()();
  late final neck = real()();
  late final shoulders = real()();
  late final waist = real()();
  late final chest = real()();
  late final hips = real()();
  late final checkDate = dateTime()();
  late final version = integer().withDefault(const Constant(0));
  late final isSynced = boolean().withDefault(const Constant(false));
}
