import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';

class Plan {
  final String id;
  final String name;
  final List<PlanItem> items;

  Plan({
    required this.id,
    required this.name,
    required this.items,
  });
}
