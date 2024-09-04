import 'package:equatable/equatable.dart';

class Gym extends Equatable {
  final String name, id, address, logo, ownerName, phoneNum, telephone;
  final DateTime? joinedAt;

  const Gym({
    required this.id,
    required this.name,
    required this.address,
    required this.logo,
    required this.ownerName,
    required this.phoneNum,
    required this.telephone,
    required this.joinedAt,
  });

  @override
  List<Object?> get props => [id, name];
}
