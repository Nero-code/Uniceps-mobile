import 'package:intl/intl.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required super.name,
    required super.birthDate,
    required super.gender,
  });

  factory PlayerModel.fromJson(Map<dynamic, dynamic> json) {
    return PlayerModel(
      name: json['full_name'],
      birthDate: DateFormat('d/M/y').parse(json['birth_date']),
      gender: parseGender(json['gender']),
    );
  }

  Map<String, dynamic> toJson() => {
        'full_name': name,
        'birth_date': DateFormat('d/M/y').format(birthDate),
        'gender': gender.val,
      };

  factory PlayerModel.fromEntity(Player p) => PlayerModel(
        name: p.name,
        birthDate: p.birthDate,
        gender: p.gender,
      );
}
