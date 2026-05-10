import 'package:flutter/material.dart';

class TotalAccumulationCard extends StatelessWidget {
  const TotalAccumulationCard({
    super.key,
    required this.title,
    required this.icon,
    this.value,
    this.unit,
    this.unitStyle,
  });

  // final UnicepsSummery summery;
  final Widget icon;
  final String title;
  final String? value, unit;
  final TextStyle? unitStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(vertical: 15.0, horizontal: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
        boxShadow: [
          BoxShadow(offset: const Offset(0, 0), color: Colors.white.withAlpha(100), blurRadius: 10, spreadRadius: 3),
        ],
        borderRadius: .circular(25),
      ),
      child: Column(
        mainAxisSize: .min,
        spacing: 10,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: .bold, color: Colors.black54),
          ),
          icon,
          Row(
            mainAxisSize: .min,
            textDirection: .ltr,
            spacing: 5,
            children: [
              if (value != null)
                Text(
                  value!,
                  style: const TextStyle(fontSize: 34, fontWeight: .bold, color: Colors.black54),
                ),
              if (unit != null)
                Text(
                  unit!,
                  style: unitStyle ?? const TextStyle(fontSize: 18, fontWeight: .normal, color: Colors.black54),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
