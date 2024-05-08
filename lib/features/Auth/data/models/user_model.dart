import 'package:uniceps/features/Auth/services/enitites/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(token: json["token"], id: json['id']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
