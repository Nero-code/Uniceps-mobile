import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';

class HandShakeModel extends HandShake {
  const HandShakeModel({
    // required super.id,
    required super.gymId,
    required super.playerId,
    required super.uid,
    required super.logoUrl,
    required super.createdAt,
    required super.status,
  });

  factory HandShakeModel.fromJson(Map<String, dynamic> json) => HandShakeModel(
        // id: json['id'],
        gymId: json['gym_id'],
        playerId: json['pid'],
        uid: json['uid'],
        logoUrl: json['logoUrl'],
        status: json['status'],
        createdAt: stringToDate(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'gym_id': gymId,
        'pid': playerId,
        'logoUrl': logoUrl,
        'uid': uid,
        'status': status,
        'created_at': dateToString(createdAt),
      };
}
