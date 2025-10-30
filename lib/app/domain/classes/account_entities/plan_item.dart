class PlanItem {
  final int id;
  final int planId;
  final String price;
  final String displayName;
  final String daysCount;
  final bool isFree;

  PlanItem({
    required this.id,
    required this.planId,
    required this.price,
    required this.displayName,
    required this.daysCount,
    required this.isFree,
  });
}
