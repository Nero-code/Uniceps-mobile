import 'package:uniceps/core/constants/constants.dart';

class Profile {
  const Profile({
    required this.name,
    required this.birthDate,
    required this.gender,
    this.photo,
    this.version = 0,
    this.isSynced = false,
  });

  final String name;
  final DateTime birthDate;
  final Gender gender;

  final String? photo;

  // Version-Control variables
  final int version;
  final bool isSynced;
}
