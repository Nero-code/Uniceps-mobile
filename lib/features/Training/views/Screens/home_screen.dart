// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_widget_2.dart';
// import 'package:uniceps/features/Profile/presentation/widgets/gym_widget_2.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
import 'package:uniceps/features/Training/views/bloc/exercises_bloc.dart';
// import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_info.dart';
// import 'package:uniceps/features/Training/views/widgets/exercise_grid.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_list.dart';
// import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';
// import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/training_day_list_item.dart';
import 'package:uniceps/features/Training/views/widgets/training_group(2).dart';
// import 'package:uniceps/features/Training/views/widgets/training_group.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/main_cubit/training_section_cubit.dart';

// final img = [
//   "1",
//   "2",
//   "3",
//   "4",
//   "5",
//   "6",
//   "7",
//   "8"
// ];
final enTrSections = [
  "Chest",
  "Shoulder",
  "Back",
  "Legs",
  "Biceps",
  "Triceps",
  "Calves",
  "Abs",
];
final arTrSections = [
  "صدر",
  "أكتاف",
  "ظهر",
  "أرجل",
  "باي",
  "تراي",
  "بطة الرجل",
  "معدة",
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

  String? section;
  static const sheetPosition = 0.5;

  int selectedGroup = -1;
  bool isGrid = false;
  bool isGymSheetOpen = false;
  bool isTrainingDaysSheetOpen = false;
  double gymSheetPosition = 0.0;
  double daysSheetPosition = 0.0;

  final List<String> completed = [];

  final gymsController = DraggableScrollableController();
  final daysController = DraggableScrollableController();

  void closeSheets() {
    isGymSheetOpen = false;
    gymSheetPosition = 0.0;
    isTrainingDaysSheetOpen = false;
    daysSheetPosition = 0.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final trSections =
        context.read<LocaleCubit>().state.isRtl() ? arTrSections : enTrSections;
    return RestorationScope(
      restorationId: "HomePage",
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (isGymSheetOpen || isTrainingDaysSheetOpen) {
            closeSheets();
          } else if (context.mounted) {
            // Navigator.pop(context);
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          // backgroundColor: Theme.of(context).colorScheme.background,
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).colorScheme.background,
          //   title: const Text("Uniceps"),
          //   bottom: PreferredSize(
          //     preferredSize: Size(MediaQuery.of(context).size.width, 100),
          //     child: BlocBuilder<ProfileBloc, ProfileState>(
          //       builder: (context, playerState) {
          //         //
          //         //   H O M E   C A R D
          //         //
          //         print(
          //             "HOME SCREEN: profile state: ${playerState.runtimeType}");
          //         if (playerState is ProfileLoadedState) {
          //           return Column(
          //             children: [
          //               HomeCard(
          //                 player: playerState.player,
          //                 onTap: () {
          //                   Navigator.pushNamed(context, ROUTE_PROFILE);
          //                 },
          //                 onLongPress: () {
          //                   isGymSheetOpen = true;
          //                    = 0.2;
          //                   setState(() {});
          //                 },
          //               ),
          //             ],
          //           );
          //         } else if (playerState is ProfileErrorState) {
          //           return Center(child: Text(local.error));
          //         } else if (playerState is ProfileInitial ||
          //             playerState is ProfileSubmittedState) {
          //           BlocProvider.of<ProfileBloc>(context)
          //               .add(const GetProfileDataEvent());
          //           return const SizedBox();
          //         }
          //         return const Center(child: CircularProgressIndicator());
          //       },
          //     ),
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () async {
          //         showDialog(
          //           context: context,
          //           builder: (context) =>
          //               BlocBuilder<ProfileBloc, ProfileState>(
          //             builder: (context, state) {
          //               if (state is ProfileLoadedState) {
          //                 return AlertDialog(
          //                   // title:
          //                   content: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       QrImageView(
          //                         padding: const EdgeInsets.all(15.0),
          //                         // data: profile.uid,
          //                         data: state.player.uid,
          //                       ),
          //                       const Divider(),
          //                       Center(
          //                         child: Text(
          //                           state.player.name,
          //                           style: const TextStyle(
          //                               fontSize: 25,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ).build(context);
          //               } else if (state is ProfileErrorState) {
          //                 return Center(
          //                   child: Text(local.error),
          //                 );
          //               }
          //               return const CircularProgressIndicator();
          //             },
          //           ),
          //         );
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
          body: Stack(
            children: [
              // CustomScrollView(
              //   slivers: [
              // SliverAppBar(
              //   title: const Text(APP_NAME),
              //   actions: [
              //     IconButton(
              //       onPressed: () {
              //         showDialog(
              //           context: context,
              //           builder: (context) =>
              //               BlocBuilder<ProfileBloc, ProfileState>(
              //             builder: (context, state) {
              //               if (state is ProfileLoadedState) {
              //                 return AlertDialog(
              //                   // title:
              //                   content: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       QrImageView(
              //                         padding: const EdgeInsets.all(15.0),
              //                         // data: profile.uid,
              //                         data: state.player.uid,
              //                       ),
              //                       const Divider(),
              //                       Center(
              //                         child: Text(
              //                           state.player.name,
              //                           style: const TextStyle(
              //                               fontSize: 25,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ).build(context);
              //               } else if (state is ProfileErrorState) {
              //                 return Center(
              //                   child: Text(local.error),
              //                 );
              //               }
              //               return const CircularProgressIndicator();
              //             },
              //           ),
              //         );
              //       },
              //       icon: const Icon(Icons.qr_code),
              //     ),
              //   ],
              //   expandedHeight: MediaQuery.of(context).size.height * 0.22,
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: Container(
              //       margin: EdgeInsets.only(
              //           top: MediaQuery.of(context).size.height * 0.1),
              //       alignment: Alignment.bottomCenter,
              //       child: BlocBuilder<ProfileBloc, ProfileState>(
              //         builder: (context, playerState) {
              //           //
              //           //   H O M E   C A R D
              //           //
              //           print(
              //               "HOME SCREEN: profile state: ${playerState.runtimeType}");
              //           if (playerState is ProfileLoadedState) {
              //             return Column(
              //               children: [
              //                 HomeCard(
              //                   player: playerState.player,
              //                   onTap: () {
              //                     Navigator.pushNamed(
              //                         context, ROUTE_PROFILE);
              //                   },
              //                 ),
              //               ],
              //             );
              //           } else if (playerState is ProfileErrorState) {
              //             return Center(child: Text(local.error));
              //           } else if (playerState is ProfileInitial ||
              //               playerState is ProfileSubmittedState) {
              //             BlocProvider.of<ProfileBloc>(context)
              //                 .add(const GetProfileDataEvent());
              //             return const SizedBox();
              //           }
              //           return const Center(
              //               child: CircularProgressIndicator());
              //         },
              //       ),
              //     ),
              //   ),
              //   // actions: [
              //   //   IconButton(
              //   //     onPressed: () async {
              //   //       Navigator.pushNamed(context, ROUTE_QR_SCANNER);
              //   //     },
              //   //     icon: const Icon(Icons.qr_code_scanner),
              //   //   ),
              //   // ],
              // ),

              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.3,
                      1,
                    ],
                  ),
                ),
              ),

              RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<TrainingBloc>(context)
                      .add(const GetProgramEvent());
                  await BlocProvider.of<TrainingBloc>(context)
                      .stream
                      .skip(1)
                      .first;
                },
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        // height: AppBar().preferredSize.height + 120,
                        // height: MediaQuery.of(context).size.height * 0.27,
                        child: BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, playerState) {
                            //
                            //   H O M E   C A R D
                            //
                            print(
                                "HOME SCREEN: profile state: ${playerState.runtimeType}");
                            if (playerState is ProfileLoadedState) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "مرحبا, ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    Colors.white.withAlpha(150),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${playerState.player.name}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  HomeCard(
                                    player: playerState.player,
                                    openQRPopup: () {
                                      // Navigator.pushNamed(
                                      //     context, ROUTE_PROFILE);

                                      showDialog(
                                        context: context,
                                        builder: (context) => BlocBuilder<
                                            ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            if (state is ProfileLoadedState) {
                                              return AlertDialog(
                                                // title:
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    QrImageView(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      // data: profile.uid,
                                                      data: state.player.uid,
                                                    ),
                                                    const Divider(),
                                                    Center(
                                                      child: Text(
                                                        state.player.name,
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).build(context);
                                            } else if (state
                                                is ProfileErrorState) {
                                              return Center(
                                                child: Text(local.error),
                                              );
                                            }
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                      );
                                    },
                                    openGymSheet: () {
                                      isGymSheetOpen = true;
                                      gymSheetPosition = sheetPosition;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              );
                            } else if (playerState is ProfileErrorState) {
                              return Center(child: Text(local.error));
                            } else if (playerState is ProfileInitial ||
                                playerState is ProfileSubmittedState) {
                              BlocProvider.of<ProfileBloc>(context)
                                  .add(const GetProfileDataEvent());
                              return const SizedBox();
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      // Container(
                      //   height: 1.0,
                      //   color: Color.fromARGB(255, 200, 200, 200),
                      //   margin: const EdgeInsets.only(bottom: 5.0),
                      // ),
                      //
                      //    C H O O S E   S E C T I O N   W I D G E T
                      //
                      BlocConsumer<TrainingBloc, TrainingState>(
                        listener: (context, state) {
                          if (selectedGroup == -1 &&
                              state is TrainingProgramLoadedState) {
                            BlocProvider.of<ExercisesBloc>(context)
                                .add(const GetExercisesByFilterEvent(1));
                            setState(() {
                              selectedGroup = 0;
                            });
                          }
                        },
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
                                    children: [
                                      IconButton(
                                        iconSize: 20.0,
                                        icon: Icon(
                                          Icons.notes_outlined,
                                        ),
                                        onPressed: () {
                                          isTrainingDaysSheetOpen = true;
                                          daysSheetPosition = sheetPosition;
                                          setState(() {});
                                        },
                                      ),
                                      Text(section ?? local.about),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.white,
                                      //     border: Border.all(
                                      //       color: Theme.of(context)
                                      //           .colorScheme
                                      //           .primary,
                                      //     ),
                                      //     borderRadius: BorderRadius.circular(5),
                                      //   ),
                                      //   child: DropdownButton<String>(
                                      //     // alignment: Alignment.center,
                                      //     underline: const SizedBox(),
                                      //     // padding: const EdgeInsets.symmetric(
                                      //     //     horizontal: 5.0),
                                      //     borderRadius: BorderRadius.circular(5),
                                      //     style: const TextStyle(
                                      //         fontSize: 11, color: Colors.black),
                                      //     isDense: true,
                                      //     selectedItemBuilder: (context) {
                                      //       return [
                                      //         for (var i in state
                                      //             .program.daysGroupMap.entries)
                                      //           Center(
                                      //             child: Padding(
                                      //               padding: const EdgeInsets
                                      //                   .symmetric(
                                      //                   horizontal: 8.0),
                                      //               child: Text(
                                      //                 i.value,
                                      //                 style: TextStyle(
                                      //                     fontSize: 14,
                                      //                     fontWeight:
                                      //                         FontWeight.bold),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //       ];
                                      //     },
                                      //     hint: const Center(
                                      //       child: Text(
                                      //         "Choose a section",
                                      //       ),
                                      //     ),
                                      //     value: section,
                                      //     dropdownColor: Colors.white,
                                      //     icon: const Icon(Icons.arrow_drop_down),
                                      //     elevation: 3,
                                      //     items: [
                                      //       for (var i in state
                                      //           .program.daysGroupMap.entries)
                                      //         DropdownMenuItem<String>(
                                      //           alignment: Alignment.center,
                                      //           value: i.value,
                                      //           child: SizedBox(
                                      //             width: MediaQuery.of(context)
                                      //                     .size
                                      //                     .width *
                                      //                 0.75,
                                      //             child: BlocBuilder<
                                      //                 TrainingSectionCubit,
                                      //                 TrainingSectionLoaded>(
                                      //               builder: (context, state) {
                                      //                 return Center(
                                      //                   child: Container(
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                             .symmetric(
                                      //                             horizontal:
                                      //                                 5.0),
                                      //                     decoration:
                                      //                         BoxDecoration(
                                      //                       color: state.section !=
                                      //                                   null &&
                                      //                               state.section ==
                                      //                                   i.value
                                      //                           ? Colors
                                      //                               .greenAccent
                                      //                           : null,
                                      //                       borderRadius:
                                      //                           BorderRadius
                                      //                               .circular(5),
                                      //                     ),
                                      //                     child: Text(
                                      //                       i.value,
                                      //                       style: TextStyle(
                                      //                           fontSize: 14),
                                      //                     ),
                                      //                   ),
                                      //                 );
                                      //               },
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       // DropdownMenuItem<String>(
                                      //       //   alignment: Alignment.center,
                                      //       //   value: "2",
                                      //       //   child: Text("2"),
                                      //       // ),
                                      //       // DropdownMenuItem<String>(
                                      //       //   alignment: Alignment.center,
                                      //       //   value: "3",
                                      //       //   child: Center(child: Text("3")),
                                      //       // ),
                                      //     ],
                                      //     onChanged: (val) async {
                                      //       print("Training DAYS new val: $val");
                                      //       if (val != null) {
                                      //         await BlocProvider.of<
                                      //                     TrainingSectionCubit>(
                                      //                 context)
                                      //             .cacheSection(val);
                                      //       }
                                      //       setState(() {
                                      //         section = val ?? "";
                                      //       });
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                //
                                //    F I L T E R S   L I S T V I E W
                                //
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      return TrainingGroup2(
                                        name: trSections[index],
                                        isSelected: selectedGroup == index,
                                        isToday: index > 3,
                                        onPressed: () {
                                          BlocProvider.of<ExercisesBloc>(
                                                  context)
                                              .add(GetExercisesByFilterEvent(
                                                  index + 1));
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
                                // BlocBuilder<ExercisesBloc, ExercisesState>(
                                //   builder: (context, eState) {
                                //     if(state is TrainingProgramLoadedState)
                                //   },
                                // ),
                              ],
                            );
                          }
                          return const SizedBox();
                        },
                      ),

                      // BlocBuilder<TrainingBloc,TrainingState>(builder: (context, state) {
                      //   return SizedBox();
                      // }),
                      //     ],
                      //   ),
                      // ),
                      // isGrid
                      //     ? SliverGrid(
                      //         gridDelegate:
                      //             const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 2,
                      //           crossAxisSpacing: 10.0,
                      //           mainAxisSpacing: 10.0,
                      //           childAspectRatio: 16 / 13,
                      //         ),
                      //         delegate: SliverChildListDelegate.fixed(
                      //           [
                      //             BlocBuilder<ExercisesBloc, ExercisesState>(
                      //               builder: (context, state) {
                      //                 print("Exercise Bloc State: ${state.runtimeType}");
                      //                 if (state is ExercisesLoadedState) {
                      //                   return Column(
                      //                     children: [
                      //                       for (var i in state.list)
                      //                         ExerciseGridTile(
                      //                           exercise: i,
                      //                           isCompleted: completed.contains(i.id),
                      //                           onPressed: () {
                      //                             showDialog(
                      //                               context: context,
                      //                               builder: (context) =>
                      //                                   ExerciseInfoDialog(
                      //                                 weightCtl: weightCtl,
                      //                                 e: i,
                      //                                 onPressed: (newVal) {},
                      //                               ),
                      //                             );
                      //                           },
                      //                           onCheck: () {
                      //                             setState(() {
                      //                               if (completed.contains(i.id)) {
                      //                                 completed.remove(i.id);
                      //                               } else {
                      //                                 completed.add(i.id);
                      //                               }
                      //                             });
                      //                           },
                      //                         ),
                      //                     ],
                      //                   );
                      //                 } else if (state is ExercisesErrorState) {
                      //                   print(
                      //                       "inside Exercisesbuilder ${state.f.runtimeType}");
                      //                   switch (state.f.runtimeType) {
                      //                     case NoGymSpecifiedFailure:
                      //                       return Container(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         alignment: Alignment.center,
                      //                         child: ReloadScreenWiget(
                      //                           image: Icon(
                      //                             Icons.qr_code_2_rounded,
                      //                             size: 50,
                      //                           ),
                      //                           message: Text(
                      //                               " a really long text to put here"),
                      //                           callBack: IconButton(
                      //                             onPressed: () {
                      //                               BlocProvider.of<TrainingBloc>(context)
                      //                                   .add(GetProgramEvent());
                      //                             },
                      //                             icon: Icon(Icons.refresh),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     case NoTrainingProgramFailure:
                      //                       return Container(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         alignment: Alignment.center,
                      //                         child: ReloadScreenWiget(
                      //                           image: Icon(
                      //                             Icons.qr_code_2_rounded,
                      //                             size: 50,
                      //                           ),
                      //                           message: Text(
                      //                               " a really long text to put here"),
                      //                           callBack: IconButton(
                      //                             onPressed: () {
                      //                               BlocProvider.of<TrainingBloc>(context)
                      //                                   .add(GetProgramEvent());
                      //                             },
                      //                             icon: Icon(Icons.refresh),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     case EmptyCacheFailure:
                      //                       print("HEEEEERRRRREEEEEE!!!!!!!!!");
                      //                       return Container(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         alignment: Alignment.center,
                      //                         child: ReloadScreenWiget(
                      //                           image: Icon(
                      //                             Icons.not_interested_rounded,
                      //                             size: 50,
                      //                             color: Colors.grey,
                      //                           ),
                      //                           message: Text(local!.emptyExc),
                      //                           callBack: IconButton(
                      //                             onPressed: null,
                      //                             icon: Icon(Icons.refresh),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     case NoInternetConnectionFailure:
                      //                       return Container(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         alignment: Alignment.center,
                      //                         child: ReloadScreenWiget(
                      //                           image: Icon(
                      //                             Icons.wifi_off_rounded,
                      //                             size: 50,
                      //                             color: Colors.grey,
                      //                           ),
                      //                           message: Text("No Internet Connection"),
                      //                           callBack: IconButton(
                      //                             onPressed: () {
                      //                               BlocProvider.of<TrainingBloc>(context)
                      //                                   .add(GetProgramEvent());
                      //                             },
                      //                             icon: Icon(Icons.refresh),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     case ServerFailure:
                      //                       return Container(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         alignment: Alignment.center,
                      //                         child: ReloadScreenWiget(
                      //                           image: const Icon(
                      //                             Icons.error,
                      //                             color: Colors.red,
                      //                             size: 50,
                      //                           ),
                      //                           message: Text(state.f.getErrorMessage()),
                      //                           callBack: IconButton(
                      //                             onPressed: () {
                      //                               BlocProvider.of<TrainingBloc>(context)
                      //                                   .add(GetProgramEvent());
                      //                             },
                      //                             icon: const Icon(Icons.refresh),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     default:
                      //                       return SizedBox(
                      //                         height: MediaQuery.of(context).size.height *
                      //                             0.7,
                      //                         child: Center(
                      //                           child: ReloadScreenWiget(
                      //                             image: const Icon(
                      //                                 Icons.device_unknown_outlined),
                      //                             message:
                      //                                 Text(state.f.getErrorMessage()),
                      //                             callBack: IconButton(
                      //                               onPressed: () {
                      //                                 BlocProvider.of<TrainingBloc>(
                      //                                         context)
                      //                                     .add(GetProgramEvent());
                      //                               },
                      //                               icon: Icon(Icons.refresh),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       );
                      //                   }
                      //                 }
                      //                 return SizedBox(
                      //                   height: MediaQuery.of(context).size.height * 0.7,
                      //                   child: const Center(
                      //                       child: CircularProgressIndicator()),
                      //                 );
                      //               },
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     :

                      Expanded(
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: BlocBuilder<TrainingBloc, TrainingState>(
                            builder: (context, tState) {
                              if (tState is TrainingProgramLoadedState) {
                                return BlocConsumer<ExercisesBloc,
                                    ExercisesState>(
                                  listener: (context, state) async {
                                    print(
                                        "Listener state: ${state.runtimeType}");

                                    if (state is ExercisesUpdatedState ||
                                        state is ExercisesInitial) {
                                      BlocProvider.of<ExercisesBloc>(context)
                                          .add(GetExercisesByFilterEvent(
                                              selectedGroup + 1));
                                      // BlocProvider.of<TrainingBloc>(context)
                                      //     .add(GetProgramEvent());
                                    }
                                  },
                                  builder: (context, state) {
                                    print(
                                        "Exercise Bloc State: ${state.runtimeType}");
                                    if (state is ExercisesLoadedState) {
                                      print(
                                          "Exercises Bloc Builder: list: ${state.list.length}");
                                      return Column(
                                        children: [
                                          for (var index in state.list)
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ExerciseListTile(
                                                exercise: index,
                                                isCompleted: completed
                                                    .contains(index.id),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        ExerciseInfoDialog(
                                                      weightCtl: weightCtl,
                                                      e: index,
                                                      onPressed: (newVal) {
                                                        BlocProvider.of<
                                                                    ExercisesBloc>(
                                                                context)
                                                            .add(
                                                          UpdateLastWeightEvent(
                                                              eId: index.id,
                                                              newVal: newVal),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                onCheck: () {
                                                  setState(() {
                                                    if (completed
                                                        .contains(index.id)) {
                                                      completed
                                                          .remove(index.id);
                                                    } else {
                                                      completed.add(index.id);
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                        ],
                                      );
                                    } else if (state is ExercisesErrorState) {
                                      print(
                                          "inside blocbuilder ${state.f.runtimeType}");
                                      switch (state.f.runtimeType) {
                                        case NoGymSpecifiedFailure:
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            alignment: Alignment.center,
                                            child: ReloadScreenWiget(
                                              image: const Icon(
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
                                        case NoTrainingProgramFailure:
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
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
                                        case EmptyCacheFailure:
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            alignment: Alignment.center,
                                            child: ReloadScreenWiget(
                                              image: Icon(
                                                Icons.not_interested_rounded,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                              message: Text(local.emptyExc),
                                              callBack: const SizedBox(),
                                            ),
                                          );

                                        case NoInternetConnectionFailure:
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            alignment: Alignment.center,
                                            child: ReloadScreenWiget(
                                              image: Icon(
                                                Icons.wifi_off_rounded,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                              message: Text(
                                                  "No Internet Connection"),
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            alignment: Alignment.center,
                                            child: ReloadScreenWiget(
                                              image: const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                                size: 50,
                                              ),
                                              message: Text(
                                                  state.f.getErrorMessage()),
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            child: Center(
                                              child: ReloadScreenWiget(
                                                image: const Icon(Icons
                                                    .device_unknown_outlined),
                                                message: Text(
                                                    state.f.getErrorMessage()),
                                                callBack: IconButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                TrainingBloc>(
                                                            context)
                                                        .add(GetProgramEvent());
                                                  },
                                                  icon: Icon(Icons.refresh),
                                                ),
                                              ),
                                            ),
                                          );
                                      }
                                    } else if (state is ExercisesLoadingState) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        child: const Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                    return SizedBox();
                                  },
                                );
                              } else if (tState is TrainingProgramErrorState) {
                                return ReloadScreenWiget(
                                    image: Text(
                                        "state Error: ${tState.f.getErrorMessage()}"),
                                    message: Text(
                                        "state Error: ${tState.f.getErrorMessage()}"),
                                    callBack: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<TrainingBloc>(context)
                                              .add(const GetProgramEvent());
                                        },
                                        icon: const Icon(Icons.refresh)));
                              }
                              // else if (tState is TrainingInitial) {
                              //   BlocProvider.of<TrainingBloc>(context)
                              //       .add(GetProgramEvent());
                              // }
                              else {
                                // BlocProvider.of<ExercisesBloc>(context)
                                //     .add(ResetExcersiesEvent());
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      strokeWidth: 10,
                                      color: Colors.amber,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // ),
                      //   ],
                      // ),
                      // BlocBuilder<HandshakeBloc, HandshakeState>(
                      //   builder: (context, state) {
                      //     var  = 0.0;
                      //     if (state is HandshakeLoadingState) {
                      //        = 0.2;
                      //     } else if (state is HandshakeErrorState) {
                      //        = 0.5;
                      //     }
                      //     return DraggableScrollableSheet(
                      //       initialChildSize: ,
                      //       minChildSize: 0.0,
                      //       controller: controller,
                      //       builder: (context, scrollController) {
                      //         if (state is HandshakeLoadedState) {
                      //           return SingleChildScrollView(
                      //             child: Column(
                      //               children: [
                      //                 for (var i = 0; i < 10; i++) Text("$i"),
                      //               ],
                      //             ),
                      //           );
                      //         } else if (state is HandshakeErrorState) {
                      //           return ReloadScreenWiget(
                      //             image: Icon(Icons.error),
                      //             message: Text(state.f.getErrorMessage()),
                      //             callBack: IconButton(
                      //               onPressed: () {},
                      //               icon: Icon(Icons.refresh),
                      //             ),
                      //           );
                      //         }
                      //         return const CircularProgressIndicator();
                      //       },
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   child: ColoredBox(
              //     color: Colors.grey.shade700.withAlpha(150),
              //   ),
              // ),

              if (isGymSheetOpen || isTrainingDaysSheetOpen)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ColoredBox(
                    color: Colors.black.withAlpha(100),
                    child: GestureDetector(onTap: closeSheets),
                  ),
                ),
              BlocBuilder<HandshakeBloc, HandshakeState>(
                builder: (context, state) {
                  // if (state is HandshakeLoadingState) {
                  //   gymSheetPosition = 0.2;
                  // } else if (state is HandshakeErrorState) {
                  //   gymSheetPosition = 0.3;
                  // }
                  return DraggableScrollableSheet(
                    initialChildSize: gymSheetPosition,
                    minChildSize: 0.0,
                    controller: gymsController,
                    builder: (context, scrollController) {
                      if (state is HandshakeLoadedState) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Icon(
                                //   Icons.remove_rounded,
                                //   size: 40,
                                //   color: Colors.grey,
                                // ),
                                const SizedBox(height: 20),
                                for (var i = 0; i < 10; i++)
                                  // TextButton(
                                  //     onPressed: () {}, child: Text("asdasd")),
                                  GymWidget2(
                                      gym: Gym(
                                          id: "id",
                                          name: "GYM",
                                          address: "address",
                                          logo: "logo",
                                          ownerName: "ownerName",
                                          phoneNum: "phoneNum",
                                          telephone: "telephone",
                                          joinedAt: DateTime.now()),
                                      onPressed: () {}),
                              ],
                            ),
                          ),
                        );
                      } else if (state is HandshakeErrorState) {
                        return ReloadScreenWiget(
                          image: Icon(Icons.error),
                          message: Text(state.f.getErrorMessage()),
                          callBack: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.refresh),
                          ),
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
              BlocBuilder<TrainingBloc, TrainingState>(
                  builder: (context, state) {
                // if (state is TrainingProgramLoadingState) {
                //   daysSheetPosition = 0.2;
                // } else if (state is HandshakeErrorState) {
                //   daysSheetPosition = 0.5;
                // }
                return DraggableScrollableSheet(
                  initialChildSize: daysSheetPosition,
                  minChildSize: 0.0,
                  controller: daysController,
                  builder: (context, scrollController) {
                    if (state is TrainingProgramLoadedState) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var i in state.program.daysGroupMap.entries)
                                TrainingDayItem(
                                    title: "${i.value}",
                                    isSelected: section != null &&
                                        section == "${i.value}",
                                    onChanged: (val) async {
                                      print("Training DAYS new val: $val");

                                      await BlocProvider.of<
                                              TrainingSectionCubit>(context)
                                          .cacheSection(i.value.toString());

                                      setState(() {
                                        section = i.value.toString();
                                      });
                                    }),
                            ],
                          ),
                        ),
                      );
                    } else if (state is TrainingProgramErrorState) {
                      return ReloadScreenWiget(
                        image: const Icon(Icons.error),
                        message: Text(state.f.getErrorMessage()),
                        callBack: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.refresh),
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                );
              })
            ],
          ),

          // } else if(TrainingProgramErrorState) {
          //   return Center(
          //     child: Text("No Records!"),  // SHOULD NAVIGATE TO GYMS LIST
          //   );
          // } else {
          //   return const Center(child: CircularProgressIndicator());
          // }
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     // if (completed.length != 8) {
          //     //   completed.clear();
          //     //   completed.addAll([for (int i = 0; i < 8; i++) i]);
          //     // } else {
          //     //   completed.clear();
          //     // }
          //     // setState(() {});
          //     // final either = await widget.trainingUsecases.getTrainingProgram();
          //     // either.fold((f) {
          //     //   print(f.getErrorMessage());
          //     // }, (unit) {
          //     //   print(unit);
          //     // });
          //     // BlocProvider.of<AuthBloc>(context).add(AuthCheckEvent());
          //     // BlocProvider.of<HandshakeBloc>(context).add(GetAllHandShakeEvent());
          //     BlocProvider.of<TrainingBloc>(context).add(const GetProgramEvent());
          //   },
          //   backgroundColor: Theme.of(context).colorScheme.onBackground,
          //   foregroundColor: Colors.white,
          //   child: const Icon(Icons.done_all),
          // ),
        ),
      ),
    );
  }
}
