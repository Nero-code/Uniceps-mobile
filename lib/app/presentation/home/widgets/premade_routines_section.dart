// Premade Routines Horizontal Section
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class PremadeRoutinesSection extends StatelessWidget {
  final ValueChanged<Routine> onSelectRoutine;

  const PremadeRoutinesSection({super.key, required this.onSelectRoutine});

  List<Routine> _getPremadeRoutines() {
    return [
      _buildRoutineSchema("Circular Fullbody", "High intensity circuit targeting all major muscle groups.", 3),
      _buildRoutineSchema("Push / Pull / Legs", "Classic 3-day split focused on strength hypertrophy.", 6),
      _buildRoutineSchema("Upper / Lower Power", "4-day strength split prioritizing compound movements.", 4),
      _buildRoutineSchema("Core & Conditioning", "Bodyweight endurance and abdominal stability focus.", 2),
    ];
  }

  static Routine _buildRoutineSchema(String name, String desc, int daysCount) {
    return Routine(
      id: null,
      apiId: null,
      description: desc,
      version: 0,
      isSynced: false,
      name: name,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      trainingDays: List.generate(
        daysCount,
        (i) => RoutineDay(
          id: null,
          apiId: null,
          routineId: 0,
          name: "Day ${i + 1}",
          index: i,
          exercises: const [],
          version: 0,
          isSynced: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routines = _getPremadeRoutines();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Premade Routines',
                style: TextStyle(color: AppColors.primaryDark, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(color: AppColors.primaryTeal, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: routines.length,
            itemBuilder: (context, index) {
              final item = routines[index];
              return Container(
                width: 220,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2)),
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => onSelectRoutine(item),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryTeal.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.fitness_center_rounded, color: AppColors.primaryTeal, size: 18),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryDark,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.description ?? '',
                          style: const TextStyle(color: AppColors.textSubtle, fontSize: 11),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textSubtle),
                            const SizedBox(width: 4),
                            Text(
                              '${item.trainingDays.length} Training Days',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTeal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
