import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';

class Player extends Equatable {
  final String name, phoneNum, birthDate, uid;
  final Gender gender;

  const Player({
    required this.name,
    required this.uid,
    required this.phoneNum,
    required this.birthDate,
    required this.gender,
  });

  @override
  List<Object?> get props => [name, phoneNum, birthDate, gender];
}
