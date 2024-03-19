import 'package:uniceps/features/Auth/services/enitites/user.dart';

class UserModel extends User {
  UserModel({required super.email, required super.password});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(email: json['email'], password: json['password']);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
