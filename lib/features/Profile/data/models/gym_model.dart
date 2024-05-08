import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class GymModel extends Gym {
  const GymModel(
      {required super.name, required super.gymId, required super.isCurrent});
  factory GymModel.fromJson(Map<String, dynamic> json) {
    return GymModel(
        name: json['name'], gymId: json['gymId'], isCurrent: json['isCurrent']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gymId": gymId,
      "isCurrent": isCurrent,
    };
  }
}
