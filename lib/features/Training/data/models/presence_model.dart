import 'package:uniceps/features/Training/services/entities/presence.dart';

class PresenceModel extends Presence {
  const PresenceModel({
    required super.gymId,
    required super.day,
    required super.enteredAt,
    required super.exitedAt,
  });

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
      gymId: json['gymId'],
      day: DateTime.parse(json['day']),
      enteredAt: DateTime.parse(json['enteredAt']),
      exitedAt: DateTime.parse(json['exitedAt']),
    );
  }

  Map<String, String> toJson() {
    return {
      "gymId": gymId,
      "day": day.toIso8601String(),
      "enteredAt": enteredAt.toIso8601String(),
      "exitedAt": exitedAt.toIso8601String(),
    };
  }
}
