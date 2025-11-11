import 'package:uniceps/core/constants/constants.dart';

class Player {
  final String name;
  final DateTime birthDate;
  final Gender gender;

  const Player({
    required this.name,
    required this.birthDate,
    required this.gender,
  });
}
