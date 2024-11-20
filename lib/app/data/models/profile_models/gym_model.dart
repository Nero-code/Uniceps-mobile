import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';

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
    required super.isCurrent,
    super.joinedAt,
  });
  factory GymModel.fromJson(Map<dynamic, dynamic> json, [DateTime? joinedAt]) {
    // print("GymModel Parse Algorithm");
    // print("id:         ${json['id']}");
    // print("pid:        ${json['pid'] ?? ""}");
    // print("name:       ${json['gym_name']}");
    // print("address:    ${json['address']}");
    // print("logo:       ${json['logo']}");
    // print("ownerName:  ${json['owner_name']}");
    // print("phoneNum:   ${json['phone_number']}");
    // print("telephone:  ${json['telephone']}");
    // print("start:      ${json['start'].runtimeType}");
    // print("end:        ${json['end'].runtimeType}");
    // print("created_at:        ${DateTime.parse(json['created_at'])}");
    // print(json['start'].runtimeType);
    // print(json['end'].runtimeType);
    // print("isSelected: ${json['isSelected'] ?? "null"}");
    // print("isCurrent:  ${json['isCurrent'] ?? "null"}");

    return GymModel(
      id: json['id'],
      pid: json['pid'] ?? "",
      name: json['gym_name'],
      address: json['address'],
      logo: json['logo'],
      ownerName: json['owner_name'],
      phoneNum: json['phone_number'],
      telephone: json['telephone'],
      start: json['start'] != null ? DateTime.parse(json['start']) : null,
      end: json['start'] != null ? DateTime.parse(json['end']) : null,
      isSelected: json['isSelected'] ?? false,
      isCurrent: json['isCurrent'] ?? false,
      joinedAt: joinedAt, //  DEPRECATED
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
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
      'isSelected': isSelected,
      'isCurrent': isCurrent,
    };
  }
}
