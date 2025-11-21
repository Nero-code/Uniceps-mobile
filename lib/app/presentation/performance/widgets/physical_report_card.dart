import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhysicalReportCard extends StatelessWidget {
  const PhysicalReportCard({
    super.key,
    required this.report,
  });

  final PhysicalReport report;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            locale.physicalReport,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: screenSize.width * .2,
                        child: CircularProgressIndicator(
                          color: Colors.red.withOpacity(0.5),
                          backgroundColor: Colors.grey.shade100,
                          value: (report.bmi - 10) / 30,
                          strokeWidth: 10,
                          strokeAlign: 1,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'BMI',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            report.bmi.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: screenSize.width * .2,
                        child: CircularProgressIndicator(
                          color: Colors.amber.withOpacity(0.5),
                          backgroundColor: Colors.grey.shade100,
                          value: .43,
                          strokeWidth: 10,
                          strokeAlign: 1,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'BMR',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            '${report.bmr}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'kcal/${locale.day}',
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: screenSize.width * .2,
                        child: CircularProgressIndicator(
                          color: Colors.green.withOpacity(0.5),
                          backgroundColor: Colors.grey.shade100,
                          value: .26,
                          strokeWidth: 10,
                          strokeAlign: 1,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            'BF%',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            '26%',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'disclaimer: note that these values help you gain insight into your body measurements and ratios',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
