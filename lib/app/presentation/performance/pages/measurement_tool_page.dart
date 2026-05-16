import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/commands/measurement_usecases/measurement_commands.dart';
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
  const MeasurementToolPage({super.key, required this.commands});

  final MeasurementCommands commands;

  @override
  State<MeasurementToolPage> createState() => _MeasurementToolPageState();
}

class _MeasurementToolPageState extends State<MeasurementToolPage> {
  List<Measurement> measurements = [];
  Measurement? oldM, newM;

  Future<List<Measurement>> getMeasurements() async {
    final either = await widget.commands.getMeasurements();
    return either.fold((l) => Future.error(l), (r) => Future.value(r));
  }

  late Future<List<Measurement>> future;

  @override
  void initState() {
    super.initState();
    future = getMeasurements();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          measurements = snapshot.data!;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 50),
                  child: const SizedBox(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    locale.scrTitleCompareTool,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: .bold),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // OLD
                      DropdownButton(
                        icon: const Icon(Icons.calendar_month, size: 20),
                        hint: Text(
                          '${locale.measurements} ${locale.before}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        elevation: 1,
                        value: oldM,
                        borderRadius: BorderRadius.circular(10),
                        items: measurements
                            .map(
                              (m) => DropdownMenuItem(
                                value: m,
                                child: Text(
                                  DateFormat('d/M/y').format(m.checkDate),
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => oldM = v),
                      ),
                      const Icon(Icons.arrow_right_alt_outlined),

                      // NEW
                      DropdownButton(
                        icon: const Icon(Icons.calendar_month, size: 20),
                        hint: Text(
                          '${locale.measurements} ${locale.after}',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        elevation: 1,
                        value: newM,
                        borderRadius: BorderRadius.circular(10),
                        items: measurements
                            .map(
                              (m) => DropdownMenuItem(
                                value: m,
                                child: Text(
                                  DateFormat('d/M/y').format(m.checkDate),
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => newM = v),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: imgs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 5),
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
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: EmptyPage(
              imageName: CaptainImages.noMeasurements,
              message: locale.emptyMeasure,
              imageSize: Size(MediaQuery.sizeOf(context).width * .5, MediaQuery.sizeOf(context).width * .5),
            ),
          );
        }
        return const LoadingIndicator();
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
