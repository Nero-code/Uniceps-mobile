import 'package:uniceps/features/Training/services/entities/avatar.dart';

class AvatarModel extends Avatar {
  const AvatarModel({
    required super.level,
    required super.percentage,
    required super.playerName,
    super.gymLogo,
    // super.completedToday,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<int>> temp = {};
    if (json.containsKey('completedToday') &&
        (json['completedToday'] as Map<String, dynamic>).isNotEmpty) {
      Map<String, dynamic> a = json['completedToday'];
      a.forEach((key, value) {
        temp.addAll({key: value as List<int>});
      });
    }
    return AvatarModel(
      level: json['level'],
      percentage: json['percentage'],
      playerName: json['player_name'],
      gymLogo: json['gym_logo'],
      // completedToday: temp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "level": level,
      "percentage": percentage,
      "playerName": playerName,
      "gymLogo": gymLogo,
    };
  }
}
