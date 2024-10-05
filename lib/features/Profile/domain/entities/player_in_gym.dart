import 'package:equatable/equatable.dart';

class PlayerInGym extends Equatable {
  final String gymId;
  final double balance;
  final int subs;

  const PlayerInGym(
      {required this.gymId, required this.balance, required this.subs});

  factory PlayerInGym.fromJson(Map<dynamic, dynamic> json) {
    return PlayerInGym(
      gymId: json['gymId'],
      balance: json['balance'],
      subs: json['subs'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'gymId': gymId,
      'balance': balance,
      'subs': subs,
    };
  }

  @override
  List<Object?> get props => [gymId];
}
