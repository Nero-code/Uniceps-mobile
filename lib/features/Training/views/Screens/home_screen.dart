import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool isGrid = false;

  final List<int> completed = [];

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: "HomePage",
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.onBackground,
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.background,
        //   title: const Text("Uniceps"),
        //   actions: [
        //     IconButton(
        //       onPressed: () async {
        //         Navigator.pushNamed(context, ROUTE_QR_SCANNER);
        //       },
        //       icon: const Icon(Icons.qr_code_scanner),
        //     ),
        //     // IconButton(
        //     //   onPressed: () async {
        //     //     //
        //     //     //
        //     //     //
        //     //     //    T O   G Y M   H A N D - S H A K E   S C R E E N
        //     //     //
        //     //     //
        //     //     //

        //     //     // Navigator.pushNamed(context, ROUTE_PRESENCE);
        //     //     Navigator.pushNamed(context, ROUTE_HANDSHAKE);
        //     //   },
        //     //   icon: const Icon(Icons.fitness_center_rounded),
        //     // ),
        //   ],
        // ),
        body: BlocBuilder<TrainingBloc, TrainingState>(
          builder: (context, state) {
            // if (state is TrainingProgramLoadedState) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: const Text(APP_NAME),
                  expandedHeight: MediaQuery.of(context).size.height * 0.2,
                  flexibleSpace:

                      ///   H O M E   C A R D
                      FlexibleSpaceBar(
                    background: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      alignment: Alignment.bottomCenter,
                      child: HomeCard(
                        level: 5,
                        percentage: 0.9,
                        onTap: () {
                          Navigator.pushNamed(context, ROUTE_PROFILE);
                        },
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, ROUTE_QR_SCANNER);
                      },
                      icon: const Icon(Icons.qr_code_scanner),
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 0.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              iconSize: 20.0,
                              icon: Icon(
                                !isGrid
                                    ? Icons.format_list_bulleted_rounded
                                    : Icons.grid_view_rounded,
                              ),
                              onPressed: () {
                                setState(() {
                                  isGrid = !isGrid;
                                });
                              },
                            ),
                            DropdownButton<String>(
                              // alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              borderRadius: BorderRadius.circular(5),
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black),
                              isDense: true,
                              // hint: SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.7,
                              //   child: Text(
                              //     "YYoo",
                              //   ),
                              // ),
                              value: "1",
                              dropdownColor: Colors.white,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 3,
                              items: [
                                DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: "1",
                                  child: SizedBox(
                                    child: Center(child: Text("1")),
                                    width: 150,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: "2",
                                  child: Text("2"),
                                ),
                                DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: "3",
                                  child: Text("3"),
                                ),
                              ],
                              onChanged: (val) {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return TrainingGroup2(
                              image: "images/muscle-groups/${trImg[index]}",
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
                      // const SizedBox(height: 8),

                      ///   E X E R C I S E S
                      // if (state is TrainingProgramLoadedState)
                      // Expanded(
                      // child: GridView.builder(
                      //     itemCount: 8,
                      //     padding: const EdgeInsets.only(
                      //         left: 10.0, right: 10.0, bottom: 75.0),
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       mainAxisSpacing: 10,
                      //       crossAxisSpacing: 10,
                      //       childAspectRatio: 16 / 13,
                      //     ),
                      //     itemBuilder: (context, index) {
                      //       return ExerciseWidget2(
                      //         index: index,
                      //         image: "images/img/${img[index]}",
                      //         isCompleted: completed.contains(index),
                      //         onPressed: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (context) => ExerciseInfoDialog(
                      //               weightCtl: weightCtl,
                      //               e: Exercise(
                      //                   id: "0",
                      //                   name: "name",
                      //                   tId: "tId",
                      //                   imageUrl: "images/img/${img[index]}",
                      //                   description:
                      //                       "description description description description description description description"),
                      //             ),
                      //           );
                      //         },
                      //         onCheck: () {
                      //           setState(() {
                      //             if (completed.contains(index)) {
                      //               completed.remove(index);
                      //             } else {
                      //               completed.add(index);
                      //             }
                      //           });
                      //         },
                      //       );
                      //     }),
                      // child:
                    ],
                  ),
                ),
                isGrid
                    ? SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 16 / 13,
                          //   return GridView.builder(
                          //     itemCount: 8,
                          //     padding: const EdgeInsets.only(
                          //         left: 10.0, right: 10.0, bottom: 75.0),
                          //     gridDelegate:
                          //         const SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: 2,
                          //       mainAxisSpacing: 10,
                          //       crossAxisSpacing: 10,
                          //       childAspectRatio: 16 / 13,
                          //     ),
                          //     itemBuilder: (context, index) {
                          //       return ExerciseWidget2(
                          //         index: index,
                          //         image: "images/img/${img[index]}",
                          //         isCompleted: completed.contains(index),
                          //         onPressed: () {
                          //           showDialog(
                          //             context: context,
                          //             builder: (context) => ExerciseInfoDialog(
                          //               weightCtl: weightCtl,
                          //               e: Exercise(
                          //                   id: "0",
                          //                   name: "name",
                          //                   tId: "tId",
                          //                   imageUrl: "images/img/${img[index]}",
                          //                   description:
                          //                       "description description description description description description description"),
                          //             ),
                          //           );
                          //         },
                          //         onCheck: () {
                          //           setState(() {
                          //             if (completed.contains(index)) {
                          //               completed.remove(index);
                          //             } else {
                          //               completed.add(index);
                          //             }
                          //           });
                          //         },
                          //       );
                          //     },
                          //   );
                          // }),
                        ),
                        delegate: SliverChildListDelegate.fixed(
                          [
                            for (int index = 0; index < 8; index++)
                              ExerciseWidget2(
                                index: index,
                                image: "images/img/${img[index]}",
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
                                          imageUrl: "images/img/${img[index]}",
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
                              ),
                          ],
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          [
                            for (int index = 0; index < 8; index++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: ExerciseWidget2(
                                    index: index,
                                    image: "images/img/${img[index]}",
                                    isCompleted: completed.contains(index),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ExerciseInfoDialog(
                                          weightCtl: weightCtl,
                                          e: Exercise(
                                              id: "0",
                                              name: "name",
                                              tId: "tId",
                                              imageUrl:
                                                  "images/img/${img[index]}",
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
                                  ),
                                ),
                              ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
              ],
            );

            // } else if(TrainingProgramErrorState) {
            //   return Center(
            //     child: Text("No Records!"),  // SHOULD NAVIGATE TO GYMS LIST
            //   );
            // } else {
            //   return const Center(child: CircularProgressIndicator());
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
