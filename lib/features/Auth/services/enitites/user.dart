import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email, password;
  final bool isLoggedIn;

  User({
    required this.email,
    required this.password,
    required this.isLoggedIn,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
