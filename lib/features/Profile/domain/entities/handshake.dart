import 'package:equatable/equatable.dart';

class HandShake extends Equatable {
  final String gymId, playerId, uid;
  final String? logoUrl;
  final DateTime createdAt;
  final bool status;

  const HandShake({
    required this.gymId,
    required this.playerId,
    required this.uid,
    required this.logoUrl,
    required this.createdAt,
    required this.status,
  });

  @override
  List<Object?> get props => [gymId, playerId, uid];
}
