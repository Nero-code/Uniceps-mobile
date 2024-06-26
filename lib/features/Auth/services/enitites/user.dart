import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token, id;

  const User({
    required this.id,
    required this.token,
  });
  @override
  List<Object?> get props => [token];
}
