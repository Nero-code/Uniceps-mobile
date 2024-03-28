import 'package:uniceps/features/Profile/domain/measrument.dart';

class MeasurementModel extends Measurement {
  MeasurementModel({
    required super.Height,
    required super.Weight,
    required super.L_Arm,
    required super.R_Arm,
    required super.L_Humerus,
    required super.R_Humerus,
    required super.L_Leg,
    required super.R_Leg,
    required super.L_Thigh,
    required super.R_Thigh,
    required super.Nick,
    required super.Shoulders,
    required super.Waist,
    required super.Chest,
    required super.Hips,
    required super.CheckDate,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) {
    return MeasurementModel(
      Height: json['Height'],
      Weight: json['Weight'],
      L_Arm: json['L_Arm'],
      R_Arm: json['R_Arm'],
      L_Humerus: json['L_Humerus'],
      R_Humerus: json['R_Humerus'],
      L_Leg: json['L_Leg'],
      R_Leg: json['R_Leg'],
      L_Thigh: json['L_Thigh'],
      R_Thigh: json['R_Thigh'],
      Nick: json['Nick'],
      Shoulders: json['Shoulders'],
      Waist: json['Waist'],
      Chest: json['Chest'],
      Hips: json['Hips'],
      CheckDate: json['CheckDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Height': Height,
      'Weight': Weight,
      'L_Arm': L_Arm,
      'R_Arm': R_Arm,
      'L_Humerus': L_Humerus,
      'R_Humerus': R_Humerus,
      'L_Leg': L_Leg,
      'R_Leg': R_Leg,
      'L_Thigh': L_Thigh,
      'R_Thigh': R_Thigh,
      'Nick': Nick,
      'Shoulders': Shoulders,
      'Waist': Waist,
      'Chest': Chest,
      'Hips': Hips,
      'CheckDate': CheckDate,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [CheckDate];
}
