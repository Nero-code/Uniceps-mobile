import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget_3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeasurementScreen3 extends StatefulWidget {
  MeasurementScreen3({super.key});

  @override
  State<MeasurementScreen3> createState() => _MeasurementScreen3State();
}

class _MeasurementScreen3State extends State<MeasurementScreen3>
    with TickerProviderStateMixin {
  final trImg = [
    "Height.jpg",
    "Weight.jpg",
    "Neck.jpg",
    "Shoulder.jpg",
    "Chest.jpg",
    "Waist.jpg",
    "ForeArm.jpg",
    "ForeArm_r.jpg",
    "Thigh.jpg",
    "Thigh_r.jpg",
    "Leg_l.jpg",
    "Leg.jpg",
    'hips.jpg',
  ];

  int page = 0;

  bool isLoading = false;

  bool isLeft = false;

  final duration = const Duration(milliseconds: 500);

  Widget child = SizedBox();

  Future<void> animate(bool isNext) async {
    // isLoading = true;
    // setState(() {});
    // await Future.delayed(const Duration(milliseconds: 500));
    print("currentPAge:  $page");
    print("isLoading:  $isLoading");
    isLeft = isNext;
    isNext ? ++page : --page;

    // isLoading = false;
    // childBuilder();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    // final local = AppLocalizations.of(context)!;
    print("currentPAge:  $page");
    print("isLoading:  $isLoading");
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<MeasurmentBloc, MeasurmentState>(
        builder: (context, state) {
          if (state is MeasurementLoadedState) {
            childBuilder(state.list[page]);
            return GestureDetector(
              onHorizontalDragEnd: (details) async {
                if (isLoading) return;

                if (details.primaryVelocity != null &&
                    details.primaryVelocity! > 0) {
                  if (page < state.list.length - 1) {
                    // ++page;
                    await animate(true);
                  }
                } else if (details.primaryVelocity != null &&
                    details.primaryVelocity! < 0) {
                  if (page > 0) {
                    // --page;
                    await animate(false);
                  }
                }
              },
              child: SafeArea(
                child: SizedBox(
                  width: screen.width,
                  height: screen.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 10.0),
                      Column(
                        children: [
                          PageTransitionSwitcher(
                            duration: const Duration(milliseconds: 500),
                            reverse: isLeft,
                            transitionBuilder:
                                (child, primaryAnimation, secondaryAnimation) {
                              // return SharedAxisTransition(
                              //   animation: primaryAnimation,
                              //   secondaryAnimation: secondaryAnimation,
                              //   transitionType:
                              //       SharedAxisTransitionType.horizontal,
                              //   child: SizedBox(
                              //     child: child,
                              //   ),
                              // );
                              // return Stack(
                              //   children: [
                              //     // SlideTransition(
                              //     //   position: Tween(
                              //     //           begin: Offset(0.3, 0),
                              //     //           end: Offset.zero)
                              //     //       .animate(primaryAnimation),
                              //     //   child: FadeTransition(
                              //     //     opacity: primaryAnimation,
                              //     //     child: child,
                              //     //   ),
                              //     // ),
                              //     // SlideTransition(
                              //     //   position: Tween(
                              //     //     begin: Offset.zero,
                              //     //     end: Offset(-0.3, 0),
                              //     //   ).animate(primaryAnimation),
                              //     //   child: FadeTransition(
                              //     //     opacity:
                              //     //         Tween<double>(begin: 0.7, end: 0.0)
                              //     //             .animate(primaryAnimation),
                              //     //     child: this,
                              //     //   ),
                              //     // ),
                              //     // SharedAxisTransition(
                              //     //   animation: primaryAnimation,
                              //     //   secondaryAnimation: primaryAnimation,
                              //     //   transitionType:

                              return SharedAxisTransition(
                                animation: primaryAnimation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                child: child,
                              );
                            },
                            child: SizedBox(
                              key: ValueKey<int>(page),
                              child: child,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (isLoading) return;

                              if (page > 0) {
                                // --page;
                                await animate(false);
                              }
                            },
                            icon: Container(
                              padding: const EdgeInsets.all(10.0),
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
                            DateFormat("dd/MM/yyyy")
                                .format(state.list[page].checkDate),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () async {
                              if (isLoading) return;
                              if (page < state.list.length - 1) {
                                // ++page;
                                await animate(true);
                              }
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
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
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

  void childBuilder(Measurement m) {
    final local = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    child = SizedBox(
      width: screen.width,
      height: screen.height * 0.85,
      child: Column(
        // key: ValueKey<int>(page),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[0],
                  title: local.height,
                  value: m.height),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[2],
                  title: local.nick,
                  value: m.neck),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[3],
                  title: local.shoulders,
                  value: m.shoulders),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[6],
                  title: local.lArm,
                  value: m.lArm),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[4],
                  title: local.chest,
                  value: m.chest),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[7],
                  title: local.rArm,
                  value: m.rArm),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[8],
                  title: local.lThigh,
                  value: m.lThigh),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[5],
                  title: local.waist,
                  value: m.waist),
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[9],
                  title: local.rThigh,
                  value: m.rThigh),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[10],
                  title: local.lLeg,
                  value: m.lLeg), // rLeg
              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[12],
                  title: local.hips,
                  value: m.hips),

              MeasureWidget3(
                  isLoading: isLoading,
                  image: trImg[11],
                  title: local.rLeg,
                  value: m.rLeg),
            ],
          ),
          MeasureWidget3(
              isLoading: isLoading,
              image: trImg[1],
              title: local.weight,
              isCm: false,
              value: m.weight),
        ],
      ),
    );
  }
}
