import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';

part 'measurement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeasurementModel {
  final int? id, apiId;
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

  const MeasurementModel({
    required this.id,
    required this.apiId,
    required this.height,
    required this.weight,
    required this.lArm,
    required this.rArm,
    required this.lHumerus,
    required this.rHumerus,
    required this.lLeg,
    required this.rLeg,
    required this.lThigh,
    required this.rThigh,
    required this.neck,
    required this.shoulders,
    required this.waist,
    required this.chest,
    required this.hips,
    required this.checkDate,
    required this.version,
    required this.isSynced,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) => _$MeasurementModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeasurementModelToJson(this);

  factory MeasurementModel.fromEntity(Measurement m) => MeasurementModel(
        id: m.id,
        apiId: m.apiId,
        height: m.height,
        weight: m.weight,
        lArm: m.lArm,
        rArm: m.rArm,
        lHumerus: m.lHumerus,
        rHumerus: m.rHumerus,
        lLeg: m.lLeg,
        rLeg: m.rLeg,
        lThigh: m.lThigh,
        rThigh: m.rThigh,
        neck: m.neck,
        shoulders: m.shoulders,
        waist: m.waist,
        chest: m.chest,
        hips: m.hips,
        checkDate: m.checkDate,
        version: m.version,
        isSynced: m.isSynced,
      );

  Measurement toEntity() => Measurement(
        id: id,
        apiId: apiId,
        height: height,
        weight: weight,
        lArm: lArm,
        rArm: rArm,
        lHumerus: lHumerus,
        rHumerus: rHumerus,
        lLeg: lLeg,
        rLeg: rLeg,
        lThigh: lThigh,
        rThigh: rThigh,
        neck: neck,
        shoulders: shoulders,
        waist: waist,
        chest: chest,
        hips: hips,
        checkDate: checkDate,
        version: version,
        isSynced: isSynced,
      );

  /// Dummy constructor for fake data generation.
  factory MeasurementModel.skank() => MeasurementModel(
        id: null,
        apiId: null,
        height: 0,
        weight: 0,
        lArm: 0,
        rArm: 0,
        lHumerus: 0,
        rHumerus: 0,
        lLeg: 0,
        rLeg: 0,
        lThigh: 0,
        rThigh: 0,
        neck: 0,
        shoulders: 0,
        waist: 0,
        chest: 0,
        hips: 0,
        checkDate: DateTime(Random().nextInt(25) + 2000),
        version: 0,
        isSynced: false,
      );
}
