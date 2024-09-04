// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
// import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_info.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget(2).dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget(3).dart';
// import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';
// import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/training_group(2).dart';
// import 'package:uniceps/features/Training/views/widgets/training_group.dart';

// final img = [
//   "1.png",
//   "2.png",
//   "3.png",
//   "4.png",
//   "5.png",
//   "6.png",
//   "7.png",
//   "8.png"
// ];
final trImg = [
  "Waist.png",
  "Leg.png",
  "Neck.png",
  "Shoulder.png",
  "Thigh.png",
];

String? section;

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
                      child: Builder(builder: (context) {
                        final playerState = context.watch<ProfileBloc>().state;

                        if (playerState is ProfileLoadedState) {
                          return HomeCard(
                            player: playerState.player,
                            level: 5,
                            percentage: 0.9,
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_PROFILE);
                            },
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                    ),
                  ),
                  // actions: [
                  //   IconButton(
                  //     onPressed: () async {
                  //       Navigator.pushNamed(context, ROUTE_QR_SCANNER);
                  //     },
                  //     icon: const Icon(Icons.qr_code_scanner),
                  //   ),
                  // ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      //
                      //    C H O O S E   S E C T I O N   W I D G E T
                      //
                      Container(
                        height: 1.0,
                        color: Color.fromARGB(255, 200, 200, 200),
                        margin: const EdgeInsets.only(bottom: 5.0),
                      ),
                      BlocBuilder<TrainingBloc, TrainingState>(
                        builder: (context, state) {
                          if (state is TrainingProgramLoadedState) {
                            return Column(
                              children: [
                                Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 0.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        iconSize: 20.0,
                                        icon: Icon(
                                          !isGrid
                                              ? Icons
                                                  .format_list_bulleted_rounded
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        borderRadius: BorderRadius.circular(5),
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.black),
                                        isDense: true,
                                        hint: const Center(
                                          child: Text(
                                            "Choose a section",
                                          ),
                                        ),
                                        value: section,
                                        dropdownColor: Colors.white,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 3,
                                        items: [
                                          for (var i in state
                                              .program.daysGroupMap.entries)
                                            DropdownMenuItem<String>(
                                              alignment: Alignment.center,
                                              value: i.value,
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                child: Center(
                                                    child: Text(i.value)),
                                              ),
                                            ),
                                          // DropdownMenuItem<String>(
                                          //   alignment: Alignment.center,
                                          //   value: "2",
                                          //   child: Text("2"),
                                          // ),
                                          // DropdownMenuItem<String>(
                                          //   alignment: Alignment.center,
                                          //   value: "3",
                                          //   child: Center(child: Text("3")),
                                          // ),
                                        ],
                                        onChanged: (val) {
                                          print(val);
                                          setState(() {
                                            section = val ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                //    F I L T E R S   L I S T V I E W
                                //
                                SizedBox(
                                  height: 45,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return TrainingGroup2(
                                        image:
                                            "images/muscle-groups/${trImg[index]}",
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
                              ],
                            );
                          }
                          return const SizedBox();
                        },
                      ),
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
                        ),
                        delegate: SliverChildListDelegate.fixed(
                          [
                            BlocBuilder<TrainingBloc, TrainingState>(
                              builder: (context, state) {
                                if (state is TrainingProgramLoadedState) {
                                  return Column(
                                    children: [
                                      for (int index = 0; index < 8; index++)
                                        ExerciseWidget2(
                                          exercise:
                                              state.program.exercises[index],
                                          isCompleted:
                                              completed.contains(index),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ExerciseInfoDialog(
                                                weightCtl: weightCtl,
                                                //   e: Exercise(
                                                //       id: "0",
                                                //       name: "name",
                                                //       tId: "tId",
                                                //       imageUrl:
                                                //           "images/img/${img[index]}",
                                                //       description:
                                                //           "description description description description description description description"),
                                                // ),
                                                e: state
                                                    .program.exercises[index],
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
                                  );
                                } else if (state is TrainingProgramErrorState) {
                                  print(
                                      "inside blocbuilder ${state.f.runtimeType}");
                                  switch (state.f.runtimeType) {
                                    case NoGymSpecifiedFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: Icon(
                                            Icons.qr_code_2_rounded,
                                            size: 50,
                                          ),
                                          message: Text(
                                              " a really long text to put here"),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    case NoInternetConnectionFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: Icon(
                                            Icons.wifi_off_rounded,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                          message:
                                              Text("No Internet Connection"),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    case ServerFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                          message:
                                              Text(state.f.getErrorMessage()),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: const Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    default:
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        child: Center(
                                          child: ReloadScreenWiget(
                                            image: const Icon(
                                                Icons.device_unknown_outlined),
                                            message:
                                                Text(state.f.getErrorMessage()),
                                            callBack: IconButton(
                                              onPressed: () {
                                                BlocProvider.of<TrainingBloc>(
                                                        context)
                                                    .add(GetProgramEvent());
                                              },
                                              icon: Icon(Icons.refresh),
                                            ),
                                          ),
                                        ),
                                      );
                                  }
                                }
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          [
                            BlocBuilder<TrainingBloc, TrainingState>(
                              builder: (context, state) {
                                if (state is TrainingProgramLoadedState) {
                                  return Column(
                                    children: [
                                      for (int index = 0; index < 8; index++)
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          padding: const EdgeInsets.all(8.0),
                                          child: ExerciseWidget3(
                                            exercise:
                                                state.program.exercises[index],
                                            isCompleted:
                                                completed.contains(index),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    ExerciseInfoDialog(
                                                  weightCtl: weightCtl,
                                                  // e: Exercise(
                                                  //     id: "0",
                                                  //     name: "name",
                                                  //     tId: "tId",
                                                  //     imageUrl:
                                                  //         "images/img/${img[index]}",
                                                  //     description:
                                                  //         "description description description description description description description"),
                                                  e: state
                                                      .program.exercises[index],
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
                                    ],
                                  );
                                } else if (state is TrainingProgramErrorState) {
                                  print(
                                      "inside blocbuilder ${state.f.runtimeType}");
                                  switch (state.f.runtimeType) {
                                    case NoGymSpecifiedFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: Icon(
                                            Icons.qr_code_2_rounded,
                                            size: 50,
                                          ),
                                          message: Text(
                                              " a really long text to put here"),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    case NoInternetConnectionFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: Icon(
                                            Icons.wifi_off_rounded,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                          message:
                                              Text("No Internet Connection"),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    case ServerFailure:
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        alignment: Alignment.center,
                                        child: ReloadScreenWiget(
                                          image: const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                          message:
                                              Text(state.f.getErrorMessage()),
                                          callBack: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<TrainingBloc>(
                                                      context)
                                                  .add(GetProgramEvent());
                                            },
                                            icon: const Icon(Icons.refresh),
                                          ),
                                        ),
                                      );
                                    default:
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        child: Center(
                                          child: ReloadScreenWiget(
                                            image: const Icon(
                                                Icons.device_unknown_outlined),
                                            message:
                                                Text(state.f.getErrorMessage()),
                                            callBack: IconButton(
                                              onPressed: () {
                                                BlocProvider.of<TrainingBloc>(
                                                        context)
                                                    .add(GetProgramEvent());
                                              },
                                              icon: Icon(Icons.refresh),
                                            ),
                                          ),
                                        ),
                                      );
                                  }
                                }
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
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
            // if (completed.length != 8) {
            //   completed.clear();
            //   completed.addAll([for (int i = 0; i < 8; i++) i]);
            // } else {
            //   completed.clear();
            // }
            // setState(() {});
            // final either = await widget.trainingUsecases.getTrainingProgram();
            // either.fold((f) {
            //   print(f.getErrorMessage());
            // }, (unit) {
            //   print(unit);
            // });

            // BlocProvider.of<AuthBloc>(context).add(AuthCheckEvent());
            // BlocProvider.of<HandshakeBloc>(context).add(GetAllHandShakeEvent());

            BlocProvider.of<TrainingBloc>(context).add(const GetProgramEvent());
          },
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          foregroundColor: Colors.white,
          child: const Icon(Icons.done_all),
        ),
      ),
    );
  }
}
