class PlanItem {
  final int id;
  final double price;
  final String durationString;
  final int daysCount;
  final bool isFree;

  PlanItem({
    required this.id,
    required this.price,
    required this.durationString,
    required this.daysCount,
    required this.isFree,
  });
}
