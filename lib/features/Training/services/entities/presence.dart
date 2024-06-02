import 'package:equatable/equatable.dart';

class Presence extends Equatable {
  final DateTime enteredAt, exitedAt, day;
  final String gymId;

  const Presence({
    required this.gymId,
    required this.day,
    required this.enteredAt,
    required this.exitedAt,
  });

  @override
  List<Object?> get props => [day];
}
