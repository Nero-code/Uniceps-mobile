import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;

  const User({
    required this.token,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
