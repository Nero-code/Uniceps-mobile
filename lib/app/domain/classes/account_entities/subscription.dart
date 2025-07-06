import 'package:uniceps/app/domain/classes/account_entities/permission.dart';

class Subscription {
  final String planName;
  final String planId;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isGift;

  final List<Permission> permits;

  const Subscription({
    required this.planName,
    required this.planId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isGift,
    required this.permits,
  });
}
