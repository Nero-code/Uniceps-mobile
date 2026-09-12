import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class BodyMeasurementMap extends StatelessWidget {
  const BodyMeasurementMap({super.key, required this.measurement, required this.onSelectPart});

  final Measurement measurement;
  final Function(String title, double currentValue, String key) onSelectPart;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        // We use AspectRatio to ensure the Stack is always the same shape as the image.
        // This makes percentage-based positioning pixel-locked across all devices.
        // Assuming a standard human silhouette asset ratio.
        return Center(
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Stack(
              children: [
                // Base Silhouette
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.85,
                    child: Image.asset('images/muscle-groups/Silhouette.png', fit: BoxFit.contain),
                  ),
                ),

                // Hotspots
                BodyAnchor(
                  top: 0.13,
                  left: 0.5,
                  label: locale.nick,
                  value: measurement.neck,
                  onTap: () => onSelectPart(locale.nick, measurement.neck, "neck"),
                ),
                BodyAnchor(
                  top: 0.18,
                  left: 0.30,
                  label: locale.shoulders,
                  value: measurement.shoulders,
                  onTap: () => onSelectPart(locale.shoulders, measurement.shoulders, "shoulders"),
                ),
                BodyAnchor(
                  top: 0.23,
                  left: 0.5,
                  label: locale.chest,
                  value: measurement.chest,
                  onTap: () => onSelectPart(locale.chest, measurement.chest, "chest"),
                ),
                BodyAnchor(
                  top: 0.30,
                  left: 0.25 + 0.05,
                  label: locale.lArm,
                  value: measurement.lArm,
                  onTap: () => onSelectPart(locale.lArm, measurement.lArm, "lArm"),
                ),
                BodyAnchor(
                  top: 0.30,
                  left: 0.75 - 0.05,
                  label: locale.rArm,
                  value: measurement.rArm,
                  onTap: () => onSelectPart(locale.rArm, measurement.rArm, "rArm"),
                ),
                BodyAnchor(
                  top: 0.35,
                  left: 0.45,
                  label: locale.waist,
                  value: measurement.waist,
                  onTap: () => onSelectPart(locale.waist, measurement.waist, "waist"),
                ),
                BodyAnchor(
                  top: 0.43,
                  left: 0.55,
                  label: locale.hips,
                  value: measurement.hips,
                  onTap: () => onSelectPart(locale.hips, measurement.hips, "hips"),
                ),
                BodyAnchor(
                  top: 0.58,
                  left: 0.38,
                  label: locale.lThigh,
                  value: measurement.lThigh,
                  onTap: () => onSelectPart(locale.lThigh, measurement.lThigh, "lThigh"),
                ),
                BodyAnchor(
                  top: 0.58,
                  left: 0.62,
                  label: locale.rThigh,
                  value: measurement.rThigh,
                  onTap: () => onSelectPart(locale.rThigh, measurement.rThigh, "rThigh"),
                ),
                BodyAnchor(
                  top: 0.85,
                  left: 0.40,
                  label: locale.lLeg,
                  value: measurement.lLeg,
                  onTap: () => onSelectPart(locale.lLeg, measurement.lLeg, "lLeg"),
                ),
                BodyAnchor(
                  top: 0.85,
                  left: 0.60,
                  label: locale.rLeg,
                  value: measurement.rLeg,
                  onTap: () => onSelectPart(locale.rLeg, measurement.rLeg, "rLeg"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BodyAnchor extends StatelessWidget {
  final double top;
  final double left;
  final String label;
  final double value;
  final VoidCallback onTap;

  const BodyAnchor({
    super.key,
    required this.top,
    required this.left,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: FractionalOffset(left, top),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          spacing: 2,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primary,
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: colorScheme.outlineVariant, width: 0.5),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2, offset: const Offset(0, 1)),
                ],
              ),
              child: Text(
                NumberFormat.decimalPattern().format(value),
                style: TextStyle(color: colorScheme.onSurface, fontSize: 12, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
