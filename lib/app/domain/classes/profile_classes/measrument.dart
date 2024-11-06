import 'package:equatable/equatable.dart';

class Measurement extends Equatable {
  final String id, gymId;
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

  const Measurement({
    required this.id,
    required this.gymId,
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
  });
  @override
  List<Object?> get props => [id, gymId];
}
