import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id, token, email;
  final String? notifyToken;

  const User({
    required this.id,
    required this.token,
    required this.email,
    this.notifyToken,
  });
  @override
  List<Object?> get props => [token];
}
