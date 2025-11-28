class Membership {
  final String planName;
  final String planId;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isNotified;
  final bool isActive;
  final bool isGift;

  const Membership({
    required this.planName,
    required this.planId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isNotified,
    required this.isActive,
    required this.isGift,
  });
}
