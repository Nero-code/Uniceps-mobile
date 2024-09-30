import 'package:equatable/equatable.dart';

class Gym extends Equatable {
  final String name,
      id,
      pid,
      address,
      logo,
      ownerName,
      phoneNum,
      telephone,
      start,
      end;
  final DateTime? joinedAt;
  final bool isSelected, isCurrent;

  const Gym({
    required this.id,
    required this.pid,
    required this.name,
    required this.address,
    required this.logo,
    required this.ownerName,
    required this.phoneNum,
    required this.telephone,
    required this.joinedAt,
    required this.start,
    required this.end,
    this.isSelected = false,
    this.isCurrent = false,
  });

  @override
  List<Object?> get props => [id, name];
}
