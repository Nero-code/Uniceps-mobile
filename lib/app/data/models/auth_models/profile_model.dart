import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/core/constants/constants.dart';

// "id":"10c01132-5059-f111-bfa4-00155d936e08",
// "name":null,
// "phone":null,
// "dateOfBirth":"0001-01-01T00:00:00",
// "gender":1,
// "pictureUrl":null,
// "ownerName":null,
// "address":null

class ProfileModel {
  final String name;
  final DateTime birthDate;
  final Gender gender;

  final Uint8List? photo;

  // Version-Control variables
  final int version;
  final bool isSynced;

  const ProfileModel({
    required this.name,
    required this.birthDate,
    required this.gender,
    this.photo,
    required this.version,
    required this.isSynced,
  });

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) {
    return ProfileModel(
      name: json['full_name'],
      birthDate: DateFormat('d/M/y').parse(json['birth_date']),
      gender: parseGender(json['gender']),
      // photo: json['photo'],
      version: json['version'] ?? 0,
      isSynced: json['is_synced'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name': name,
    'birth_date': DateFormat('d/M/y').format(birthDate),
    'gender': gender.val,
    // 'photo': photo,
    'version': version,
    'is_synced': isSynced,
  };

  factory ProfileModel.fromEntity(Profile p) => ProfileModel(
    name: p.name,
    birthDate: p.birthDate,
    gender: p.gender,
    photo: p.photo,
    version: p.version,
    isSynced: p.isSynced,
  );
  Profile toEntity() =>
      Profile(name: name, birthDate: birthDate, gender: gender, photo: photo, isSynced: isSynced, version: version);

  ProfileModel copyWith({
    String? name,
    DateTime? birthDate,
    Gender? gender,
    Uint8List? photo,
    bool deletePhoto = false,
    int? version,
    bool? isSynced,
  }) => ProfileModel(
    name: name ?? this.name,
    birthDate: birthDate ?? this.birthDate,
    gender: gender ?? this.gender,
    photo: deletePhoto ? null : photo ?? this.photo,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
  );
}
