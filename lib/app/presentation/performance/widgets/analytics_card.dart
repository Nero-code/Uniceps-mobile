import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconBackground,
    required this.max,
    required this.avg,
    required this.min,
    required this.total,
    this.background = const Color.fromRGBO(238, 238, 238, 1),
  });

  final String title;
  final Widget icon;
  final Color iconBackground;
  final Color background;

  final double max, avg, min, total;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width * .5 - 14.0,
      // height: 120,
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(15)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text(title, style: const TextStyle(fontSize: 12))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: iconBackground.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: icon,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_drop_up_rounded, color: Colors.green),
                          const SizedBox(width: 5),
                          Text(formatNum(max), style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.remove_rounded, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(formatNum(avg), style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_drop_down_rounded, color: Colors.pink),
                          const SizedBox(width: 5),
                          Text(formatNum(min), style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.pie_chart, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(formatNum(total), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatNum(double x) {
    return x.toStringAsFixed(1);
  }
}
