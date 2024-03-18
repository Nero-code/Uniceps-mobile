import 'package:equatable/equatable.dart';

class SubscriptionModel extends Equatable {
  final String id, sportName;
  final DateTime? startDate, endDate;
  final List<Payment> payments;

  SubscriptionModel({
    required this.id,
    required this.sportName,
    required this.payments,
    this.startDate,
    this.endDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class Payment {
  final String id;
  final int value;

  Payment({
    required this.id,
    required this.value,
  });
}
