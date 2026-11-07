import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/helpers/access_control_dialogs.dart';
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
              icon: Icons.ssid_chart,
              label: l10n.scrTitlePerformance,
              isLocked: membership.maybeWhen(orElse: () => true, loaded: (m) => false),
              onTap: membership.maybeWhen(
                orElse: () =>
                    () => showPremiumDialog(context),
                loaded: (m) => onAnalytics,
              ),
              iconColor: Colors.amber,
              // onTap: onAnalytics,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ActionChip(
              icon: Icons.straighten,
              label: l10n.measurements,
              onTap: onMeasurements,
              iconColor: Colors.red,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ActionChip(
              icon: Icons.pending_actions,
              label: l10n.scrTitleMyRoutines,
              onTap: onRoutineManager,
              // iconColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final VoidCallback? onTap;
  final bool isLocked;

  const _ActionChip({required this.icon, required this.label, this.onTap, this.isLocked = false, this.iconColor});

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
                    Material(
                      shape: const CircleBorder(),
                      color: (iconColor ?? AppColors.primaryTeal).withValues(alpha: .1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(icon, color: iconColor ?? AppColors.primaryTeal, size: 25),
                      ),
                    ),
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
              decoration: const BoxDecoration(shape: .circle, color: Colors.amber),
              padding: const .all(4.0),
              child: const Image(image: AssetImage(IMG_PREMIUM), width: 15, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
