import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class Measurement extends Equatable {
  static const images = [
    MusclesImages.height,
    MusclesImages.weight,
    MusclesImages.neck,
    MusclesImages.shoulder,
    MusclesImages.chest,
    MusclesImages.waist,
    MusclesImages.rArm,
    MusclesImages.lArm,
    MusclesImages.rThigh,
    MusclesImages.lThigh,
    MusclesImages.rLeg,
    MusclesImages.lLeg,
    MusclesImages.hips,
  ];

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
  }) => Measurement(
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

  Measurement difference(Measurement other) => Measurement(
    height: height - other.height,
    weight: weight - other.weight,
    lArm: lArm - other.lArm,
    rArm: rArm - other.rArm,
    lHumerus: lHumerus - other.lHumerus,
    rHumerus: rHumerus - other.rHumerus,
    lLeg: lLeg - other.lLeg,
    rLeg: rLeg - other.rLeg,
    lThigh: lThigh - other.lThigh,
    rThigh: rThigh - other.rThigh,
    neck: neck - other.neck,
    shoulders: shoulders - other.shoulders,
    waist: waist - other.waist,
    chest: chest - other.chest,
    hips: hips - other.hips,
    checkDate: DateTime.now(),
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

  static String muscleNameMapper(int index, AppLocalizations l) {
    switch (index) {
      case 0:
        return l.height;
      case 1:
        return l.weight;
      case 2:
        return l.nick;
      case 3:
        return l.shoulders;
      case 4:
        return l.chest;
      case 5:
        return l.waist;
      case 6:
        return l.lArm;
      case 7:
        return l.rArm;
      case 8:
        return l.lThigh;
      case 9:
        return l.rThigh;
      case 10:
        return l.lLeg;
      case 11:
        return l.rLeg;
      case 12:
        return l.hips;
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [id];
}
