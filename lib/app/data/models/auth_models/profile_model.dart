import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/core/constants/constants.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.birthDate,
    required super.gender,
    required super.photo,
    required super.version,
    required super.isSynced,
  });

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) {
    return ProfileModel(
      name: json['full_name'],
      birthDate: DateFormat('d/M/y').parse(json['birth_date']),
      gender: parseGender(json['gender']),
      photo: json['photo'],
      version: json['version'] ?? 0,
      isSynced: json['is_synced'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'full_name': name,
    'birth_date': DateFormat('d/M/y').format(birthDate),
    'gender': gender.val,
    'photo': photo,
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
}
