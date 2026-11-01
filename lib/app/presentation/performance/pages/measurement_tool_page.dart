import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measurement.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/app/presentation/performance/widgets/muscle_difference_widget.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:uniceps/core/widgets/empty_page.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

const imgs = [
  MusclesImages.height,
  MusclesImages.weight,
  MusclesImages.neck,
  MusclesImages.shoulder,
  MusclesImages.chest,
  MusclesImages.waist,
  MusclesImages.rArm,
  MusclesImages.lArm,
  MusclesImages.rThigh,
  MusclesImages.lThigh,
  MusclesImages.rLeg,
  MusclesImages.lLeg,
  MusclesImages.hips,
];

class MeasurementToolPage extends StatefulWidget {
  const MeasurementToolPage({super.key});

  @override
  State<MeasurementToolPage> createState() => _MeasurementToolPageState();
}

class _MeasurementToolPageState extends State<MeasurementToolPage> {
  Measurement? oldM, newM;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        if (state is MetricsLoading || state is MetricsInitial) {
          return const LoadingIndicator();
        }

        if (state is MetricsFailure) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: EmptyPage(
              imageName: CaptainImages.noMeasurements,
              message: locale.emptyMeasure,
              imageSize: Size(MediaQuery.sizeOf(context).width * .5, MediaQuery.sizeOf(context).width * .5),
            ),
          );
        }

        if (state is MetricsLoaded) {
          final measurements = state.result.measurements;

          if (measurements.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: EmptyPage(
                imageName: CaptainImages.noMeasurements,
                message: locale.emptyMeasure,
                imageSize: Size(MediaQuery.sizeOf(context).width * .5, MediaQuery.sizeOf(context).width * .5),
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 16),
                  child: const SizedBox(),
                ),
              ),
              // Comparison Date Selector Header
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.straighten, color: primaryColor, size: 20),
                          const SizedBox(width: 8),
                          Text(locale.measurements, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // OLD Measurement Dropdown
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Measurement>(
                                  isExpanded: true,
                                  icon: const Icon(Icons.calendar_month, size: 18),
                                  hint: Text(
                                    '${locale.measurements} ${locale.before}',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  value: oldM,
                                  borderRadius: BorderRadius.circular(8),
                                  items: measurements
                                      .map(
                                        (m) => DropdownMenuItem(
                                          value: m,
                                          child: Text(
                                            DateFormat('MMM dd, yyyy').format(m.checkDate),
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) => setState(() => oldM = v),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.arrow_forward, color: Colors.grey, size: 18),
                          ),
                          // NEW Measurement Dropdown
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Measurement>(
                                  isExpanded: true,
                                  icon: const Icon(Icons.calendar_month, size: 18),
                                  hint: Text(
                                    '${locale.measurements} ${locale.after}',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  value: newM,
                                  borderRadius: BorderRadius.circular(8),
                                  items: measurements
                                      .map(
                                        (m) => DropdownMenuItem(
                                          value: m,
                                          child: Text(
                                            DateFormat('MMM dd, yyyy').format(m.checkDate),
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (v) => setState(() => newM = v),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Measurements List
              SliverList.separated(
                itemCount: imgs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 2),
                itemBuilder: (context, i) {
                  return MuscleDifferenceWidget(
                    image: imgs[i],
                    muscleName: muscleNameMapper(i, locale),
                    newVal: newM?.getByIndex(i),
                    oldVal: oldM?.getByIndex(i),
                  );
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 20),
                  child: const SizedBox(),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  String muscleNameMapper(int index, AppLocalizations l) {
    switch (index) {
      case 0:
        return l.height;
      case 1:
        return l.weight;
      case 2:
        return l.nick;
      case 3:
        return l.shoulders;
      case 4:
        return l.chest;
      case 5:
        return l.waist;
      case 6:
        return l.lArm;
      case 7:
        return l.rArm;
      case 8:
        return l.lThigh;
      case 9:
        return l.rThigh;
      case 10:
        return l.lLeg;
      case 11:
        return l.rLeg;
      case 12:
        return l.hips;
      default:
        return '';
    }
  }
}
