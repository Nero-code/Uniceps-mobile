import 'package:equatable/equatable.dart';

class Gym extends Equatable {
  final String name, gymId;
  final bool isCurrent;

  const Gym({
    required this.name,
    required this.gymId,
    required this.isCurrent,
  });

  @override
  List<Object?> get props => [name, gymId];
}
