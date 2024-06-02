import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
// import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
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

class _HomeScreenState extends State<HomeScreen> {
  // final Logger logger;
  final weightCtl = TextEditingController();

  int selectedGroup = 0;

  final List<int> completed = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text("Exercise Name"),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image(
                                            image: AssetImage(
                                                "images/img/" + img[0]),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                            "Description Description Description Description Description"),
                                        const Divider(),
                                        const SizedBox(height: 10),
                                        Text("Last Weight: 15 Kg"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                controller: weightCtl,
                                                decoration: const InputDecoration(
                                                    isCollapsed: true,
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Add Weight to database...
                                              },
                                              child: Text("Update"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ).build(context),
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
    );
  }
}
