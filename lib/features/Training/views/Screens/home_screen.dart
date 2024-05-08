import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/training_group.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.trainingUsecases});

  // final Logger logger;

  final controller = DraggableScrollableController();

  final TrainingUsecases trainingUsecases;

  // bool isSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          "Uniceps",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // BlocProvider.of<LocaleCubit>(context)
              //     .changeLanguage(lang == 'en' ? 'ar' : 'en');
              // await logger.log(
              //   "QR_Btn_Pressed",
              //   {"id": 1, "QR Opened": "true"},
              // );
              Navigator.pushNamed(context, ROUTE_QR_SCANNER);
            },
            tooltip: "QR Scan",
            icon: const Icon(Icons.qr_code_scanner),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.fitness_center_rounded),
          // ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              width: 40,
              height: 40,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => Navigator.pushNamed(
                  context,
                  ROUTE_PROFILE,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  ///   H O M E   C A R D
                  HomeCard(
                    onTap: () {
                      controller.animateTo(0.25,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                  ),

                  ///   W E E K   D A Y S
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.of(context).colorScheme.primary,
                    onTap: () => Navigator.pushNamed(context, ROUTE_PRESENCE),
                    child: WeekDaysBanner(),
                  ),
                  const SizedBox(height: 10),

                  ///   T R A I N I N G   G R O U P S
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: ListView(
                        padding: EdgeInsets.only(bottom: 50),
                        children: [
                          for (int i = 0; i < 14; i++)
                            i % 2 == 1
                                ? OpenContainer(
                                    closedElevation: 0,
                                    openElevation: 0,
                                    closedColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    transitionType:
                                        ContainerTransitionType.fade,
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    closedBuilder: (context, _) =>
                                        TrainingGroup(
                                      order: (i + 1) ~/ 2,
                                    ),
                                    openBuilder: (context, _) =>
                                        ExercisesPage(),
                                  )
                                : const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // if (isSheetOpen)
              // GestureDetector(
              //   onTap: () {
              //     controller.animateTo(0,
              //         duration: Duration(milliseconds: 200),
              //         curve: Curves.easeInExpo);
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     color: Color.fromARGB(80, 0, 0, 0),
              //   ),
              // ),
              DraggableScrollableSheet(
                initialChildSize: 0,
                controller: controller,
                minChildSize: 0.0,
                maxChildSize: 0.8,
                builder: (context, scrollController) {
                  return Container(
                    color: Theme.of(context).colorScheme.background,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final either = await trainingUsecases.getTrainingProgram();
          either.fold((f) {
            print(f.getErrorMessage());
          }, (unit) {
            print(unit);
          });
        },
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        foregroundColor: Colors.white,
        child: Icon(Icons.network_wifi_3_bar_rounded),
      ),
    );
  }
}
