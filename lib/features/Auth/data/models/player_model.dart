import 'package:uniceps/features/Auth/services/enitites/player.dart';

class PlayerModel extends Player {
  PlayerModel(
      {required super.name,
      required super.phoneNum,
      required super.birthDate,
      required super.gender});
  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        name: json['name'],
        phoneNum: json['phoneNum'],
        birthDate: json['birthDate'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNum': phoneNum,
        'birthDate': birthDate,
        'gender': gender,
      };
}
