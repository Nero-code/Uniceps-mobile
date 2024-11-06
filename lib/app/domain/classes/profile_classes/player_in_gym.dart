import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';

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
    // print("gymId:     ${json['gym_id']}");
    // print("balance:   ${json['balance']}");
    // print("startDate: ${json['subs_date'].runtimeType}");

    return PlayerInGym(
      gymId: json['gym_id'],
      balance: json['balance'],
      startDate: stringToDate("${json['subs_date']}"),
      // startDate: DateFormat("dd/MM/yyyy").parse(json['subs_date']),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'gym_id': gymId,
      'balance': balance,
      'subs_date': dateToString(startDate),
    };
  }

  @override
  List<Object?> get props => [gymId];
}
