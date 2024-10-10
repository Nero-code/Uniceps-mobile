import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class PlayerInGym extends Equatable {
  final String gymId;
  final double balance;
  final DateTime startDate;
  // final int subs;

  const PlayerInGym({
    required this.gymId,
    required this.balance,
    required this.startDate,
  });

  factory PlayerInGym.fromJson(Map<dynamic, dynamic> json) {
    return PlayerInGym(
      gymId: json['gym_id'],
      balance: json['balance'],
      startDate: DateFormat("dd/MM/yyyy").parse(json['subs_date']),
      // subs: json['subs'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'gym_id': gymId,
      'balance': balance,
      'subs_date': startDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [gymId];
}
