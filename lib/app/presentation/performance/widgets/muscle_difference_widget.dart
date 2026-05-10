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

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
        // boxShadow: [
        //   BoxShadow(offset: Offset(0, 0), color: Colors.white.withAlpha(100), blurRadius: 10, spreadRadius: 3),
        // ],
        borderRadius: .circular(25),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(muscleName, style: const TextStyle(fontSize: 10)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: AssetImage(image), width: 50, height: 50),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Text(locale.before, style: const TextStyle(fontSize: 11)),
                Text('${oldVal ?? '---'}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(locale.after, style: const TextStyle(fontSize: 11)),
                Text('${newVal ?? '---'}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text('%', style: TextStyle(fontSize: 11)),
                Text(
                  '${gainPercentage()}%',
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String gainPercentage() {
    if (newVal == null || oldVal == null) return '---';
    if (newVal == 0 && oldVal == 0) return '---';
    if (oldVal == 0.0) return '100.0';
    return (((newVal! - oldVal!) / oldVal!) * 100).toStringAsFixed(1);
  }
}
