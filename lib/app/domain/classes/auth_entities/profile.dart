import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';

class Profile extends Equatable {
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

  final Uint8List? photo;

  // Version-Control variables
  final int version;
  final bool isSynced;

  Profile copyWith({String? name, DateTime? birthDate, Gender? gender, Uint8List? photo, bool deletePhoto = false}) =>
      Profile(
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,

        photo: deletePhoto ? null : photo ?? this.photo,
      );

  @override
  String toString() {
    return 'name: $name}'
        '\n'
        'birthDate: $birthDate'
        '\n'
        'gender: $gender'
        '\n';
  }

  @override
  List<Object?> get props => [name, birthDate, gender.name, version, isSynced];
}
