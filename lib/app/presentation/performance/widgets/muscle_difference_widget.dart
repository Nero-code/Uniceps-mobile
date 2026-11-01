import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MuscleDifferenceWidget extends StatelessWidget {
  const MuscleDifferenceWidget({
    super.key,
    required this.image,
    required this.muscleName,
    required this.oldVal,
    required this.newVal,
  });

  final String image, muscleName;
  final double? oldVal, newVal;

  double? get _gainPercent {
    if (newVal == null || oldVal == null || oldVal == 0) return null;
    return (((newVal! - oldVal!) / oldVal!) * 100);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final pct = _gainPercent;
    final isPositive = pct != null && pct > 0;
    final isNegative = pct != null && pct < 0;

    final badgeColor = isPositive
        ? Colors.green.shade700
        : isNegative
        ? Colors.red.shade700
        : Colors.grey.shade600;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Muscle Image & Name
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(image: AssetImage(image), width: 44, height: 44, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 80,
            child: Text(
              muscleName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),

          // Before Value
          Column(
            children: [
              Text(locale.before, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(
                oldVal != null ? oldVal!.toStringAsFixed(1) : "---",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // After Value
          Column(
            children: [
              Text(locale.after, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(
                newVal != null ? newVal!.toStringAsFixed(1) : "---",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Difference % Badge
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(color: badgeColor.withAlpha(20), borderRadius: BorderRadius.circular(6)),
            child: Text(
              pct != null ? "${isPositive ? '+' : ''}${pct.toStringAsFixed(1)}%" : "---",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }
}
