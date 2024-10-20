import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
// import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  // final numbers = [180, 70, 0, 120, 95, 0, 30, 76, 30];
  // final trImgPng = [
  //   "Height.png",
  //   "Weight.png",
  //   "Neck.png",
  //   "Shoulder.png",
  //   "Chest.png",
  //   "Waist.png",
  //   "ForeArm.png",
  //   "Thigh.png",
  //   "Leg.png",
  // ];
  final trImg = [
    "Height.jpg",
    "Weight.jpg",
    "Neck.jpg",
    "Shoulder.jpg",
    "Chest.jpg",
    "Waist.jpg",
    "ForeArm.jpg",
    "Thigh.jpg",
    "Leg.jpg",
    'hips.jpg',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: const Text("Uniceps"),
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      ),
      body: BlocBuilder<MeasurmentBloc, MeasurmentState>(
        builder: (context, state) {
          // print(state.runtimeType);
          if (state is MeasurmentInitial) {
            BlocProvider.of<MeasurmentBloc>(context)
                .add(GetMeasurementsEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is MeasurementLoadedState) {
            if (state.list.isEmpty) {
              // return Center(child: Text(AppLocalizations.of(context)!.empty));
              return ReloadScreenWidget(
                  f: const EmptyCacheFailure(errorMessage: "asad"),
                  callBack: () {
                    BlocProvider.of<MeasurmentBloc>(context)
                        .add(GetMeasurementsEvent());
                  });
            }
            return Column(
              children: [
                SizedBox(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new),
                              onPressed: state.list.length > 1
                                  ? () {
                                      setState(() {
                                        if (currentPage > 0) {
                                          --currentPage;
                                        }
                                      });
                                    }
                                  : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "${state.list[currentPage].checkDate.year}/"
                              "${state.list[currentPage].checkDate.month}/"
                              "${state.list[currentPage].checkDate.day}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: IconButton(
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: state.list.length > 1
                                  ? () {
                                      setState(() {
                                        if (currentPage <
                                            state.list.length - 1) {
                                          ++currentPage;
                                        }
                                      });
                                    }
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.height,
                        isSymmetric: true,
                        lValue: state.list[currentPage].height,
                        image: trImg[0],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.weight,
                        isSymmetric: true,
                        lValue: state.list[currentPage].weight,
                        isCm: false,
                        image: trImg[1],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.nick,
                        isSymmetric: true,
                        lValue: state.list[currentPage].neck,
                        image: trImg[2],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.shoulders,
                        isSymmetric: true,
                        lValue: state.list[currentPage].shoulders,
                        image: trImg[3],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.chest,
                        isSymmetric: true,
                        lValue: state.list[currentPage].chest,
                        image: trImg[4],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.waist,
                        isSymmetric: true,
                        lValue: state.list[currentPage].waist,
                        image: trImg[5],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.arms,
                        isSymmetric: state.list[currentPage].lArm ==
                            state.list[currentPage].rArm,
                        lValue: state.list[currentPage].lArm,
                        rValue: state.list[currentPage].rArm,
                        image: trImg[6],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.thighs,
                        isSymmetric: state.list[currentPage].lThigh ==
                            state.list[currentPage].rThigh,
                        lValue: state.list[currentPage].lThigh,
                        rValue: state.list[currentPage].rThigh,
                        image: trImg[7],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.legs,
                        isSymmetric: state.list[currentPage].lLeg ==
                            state.list[currentPage].rLeg,
                        lValue: state.list[currentPage].lLeg,
                        rValue: state.list[currentPage].rLeg,
                        image: trImg[8],
                      ),
                      MeasureWidget(
                        title: AppLocalizations.of(context)!.hips,
                        isSymmetric: true,
                        lValue: state.list[currentPage].hips,
                        image: trImg[9],
                      ),
                    ],
                  ),
                ),
              ],
            );
            // "Unexpected Error occourd!"
          } else if (state is MeasurementErrorState) {
            // print("Measurement Failure: ${state.f.runtimeType}");
            return Center(
              child: ReloadScreenWidget(
                f: state.f,
                callBack: () {
                  BlocProvider.of<MeasurmentBloc>(context)
                      .add(GetMeasurementsEvent());
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
