//
// Smart Day Selector Card Component with Elegant Empty State
//

import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SmartDaySelectorCard extends StatefulWidget {
  final Routine? routine;
  final int? lastCompletedDayId;
  final SessionState activeSessionState;
  final Function(RoutineDay) onStartSession;
  final Function(dynamic activeSession) onResumeSession;
  final VoidCallback onSetupRoutine;

  const SmartDaySelectorCard({
    super.key,
    required this.routine,
    this.lastCompletedDayId,
    required this.activeSessionState,
    required this.onStartSession,
    required this.onResumeSession,
    required this.onSetupRoutine,
  });

  @override
  State<SmartDaySelectorCard> createState() => _SmartDaySelectorCardState();
}

// Light Theme Palette Constants
const lightBg = Color(0xFFF6F8FA);
const cardSurface = Colors.white;
const primaryDark = Color(0xFF1E293B);
// const primaryTeal = Color(0xFF0EA5E9);
const accentMint = Color(0xFF10B981);
const textSubtle = Color(0xFF64748B);
const borderLight = Color(0xFFE2E8F0);

class _SmartDaySelectorCardState extends State<SmartDaySelectorCard> {
  int? _selectedDayId;

  @override
  void initState() {
    super.initState();
    _selectedDayId = _calculateNextDayId();
  }

  @override
  void didUpdateWidget(covariant SmartDaySelectorCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lastCompletedDayId != widget.lastCompletedDayId || oldWidget.routine?.id != widget.routine?.id) {
      setState(() {
        _selectedDayId = _calculateNextDayId();
      });
    }
  }

  int _calculateNextDayId() {
    final routine = widget.routine;
    if (routine == null) return 0;
    final days = routine.trainingDays;
    if (days.isEmpty) return 0;
    if (widget.lastCompletedDayId == null) return days.first.id ?? 0;

    final currentIndex = days.indexWhere((d) => d.id == widget.lastCompletedDayId);
    if (currentIndex == -1 || currentIndex == days.length - 1) {
      return days.first.id ?? 0;
    }
    return days[currentIndex + 1].id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primaryTeal = Theme.of(context).colorScheme.secondary;

    return widget.activeSessionState.maybeWhen(
      loaded: (s) => _ActiveSessionHeroBanner(session: s, onResume: () => widget.onResumeSession(s)),
      orElse: () {
        final routine = widget.routine;

        // Elegant "No Active Routine" Card
        if (routine == null || routine.trainingDays.isEmpty) {
          return Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            decoration: BoxDecoration(
              color: cardSurface,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: borderLight),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryDark.withValues(alpha: 0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [primaryTeal, accentMint])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [primaryTeal.withValues(alpha: 0.12), primaryTeal.withValues(alpha: 0.04)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: primaryTeal.withValues(alpha: 0.15)),
                          ),
                          child: Icon(Icons.fitness_center_rounded, color: primaryTeal, size: 26),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.noActiveRoutine,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDark,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                l10n.setupRoutineSub,
                                style: const TextStyle(fontSize: 12, color: textSubtle, height: 1.3),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: primaryTeal,
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                            onPressed: widget.onSetupRoutine,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.setUp,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.2),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_forward_rounded, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Active Routine Card
        final days = routine.trainingDays;
        final suggestedDayId = _calculateNextDayId();
        final selectedDay = days.firstWhere((d) => d.id == _selectedDayId, orElse: () => days.first);

        return Container(
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderLight),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.currentProgram,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: primaryTeal,
                          letterSpacing: 0.8,
                        ),
                      ),
                      if (selectedDay.id == suggestedDayId)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: accentMint.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.auto_awesome, size: 12, color: accentMint),
                              const SizedBox(width: 4),
                              Text(
                                l10n.suggestedNext,
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: accentMint),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Text(
                    routine.name,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryDark),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: days.map((day) {
                    final isSelected = day.id == _selectedDayId;
                    final isRecommended = day.id == suggestedDayId;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(day.name),
                            if (isRecommended) ...[
                              const SizedBox(width: 4),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(color: accentMint, shape: BoxShape.circle),
                              ),
                            ],
                          ],
                        ),
                        selected: isSelected,
                        selectedColor: primaryTeal,
                        checkmarkColor: Colors.white,
                        backgroundColor: lightBg,
                        side: BorderSide(color: isSelected ? primaryTeal : borderLight),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : primaryDark,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 13,
                        ),
                        onSelected: (_) => setState(() => _selectedDayId = day.id ?? 0),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryTeal,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
                onPressed: () => widget.onStartSession(selectedDay),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_arrow_rounded, size: 24),
                    const SizedBox(width: 6),
                    Text(
                      l10n.startDay(selectedDay.name),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Banner displayed when an active workout session is running
class _ActiveSessionHeroBanner extends StatelessWidget {
  final dynamic session;
  final VoidCallback onResume;

  const _ActiveSessionHeroBanner({required this.session, required this.onResume});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primaryTeal = Theme.of(context).colorScheme.secondary;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryTeal, Color(0xFF0284C7)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: primaryTeal.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onResume,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.activeSessionInProgress,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        session.dayName,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
