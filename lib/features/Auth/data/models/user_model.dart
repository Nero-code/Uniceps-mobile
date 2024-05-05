import 'package:uniceps/features/Auth/services/enitites/user.dart';

class UserModel extends User {
  const UserModel({
    required super.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(token: json["token"]);

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
