import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';

part 'measurement_model.g.dart';

// "heightCm": 0,
// "weightKg": 0,
// "leftArmCm": 0,
// "rightArmCm": 0,
// "leftThighCm": 0,
// "rightThighCm": 0,
// "leftLegCm": 0,
// "rightLegCm": 0,
// "neckCm": 0,
// "shouldersCm": 0,
// "waistCm": 0,
// "chestCm": 0,
// "hipsCm": 0,
// "measuredAt": "2026-08-19T15:55:05.7371139Z"
@JsonSerializable()
class MeasurementModel {
  final int? id;
  final int? apiId;
  @JsonKey(name: "heightCm")
  final double height;
  @JsonKey(name: "weightKg")
  final double weight;
  @JsonKey(name: "leftArmCm")
  final double lArm;
  @JsonKey(name: "rightArmCm")
  final double rArm;
  @JsonKey(name: "leftThighCm")
  final double lThigh;
  @JsonKey(name: "rightThighCm")
  final double rThigh;
  @JsonKey(name: "leftLegCm")
  final double lLeg;
  @JsonKey(name: "rightLegCm")
  final double rLeg;
  @JsonKey(name: "neckCm")
  final double neck;
  @JsonKey(name: "shouldersCm")
  final double shoulders;
  @JsonKey(name: "waistCm")
  final double waist;
  @JsonKey(name: "chestCm")
  final double chest;
  @JsonKey(name: "hipsCm")
  final double hips;
  @JsonKey(name: "measuredAt")
  final DateTime checkDate;

  // --------------------------------------------
  // These values are Unimplemented thus not-used
  @JsonKey(defaultValue: 0.0)
  final double lHumerus;
  @JsonKey(defaultValue: 0.0)
  final double rHumerus;
  // --------------------------------------------

  @JsonKey(defaultValue: 0)
  final int version;
  @JsonKey(defaultValue: true)
  final bool isSynced;

  static int get propsNumbers => 15;

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

  factory MeasurementModel.fromTable(db.Measurement m) => MeasurementModel(
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

  MeasurementModel copyWith({
    int? id,
    int? apiId,
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
  }) => MeasurementModel(
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

  double getByIndex(int index) {
    switch (index) {
      case 0:
        return height;
      case 1:
        return weight;
      case 2:
        return neck;
      case 3:
        return shoulders;
      case 4:
        return chest;
      case 5:
        return waist;
      case 6:
        return lArm;
      case 7:
        return rArm;
      case 8:
        return lThigh;
      case 9:
        return rThigh;
      case 10:
        return lLeg;
      case 11:
        return rLeg;
      case 12:
        return hips;
      default:
        return 0.0;
    }
  }
}
