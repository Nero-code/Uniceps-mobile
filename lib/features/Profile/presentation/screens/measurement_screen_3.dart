import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget_3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class MeasurementScreen3 extends StatefulWidget {
  const MeasurementScreen3({super.key});

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

  Widget child = const SizedBox();

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
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    print("currentPAge:  $page");
    print("isLoading:  $isLoading");
    return Scaffold(
      body: BlocBuilder<MeasurmentBloc, MeasurmentState>(
        builder: (context, state) {
          return Stack(
            children: [
              Builder(
                builder: (context) {
                  if (state is MeasurementLoadedState) {
                    childBuilder(state.list[page]);
                    return GestureDetector(
                      onHorizontalDragEnd: (details) async {
                        if (isLoading) return;

                        if (details.primaryVelocity != null &&
                            details.primaryVelocity! > 0) {
                          print("Left");
                          if (page < state.list.length - 1) {
                            // ++page;
                            await animate(true);
                          }
                        } else if (details.primaryVelocity != null &&
                            details.primaryVelocity! < 0) {
                          print("Right");
                          if (page > 0) {
                            // --page;
                            await animate(false);
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.1),
                        child: SizedBox(
                          width: screen.width,
                          height: screen.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // const SizedBox(height: 20.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PageTransitionSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    reverse: isLeft,
                                    transitionBuilder: (child, primaryAnimation,
                                        secondaryAnimation) {
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
              Positioned(
                top: 20.0,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                ),
              ),
              if (state is MeasurementLoadedState)
                Positioned(
                  bottom: 0.0,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          //  RTL  -->  Left (previous)
                          if (isLoading) return;

                          if (isRtl && page > 0) {
                            await animate(false);
                          }
                          if (!isRtl && page < state.list.length - 1) {
                            await animate(true);
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
                      PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 500),
                        reverse: isLeft,
                        transitionBuilder:
                            (child, primaryAnimation, secondaryAnimation) =>
                                SharedAxisTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                          child: child,
                        ),
                        child: Text(
                          key: ValueKey<String>("$page"),
                          intl.DateFormat("dd/MM/yyyy")
                              .format(state.list[page].checkDate),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          //  RTL  -->  Right (Next)
                          if (isLoading) return;
                          if (isRtl && page < state.list.length - 1) {
                            await animate(true);
                          }
                          if (!isRtl && page > 0) {
                            await animate(false);
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
                ),
            ],
          );
        },
      ),
    );
  }

  void childBuilder(Measurement m) {
    final local = AppLocalizations.of(context)!;
    child = SingleChildScrollView(
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
