import 'package:uniceps/features/Profile/domain/entities/measrument.dart';

class MeasurementModel extends Measurement {
  const MeasurementModel(
      {required super.height,
      required super.weight,
      required super.lArm,
      required super.rArm,
      required super.lHumerus,
      required super.rHumerus,
      required super.lLeg,
      required super.rLeg,
      required super.lThigh,
      required super.rThigh,
      required super.nick,
      required super.shoulders,
      required super.waist,
      required super.chest,
      required super.hips,
      required super.checkDate});

  factory MeasurementModel.fromJson(Map<String, dynamic> json) {
    return MeasurementModel(
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
      nick: json['neck'],
      shoulders: json['shoulders'],
      waist: json['waist'],
      chest: json['chest'],
      hips: json['hips'],
      // checkDate: DateTime.parse(json['check_date']),
      checkDate: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'nick': nick,
      'shoulders': shoulders,
      'waist': waist,
      'chest': chest,
      'hips': hips,
      'check_date': checkDate,
    };
  }

  @override
  List<Object?> get props => [checkDate];
}
