import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';

class MeasurementModel extends Measurement {
  const MeasurementModel({
    required super.id,
    required super.gymId,
    required super.height,
    required super.weight,
    required super.lArm,
    required super.rArm,
    required super.lHumerus,
    required super.rHumerus,
    required super.lLeg,
    required super.rLeg,
    required super.lThigh,
    required super.rThigh,
    required super.neck,
    required super.shoulders,
    required super.waist,
    required super.chest,
    required super.hips,
    required super.checkDate,
  });

  factory MeasurementModel.fromJson(Map<dynamic, dynamic> json) {
    print("Measurement: \n$json");

    // print("height:    ${json['height'].runtimeType}");
    // print("weight:    ${json['weight'].runtimeType}");
    // print("lArm:      ${json['l_arm'].runtimeType}");
    // print("rArm:      ${json['r_arm'].runtimeType}");
    // print("lHumerus:  ${json['l_humerus'].runtimeType}");
    // print("rHumerus:  ${json['r_humerus'].runtimeType}");
    // print("lLeg:      ${json['l_leg'].runtimeType}");
    // print("rLeg:      ${json['r_leg'].runtimeType}");
    // print("lThigh:    ${json['l_thigh'].runtimeType}");
    // print("rThigh:    ${json['r_thigh'].runtimeType}");
    // print("neck:      ${json['neck'].runtimeType}");
    // print("shoulders: ${json['shoulders'].runtimeType}");
    // print("waist:     ${json['waist'].runtimeType}");
    // print("chest:     ${json['chest'].runtimeType}");
    // print("hips:      ${json['hips'].runtimeType}");
    // print("checkDate: ${json['check_date'].runtimeType}");

    return MeasurementModel(
      id: json['id'],
      gymId: json['gym_id'],
      height: json['height'],
      weight: json['weight'],
      lArm: json['l_arm'],
      rArm: json['r_arm'],
      lHumerus: json['l_humerus'],
      rHumerus: json['r_humerus'],
      lLeg: json['l_leg'],
      rLeg: json['r_leg'],
      lThigh: json['l_thigh'],
      rThigh: json['r_thigh'],
      neck: json['neck'],
      shoulders: json['shoulders'],
      waist: json['waist'],
      chest: json['chest'],
      hips: json['hips'],
      checkDate: stringToDate(json['check_date']),
      // checkDate: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gym_id': gymId,
      'height': height,
      'weight': weight,
      'l_arm': lArm,
      'r_arm': rArm,
      'l_humerus': lHumerus,
      'r_humerus': rHumerus,
      'l_leg': lLeg,
      'r_leg': rLeg,
      'l_thigh': lThigh,
      'r_thigh': rThigh,
      'neck': neck,
      'shoulders': shoulders,
      'waist': waist,
      'chest': chest,
      'hips': hips,
      'check_date': dateToString(checkDate),
    };
  }

  @override
  List<Object?> get props => [id, gymId, checkDate];
}
