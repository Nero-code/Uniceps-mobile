class Membership {
  final String planName;
  final String planId;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isNotified;
  final bool isActive;
  final bool isGift;

  bool get aboutToEnd => endDate.difference(DateTime.now()).inDays - 5 < 0;
  int get daysLeft => endDate.difference(DateTime.now()).inDays;
  int get totalDays => endDate.difference(startDate).inDays;

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
