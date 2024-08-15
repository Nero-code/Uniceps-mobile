import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required super.uid,
    required super.name,
    required super.phoneNum,
    required super.birthDate,
    required super.gender,
  });
  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        uid: json['uid'] ?? "",
        name: json['full_name'],
        phoneNum: json['phone'],
        birthDate: json['birth_date'],
        gender: json['gender_male'] == "True" ? Gender.male : Gender.female,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'full_name': name,
        'phone': phoneNum,
        'birth_date': birthDate,
        'gender_male': gender == Gender.male ? "True" : "False",
      };
}
