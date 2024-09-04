import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';

// {
//             "id": 123,
//             "pid": 123456789,
//             "gym_id": 18,
//             "sport_name": "Body building",
//             "trainer_name": "yazan ash",
//             "start_date": "15/08/2024",
//             "end_date": "15/09/2024",
//             "price": "30000",
//             "discount_value": "0",
//             "discount_des": "",
//             "is_paid": "True",
//             "paid_value": "30000",
//             "payments": []
// }

class SubscriptionModel extends Subscription {
  const SubscriptionModel({
    required super.id,
    required super.payments,
    required super.pId,
    required super.sportName,
    required super.gymId,
    required super.trainerName,
    required super.discountDes,
    required super.isPaid,
    required super.price,
    required super.paidValue,
    required super.discountVal,
    required super.startDate,
    required super.endDate,
  });

  factory SubscriptionModel.fromJson(
      Map<dynamic, dynamic> json, List<Payment>? payments) {
    json.forEach(
      (key, value) => print("$key: $value"),
    );

    return SubscriptionModel(
      id: json['id'].toString(),
      pId: json['pId'].toString(),
      gymId: json['gymId'].toString(),
      sportName: json['sportName'],
      trainerName: json['trainerName'],
      discountDes: json['discountDes'],
      isPaid: json['isPaid'],
      price: json['price'],
      paidValue: json['paidValue'],
      discountVal: json['discountVal'],
      startDate: stringToDate(json['startDate']),
      endDate: stringToDate(json['endDate']),
      payments: payments,
    );
  }

  Map<String, dynamic> toJson() {
    final pays = <Map<dynamic, dynamic>>[];
    if (payments != null) {
      for (var i in payments as List<Payment>) {
        pays.add(i.toJson());
      }
    }
    return {
      "id": id,
      "pid": pid,
      "gym_id": gymId,
      "sport_name": sportName,
      "trainer_name": trainerName,
      "start_date": dateToString(startDate),
      "end_date": dateToString(endDate),
      "price": price,
      "discount_value": discountVal,
      "discount_des": discountDes,
      "is_paid": isPaid,
      "paid_value": paidValue,
      "payments": pays,
    };
  }

  @override
  List<Object?> get props => [id];
}

class Payment extends Equatable {
  final String id, plId, sId, gymId;
  final DateTime payDate;
  final int value;

  const Payment({
    required this.id,
    required this.plId,
    required this.sId,
    required this.gymId,
    required this.value,
    required this.payDate,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      plId: json['pid'],
      sId: json['sid'],
      gymId: json['gym_id'],
      value: json['value'],
      payDate: json['payDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'payDate': payDate,
    };
  }

  @override
  List<Object?> get props => [id];
}
