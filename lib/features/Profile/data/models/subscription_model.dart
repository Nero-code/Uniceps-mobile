import 'package:equatable/equatable.dart';
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
    super.discountDes,
    required super.isPaid,
    required super.price,
    required super.paidValue,
    required super.discountVal,
    required super.startDate,
    required super.endDate,
  });

  factory SubscriptionModel.fromJson(Map<dynamic, dynamic> temp) {
    print(
        "------------------------Subrcribtions--------------------------------");
    print(temp['id'].runtimeType);
    print(temp['pid'].runtimeType);
    print(temp['gym_id'].runtimeType);
    final payments = <Payment>[];
    final json = Map<String, dynamic>.from(temp);
    for (var i in json['payments']) {
      final e = Map<String, dynamic>.from(i);
      payments.add(Payment.fromJson(e));
    }

    return SubscriptionModel(
      id: json['id'],
      pId: json['pid'],
      gymId: json['gym_id'],
      sportName: json['sport_name'],
      trainerName: json['trainer_name'],
      discountDes: json['discount_des'],
      isPaid: json['is_paid'] == "True",
      price: json['price'],
      paidValue: json['paid_value'],
      discountVal: json['discount_value'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      payments: payments,
    );
  }

  Map<String, dynamic> toJson() {
    final pays = <Map<String, dynamic>>[];
    if (payments != null) {
      for (var i in payments as List<Payment>) {
        pays.add(i.toJson());
      }
    }
    return {
      "id": id,
      "pid": pId,
      "gym_id": gymId,
      "sport_name": sportName,
      "trainer_name": trainerName,
      "start_date": startDate.toIso8601String(),
      "end_date": endDate.toIso8601String(),
      "price": price,
      "discount_value": discountVal,
      "discount_des": discountDes,
      "is_paid": isPaid ? "True" : "False",
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
  final double value;

  const Payment({
    required this.id,
    required this.plId,
    required this.sId,
    required this.gymId,
    required this.value,
    required this.payDate,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    print("------------------------Payments--------------------------------");
    json.forEach(
      (key, value) => print("$key : ${value.runtimeType}"),
    );
    return Payment(
      id: json['id'],
      plId: json['pid'],
      sId: json['sid'],
      gymId: json['gym_id'],
      value: json['value'],
      payDate: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pid': plId,
      'sid': sId,
      'gym_id': gymId,
      'value': value,
      'date': payDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id];
}
