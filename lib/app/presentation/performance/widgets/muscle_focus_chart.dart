import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';

class MuscleFocusChart extends StatelessWidget {
  MuscleFocusChart({super.key, required this.chartData});
  final List<MuscleFocus> chartData;
  final colorWheel = List.from([
    Colors.blue.shade300,
    Colors.red.shade300,
    Colors.amber.shade300,
    Colors.green.shade300,
    Colors.purple.shade300,
    Colors.deepOrange.shade300,
    Colors.deepPurple.shade300,
    Colors.grey.shade300,
    Colors.lime.shade300,
    Colors.lightBlue.shade300,
    Colors.blueGrey.shade300,
  ]);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Container(
      width: screen.width,
      height: screen.width * .7,
      padding: const .all(8.0),
      margin: const .all(16.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
        boxShadow: [
          BoxShadow(offset: const Offset(0, 0), color: Colors.white.withAlpha(100), blurRadius: 5, spreadRadius: 3),
        ],
        borderRadius: .circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: PieChart(
              PieChartData(
                sectionsSpace: 3,
                centerSpaceRadius: 50,
                sections: [
                  for (int i = 0; i < chartData.length; i++)
                    PieChartSectionData(
                      radius: 30,
                      value: chartData[i].percentage * 360,
                      title: NumberFormat.percentPattern().format(chartData[i].percentage),
                      titleStyle: const TextStyle(fontWeight: .bold, color: Colors.black54),
                      color: colorWheel[i],
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(chartData.length, (index) {
                return Row(
                  spacing: 5,
                  children: [
                    SizedBox.square(dimension: 10, child: ColoredBox(color: colorWheel[index])),
                    Text(chartData[index].group.muscleGroupName, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
