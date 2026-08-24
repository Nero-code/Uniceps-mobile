import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SecondaryActionsBar extends StatelessWidget {
  final VoidCallback onAnalytics;
  final VoidCallback onMeasurements;
  final VoidCallback onRoutineManager;

  const SecondaryActionsBar({
    super.key,
    required this.onAnalytics,
    required this.onMeasurements,
    required this.onRoutineManager,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final membership = context.watch<MembershipBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _ActionChip(
              icon: Icons.analytics_outlined,
              label: l10n.scrTitlePerformance,
              isLocked: membership.maybeWhen(orElse: () => true, loaded: (m) => false),
              onTap: membership.maybeWhen(orElse: () => null, loaded: (m) => onAnalytics),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ActionChip(icon: Icons.straighten_outlined, label: l10n.measurements, onTap: onMeasurements),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ActionChip(
              icon: Icons.event_note_outlined,
              label: l10n.scrTitleMyRoutines,
              onTap: onRoutineManager,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isLocked;

  const _ActionChip({required this.icon, required this.label, this.onTap, this.isLocked = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: AppColors.primaryTeal, size: 20),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryDark),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLocked)
          Positioned.directional(
            textDirection: Directionality.of(context),
            child: Container(
              decoration: BoxDecoration(shape: .circle, color: Colors.amber),
              padding: .all(4.0),
              child: const Image(image: AssetImage(IMG_PREMIUM), width: 15, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
