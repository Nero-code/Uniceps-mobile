// Premade Routines Horizontal Section
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/premade_routine.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PremadeRoutinesSection extends StatelessWidget {
  final ValueChanged<PremadeRoutine> onSelectRoutine;
  final List<PremadeRoutine> routines;
  const PremadeRoutinesSection({super.key, required this.onSelectRoutine, required this.routines});

  Widget _switchGenderIcon(Gender gender) {
    const iconSize = 15.0;
    switch (gender) {
      case Gender.both:
        return const Icon(Icons.transgender, size: iconSize);
      case Gender.male:
        return const Icon(Icons.male, size: iconSize, color: Colors.blue);
      case Gender.female:
        return const Icon(Icons.female, size: iconSize, color: Colors.pink);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.explorePremadeRoutines,
                style: const TextStyle(color: AppColors.primaryDark, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                // l10n.seeAll,
                '',
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
                    BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 2)),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
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
                                  color: AppColors.primaryTeal.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.fitness_center_rounded, color: AppColors.primaryTeal, size: 18),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDark,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.description,
                            style: const TextStyle(color: AppColors.textSubtle, fontSize: 11),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textSubtle),
                                  const SizedBox(width: 4),
                                  Text(
                                    l10n.trainingDaysCount(item.daysCount),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryTeal,
                                    ),
                                  ),
                                ],
                              ),
                              _switchGenderIcon(item.targetGender),
                            ],
                          ),
                        ],
                      ),
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

class PremadeRoutinesError extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;

  const PremadeRoutinesError({super.key, required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryTeal.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryTeal.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.primaryTeal, size: 32),
          const SizedBox(height: 12),
          Text(
            message ?? l10n.errLoadPremadeRoutines,
            style: const TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(l10n.tryAgain),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryTeal,
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class PremadeRoutinesSkeleton extends StatelessWidget {
  const PremadeRoutinesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Skeleton Title
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Container(
            width: 150,
            height: 18,
            decoration: BoxDecoration(color: AppColors.borderLight, borderRadius: BorderRadius.circular(4)),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 220,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.borderLight.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 100,
                            height: 14,
                            decoration: BoxDecoration(
                              color: AppColors.borderLight.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 150,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 80,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
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
