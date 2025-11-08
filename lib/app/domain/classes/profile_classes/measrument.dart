import 'package:equatable/equatable.dart';

class Measurement extends Equatable {
  final int? id;
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
    this.id,
    this.apiId,
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
    this.version = 0,
    this.isSynced = false,
  });

  Measurement copyWith({
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
  }) =>
      Measurement(
        id: id ?? this.id,
        apiId: apiId ?? this.apiId,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        lArm: lArm ?? this.lArm,
        rArm: rArm ?? this.rArm,
        lHumerus: lHumerus ?? this.lHumerus,
        rHumerus: rHumerus ?? this.rHumerus,
        lLeg: lLeg ?? this.lLeg,
        rLeg: rLeg ?? this.rLeg,
        lThigh: lThigh ?? this.lThigh,
        rThigh: rThigh ?? this.rThigh,
        neck: neck ?? this.neck,
        shoulders: shoulders ?? this.shoulders,
        waist: waist ?? this.waist,
        chest: chest ?? this.chest,
        hips: hips ?? this.hips,
        checkDate: checkDate ?? this.checkDate,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
      );

  @override
  List<Object?> get props => [id];
}
