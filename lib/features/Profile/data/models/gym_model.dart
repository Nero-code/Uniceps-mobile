import 'package:uniceps/features/Profile/domain/entities/gym.dart';

//         "address": "swaida , syria ",
//         "gym_name": "Unicepse Gym",
//         "id": "66bdd431f93dffa35e2a1a21",
//         "logo": "https://trio.com",
//         "owner_name": "TrioVerse",
//         "phone_number": "+9639949196917",
//         "telephone": "+96316240131"

class GymModel extends Gym {
  const GymModel({
    required super.name,
    required super.id,
    required super.address,
    required super.logo,
    required super.ownerName,
    required super.phoneNum,
    required super.telephone,
    super.joinedAt,
  });
  factory GymModel.fromJson(Map<dynamic, dynamic> json, [DateTime? joinedAt]) {
    return GymModel(
      id: json['id'],
      name: json['gym_name'],
      address: json['address'],
      logo: json['logo'],
      ownerName: json['owner_name'],
      phoneNum: json['phone_number'],
      telephone: json['telephone'],
      joinedAt: joinedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "gym_name": name,
      "address": address,
      "logo": logo,
      "owner_name": ownerName,
      "phone_number": phoneNum,
      "telephone": telephone,
    };
  }
}
