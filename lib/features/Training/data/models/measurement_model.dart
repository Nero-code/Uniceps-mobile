import 'package:equatable/equatable.dart';

class MeasurementModel extends Equatable {
  final double Height;
  final double Weight;
  final double L_Arm;
  final double R_Arm;
  final double L_Humerus;
  final double R_Humerus;
  final double L_Thigh;
  final double R_Thigh;
  final double L_Leg;
  final double R_Leg;
  final double Nick;
  final double Shoulders;
  final double Waist;
  final double Chest;
  final double Hips;
  final DateTime CheckDate;

  MeasurementModel({
    required this.Height,
    required this.Weight,
    required this.L_Arm,
    required this.R_Arm,
    required this.L_Humerus,
    required this.R_Humerus,
    required this.L_Leg,
    required this.R_Leg,
    required this.L_Thigh,
    required this.R_Thigh,
    required this.Nick,
    required this.Shoulders,
    required this.Waist,
    required this.Chest,
    required this.Hips,
    required this.CheckDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [CheckDate];
}
