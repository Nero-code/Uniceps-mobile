import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email, password;
  User({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => throw [email];
}
