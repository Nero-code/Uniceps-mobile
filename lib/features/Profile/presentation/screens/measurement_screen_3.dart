import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget_3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeasurementScreen3 extends StatefulWidget {
  MeasurementScreen3({super.key});

  @override
  State<MeasurementScreen3> createState() => _MeasurementScreen3State();
}

class _MeasurementScreen3State extends State<MeasurementScreen3> {
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

  int page = 0;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<MeasurmentBloc, MeasurmentState>(
        builder: (context, state) {
          if (state is MeasurementLoadedState) {
            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity != null &&
                    details.primaryVelocity! > 0) {
                  if (page < state.list.length - 1) {
                    ++page;
                    setState(() {});
                  }
                } else if (details.primaryVelocity != null &&
                    details.primaryVelocity! < 0) {
                  if (page > 0) {
                    --page;
                    setState(() {});
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screen.height * 0.72,
                        child: GridView(
                          padding: EdgeInsets.only(top: screen.height * 0.05),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0),
                          children: [
                            MeasureWidget3(
                                image: trImg[0],
                                title: local.height,
                                value: state.list[page].height),
                            MeasureWidget3(
                                image: trImg[2],
                                title: local.nick,
                                value: state.list[page].neck),
                            MeasureWidget3(
                                image: trImg[3],
                                title: local.shoulders,
                                value: state.list[page].shoulders),
                            MeasureWidget3(
                                image: trImg[6],
                                title: local.lArm,
                                value: state.list[page].lArm),
                            MeasureWidget3(
                                image: trImg[4],
                                title: local.chest,
                                value: state.list[page].chest),
                            MeasureWidget3(
                                image: trImg[0],
                                title: local.rArm,
                                value: state.list[page].rArm),
                            MeasureWidget3(
                                image: trImg[7],
                                title: local.lThigh,
                                value: state.list[page].lThigh),

                            MeasureWidget3(
                                image: trImg[5],
                                title: local.waist,
                                value: state.list[page].waist),
                            MeasureWidget3(
                                image: trImg[0],
                                title: local.rThigh,
                                value: state.list[page].rThigh),
                            MeasureWidget3(
                                image: trImg[0],
                                title: local.lLeg,
                                value: state.list[page].lLeg), // rLeg
                            MeasureWidget3(
                                image: trImg[9],
                                title: local.hips,
                                value: state.list[page].hips),

                            MeasureWidget3(
                                image: trImg[8],
                                title: local.rLeg,
                                value: state.list[page].rLeg),
                          ],
                        ),
                      ),
                      MeasureWidget3(
                          image: trImg[1],
                          title: local.weight,
                          isCm: false,
                          value: state.list[page].weight),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (page > 0) {
                                --page;
                              }
                            });
                          },
                          icon: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Text(
                          "${DateFormat("dd/MM/yyyy").format(state.list[page].checkDate)}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (page < state.list.length - 1) {
                                ++page;
                              }
                            });
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is MeasurementErrorState) {
            return Center(
              child: ReloadScreenWidget(
                  f: state.f,
                  callBack: () {
                    BlocProvider.of<MeasurmentBloc>(context)
                        .add(GetMeasurementsEvent());
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
