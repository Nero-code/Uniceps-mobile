import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
// import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_info.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget(2).dart';
// import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';
// import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/training_group(2).dart';
// import 'package:uniceps/features/Training/views/widgets/training_group.dart';

final img = [
  "1.png",
  "2.png",
  "3.png",
  "4.png",
  "5.png",
  "6.png",
  "7.png",
  "8.png"
];
final trImg = [
  "Waist.png",
  "Leg.png",
  "Neck.png",
  "Shoulder.png",
  "Thigh.png",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.trainingUsecases});

  final TrainingUsecases trainingUsecases;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RestorationMixin {
  // final Logger logger;
  final weightCtl = TextEditingController();

  int selectedGroup = 0;

  final List<int> completed = [];

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: "HomePage",
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.onBackground,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("Uniceps"),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.pushNamed(context, ROUTE_QR_SCANNER);
              },
              tooltip: "QR Scan",
              icon: const Icon(Icons.qr_code_scanner),
            ),
            IconButton(
              onPressed: () async {
                Navigator.pushNamed(context, ROUTE_PRESENCE);
              },
              tooltip: "QR Scan",
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: BlocBuilder<TrainingBloc, TrainingState>(
          builder: (context, state) {
            // if (state is TrainingProgramLoadedState) {
            return Stack(
              children: [
                Column(
                  children: [
                    ///   H O M E   C A R D
                    HomeCard(
                      level: 5,
                      percentage: 0.9,
                      onTap: () {
                        Navigator.pushNamed(context, ROUTE_PROFILE);
                      },
                    ),

                    ///   T R A I N I N G   G R O U P S
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return TrainingGroup2(
                            image: "images/muscle-groups/" + trImg[index],
                            name: trImg[index].split('.')[0],
                            isSelected: selectedGroup == index,
                            isToday: index > 3,
                            onPressed: () {
                              setState(() {
                                selectedGroup = index;
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    ///   E X E R C I S E S
                    Expanded(
                      child: GridView.builder(
                          itemCount: 8,
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 16 / 13,
                          ),
                          itemBuilder: (context, index) {
                            return ExerciseWidget2(
                              index: index,
                              image: "images/img/" + img[index],
                              isCompleted: completed.contains(index),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ExerciseInfoDialog(
                                    weightCtl: weightCtl,
                                    e: Exercise(
                                        id: "0",
                                        name: "name",
                                        tId: "tId",
                                        imageUrl: "images/img/" + img[index],
                                        description:
                                            "description description description description description description description"),
                                  ),
                                );
                              },
                              onCheck: () {
                                setState(() {
                                  if (completed.contains(index)) {
                                    completed.remove(index);
                                  } else {
                                    completed.add(index);
                                  }
                                });
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ],
            );
            // } else {
            //   return Center(
            //     child: Text("No Records!"),
            //   );
            // }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (completed.length != 8) {
              completed.clear();
              completed.addAll([for (int i = 0; i < 8; i++) i]);
            } else {
              completed.clear();
            }
            setState(() {});
            final either = await widget.trainingUsecases.getTrainingProgram();
            either.fold((f) {
              print(f.getErrorMessage());
            }, (unit) {
              print(unit);
            });
          },
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          foregroundColor: Colors.white,
          child: const Icon(Icons.done_all),
        ),
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "HomePage";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // registerForRestoration(completed, "completed");
  }
}
