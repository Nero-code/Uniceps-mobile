import 'package:uniceps/core/constants/constants.dart';

class Player {
  const Player({required this.name, required this.birthDate, required this.gender, this.photo});

  final String name;
  final DateTime birthDate;
  final Gender gender;

  final String? photo;
}
