import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/ingredients/ingredients_bloc.dart';
import 'package:uniceps/app/presentation/diet_logger/screens/ingredients_screen.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietSummaryCard extends StatelessWidget {
  final List<DietLog> logs;
  final double calorieGoal;

  const DietSummaryCard({super.key, required this.logs, this.calorieGoal = 0});

  @override
  Widget build(BuildContext context) {
    final totalCalories = logs.fold(0.0, (sum, item) => sum + item.calories);
    final totalProtein = logs.fold(0.0, (sum, item) => sum + item.protein);
    final totalCarbs = logs.fold(0.0, (sum, item) => sum + item.carbs);
    final totalFats = logs.fold(0.0, (sum, item) => sum + item.fats);

    final remaining = calorieGoal != 0 ? calorieGoal - totalCalories : 0.0;
    final progress = calorieGoal != 0 ? (totalCalories / calorieGoal).clamp(0.0, 1.0) : 0.0;

    final now = DateTime.now();
    final dateStr = '${now.day}/${now.month}/${now.year}';

    final locale = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [mainBlueLight, secondaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 9,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
              Text(
                locale.todaySummary,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(dateStr, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              Material(
                color: Colors.black12,
                shape: const CircleBorder(),
                child: InkWell(
                  borderRadius: .circular(50),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          BlocProvider.value(value: context.read<IngredientsBloc>(), child: const IngredientsScreen()),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.fastfood, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(locale.caloriesGoal, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                    Text(
                      calorieGoal != 0
                          ? '${totalCalories.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} ${locale.kcal}'
                          : '${totalCalories.toStringAsFixed(0)} ${locale.kcal}',
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    remaining >= 0
                        ? '${remaining.toStringAsFixed(0)} ${locale.left}'
                        : '${(-remaining).toStringAsFixed(0)} ${locale.over}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                return LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  color: remaining >= 0 ? color5 : Colors.lightGreen,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                );
              },
            ),
            const Divider(color: Colors.white24, height: 20),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummaryItem(label: locale.protein, value: totalProtein.toStringAsFixed(1), unit: locale.grams),
              SummaryItem(label: locale.carbs, value: totalCarbs.toStringAsFixed(1), unit: locale.grams),
              SummaryItem(label: locale.fats, value: totalFats.toStringAsFixed(1), unit: locale.grams),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const SummaryItem({super.key, required this.label, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(unit, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }
}
