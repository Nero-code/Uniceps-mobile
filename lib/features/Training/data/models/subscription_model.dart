import 'package:equatable/equatable.dart';
import 'package:uniceps/features/Training/services/entities/subscription.dart';

class SubscriptionModel extends Subscription {
  SubscriptionModel(
      {required super.id, required super.description, required super.payments});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      description: json['description'],
      payments: json['payments'],
    );
  }

  @override
  List<Object?> get props => [id];
}

class Payment {
  final String id;
  final DateTime payDate;
  final int value;

  Payment({
    required this.id,
    required this.value,
    required this.payDate,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
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
}
