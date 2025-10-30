import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';

class Plan {
  final int id;
  final String name;
  final String description;
  final List<String> features;
  final List<PlanItem> items;

  Plan({
    required this.id,
    required this.name,
    required this.description,
    required this.features,
    required this.items,
  });
}
