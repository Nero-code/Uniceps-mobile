import 'package:uniceps/app/Auth/services/enitites/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.token,
    required super.email,
    super.notifyToken,
  });
  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json['id'].toString(),
        token: json['token'].toString(),
        email: json['email'],
        notifyToken: json['notify'],
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'email': email,
      'notify': notifyToken,
    };
  }
}
