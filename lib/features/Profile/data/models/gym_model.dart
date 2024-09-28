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
    required super.pid,
    required super.address,
    required super.logo,
    required super.ownerName,
    required super.phoneNum,
    required super.telephone,
    required super.start,
    required super.end,
    required super.isSelected,
    super.joinedAt,
  });
  factory GymModel.fromJson(Map<dynamic, dynamic> json, [DateTime? joinedAt]) {
    print("GymModel Parse Algorithm");
    print("id:         ${json['id']}");
    print("pid:        ${json['pid'] ?? ""}");
    print("name:       ${json['gym_name']}");
    print("address:    ${json['address']}");
    print("logo:       ${json['logo']}");
    print("ownerName:  ${json['owner_name']}");
    print("phoneNum:   ${json['phone_number']}");
    print("telephone:  ${json['telephone']}");
    print("start:      ${json['start'] ?? ""}");
    print("end:        ${json['end'] ?? ""}");
    print("isSelected: ${json['isSelected'] ?? false}");

    return GymModel(
      id: json['id'],
      pid: json['pid'] ?? "",
      name: json['gym_name'],
      address: json['address'],
      logo: json['logo'],
      ownerName: json['owner_name'],
      phoneNum: json['phone_number'],
      telephone: json['telephone'],
      start: json['start'] ?? "",
      end: json['end'] ?? "",
      isSelected: json['isSelected'] ?? false,
      joinedAt: joinedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "pid": pid,
      "gym_name": name,
      "address": address,
      "logo": logo,
      "owner_name": ownerName,
      "phone_number": phoneNum,
      "telephone": telephone,
      'start': start,
      'end': end,
      'isSelected': isSelected,
    };
  }
}
