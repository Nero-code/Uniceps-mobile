import 'package:uniceps/features/Auth/services/enitites/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.token,
  });
  factory UserModel.fromJson(Map<dynamic, dynamic> json) =>
      UserModel(token: json['token'].toString(), id: json['id'].toString());

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'token': token,
    };
  }
}
