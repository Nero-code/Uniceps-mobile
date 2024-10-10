import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Training/views/bloc/current_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
import 'package:uniceps/features/Training/views/bloc/exercises_bloc.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_info.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_list.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/my_gym_widget.dart';
import 'package:uniceps/features/Training/views/widgets/panal_circle.dart';
import 'package:uniceps/features/Training/views/widgets/training_day_list_item.dart';
import 'package:uniceps/features/Training/views/widgets/training_group(2).dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/main_cubit/training_section_cubit.dart';

class MuscleGroup {
  final String title;
  final int num;

  const MuscleGroup(this.title, this.num);
}

final enTrSections = [
  const MuscleGroup("Chest", 1),
  const MuscleGroup("Back", 3),
  const MuscleGroup("Biceps", 5),
  const MuscleGroup("Triceps", 6),
  const MuscleGroup("Shoulder", 2),
  const MuscleGroup("Legs", 4),
  const MuscleGroup("Calves", 7),
  const MuscleGroup("Abs", 8),
];

final arTrSections = [
  const MuscleGroup("صدر", 1),
  const MuscleGroup("ظهر", 3),
  const MuscleGroup("باي", 5),
  const MuscleGroup("تراي", 6),
  const MuscleGroup("أكتاف", 2),
  const MuscleGroup("أرجل", 4),
  const MuscleGroup("بطة الرجل", 7),
  const MuscleGroup("معدة", 8),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.trainingUsecases});

  final TrainingUsecases trainingUsecases;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // final Logger logger;
  final weightCtl = TextEditingController();

  String? section, currentSection;
  final sheetPosition = 0.5;
  // final maxSheetSize = 0.33;

  // final duration = const Duration(milliseconds: 500);
  final duration = Durations.long1;
  final curve = Curves.easeOutExpo;

  int selectedGroup = 0;
  bool isGrid = false;
  bool isSheetOpen = false;
  // double gymSheetPosition = 0.4;
  // double daysSheetPosition = 0.4;

  final List<String> completed = [];

  String gymId = '';

  final filtersController = ScrollController();
  final exercisesController = ScrollController();

  late final PanelController panelController;
  late final PanelController daysController;

  void openSheet() {}

  // void closeSheets() {
  //   isSheetOpen = false;
  //   panelController.close();
  //   // setState(() {});
  // }

  @override
  void initState() {
    panelController = PanelController();
    daysController = PanelController();
    WidgetsFlutterBinding.ensureInitialized();

    context.read<TrainingSectionCubit>().getSection().then(
      (value) {
        if (value != null) {
          setState(() {
            section = value;
          });
        }
      },
    );

    super.initState();
  }

// Dispose the controllers to prevent memory leaks
  @override
  void dispose() {
    filtersController.dispose();
    exercisesController.dispose();
    weightCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final trSections =
        context.read<LocaleCubit>().state.isRtl() ? arTrSections : enTrSections;
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    return RestorationScope(
      restorationId: "HomePage",
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (isSheetOpen) {
            panelController.animatePanelToPosition(
              0.0,
              duration: duration,
              curve: curve,
            );
            daysController.animatePanelToPosition(
              0.0,
              duration: duration,
              curve: curve,
            );
            isSheetOpen = false;
          } else if (context.mounted) {
            // Navigator.pop(context);
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          body: SlidingUpPanel(
            backdropEnabled: true,
            color: Colors.white,
            controller: daysController,
            minHeight: 0.0,
            maxHeight: MediaQuery.of(context).size.height,
            padding: EdgeInsets.zero,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            panel: BlocBuilder<TrainingBloc, TrainingState>(
              builder: (context, state) {
                if (state is TrainingProgramLoadedState) {
                  return Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30),
                                ),
                                child: Image(
                                  image: AssetImage("images/photos/back.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: CustomPaint(
                                  painter: PanaleCirclePainter(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: ColoredBox(
                                color: background,
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 50),
                                          for (var i in state
                                              .program.daysGroupMap.entries)
                                            TrainingDayItem(
                                              title: "${i.value}",
                                              isSelected: section != null &&
                                                  section == "${i.value}",
                                              onChanged: (val) async {
                                                print(
                                                    "Training DAYS new val: $val");

                                                setState(() {
                                                  section = i.value.toString();
                                                });
                                                await BlocProvider.of<
                                                            TrainingSectionCubit>(
                                                        context)
                                                    .cacheSection(
                                                        section.toString());

                                                await daysController
                                                    .animatePanelToPosition(
                                                  0.0,
                                                  duration: duration,
                                                  curve: curve,
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: ColoredBox(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        child: Column(
                                          children: [
                                            Text(
                                              local.dayQuete,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              local.letsStart,
                                              style: const TextStyle(
                                                // color: Theme.of(context).colorScheme.primary,
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is TrainingProgramErrorState) {
                  return ReloadScreenWidget(
                    f: state.f,
                    callBack: () {
                      BlocProvider.of<TrainingBloc>(context)
                          .add(const GetProgramEvent());
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            body: SlidingUpPanel(
              color: Colors.grey.shade100,
              backdropEnabled: true,
              controller: panelController,
              minHeight: 0.0,
              maxHeight: MediaQuery.of(context).size.height * 0.4,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              onPanelClosed: () {
                gymId = '';
                setState(() {});
              },
              panel: BlocBuilder<CurrentGymBloc, CurrentGymState>(
                builder: (context, state) {
                  print("DEBUG: state: ${state.runtimeType}");

                  if (state is CurrentGymLoadedState) {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.remove_rounded,
                                size: 40,
                                color: Colors.grey,
                              ),
                              // const SizedBox(height: 20),
                              for (var i in state.myGyms)
                                // GymWidget2(
                                //     gym: i,
                                //     icon: Icon(Icons.ac_unit_sharp),
                                //     onPressed: () async {
                                //       print("Clicked: $i");
                                //       BlocProvider.of<CurrentGymBloc>(context)
                                //           .add(SetSelectedGymEvent(gymId: i.id));
                                //       final bloc =
                                //           await BlocProvider.of<CurrentGymBloc>(
                                //                   context)
                                //               .stream
                                //               .skip(1)
                                //               .first;
                                //       if (bloc is CurrentGymUpdatedState &&
                                //           context.mounted) {
                                //         BlocProvider.of<TrainingBloc>(context)
                                //             .add(const GetProgramEvent());
                                //       }
                                //     }),

                                MyGymWidget(
                                  myGym: i,
                                  isCurrent: i.isCurrent,
                                  isSelected: gymId == i.id,
                                  onPressed: i.isCurrent
                                      ? null
                                      : () {
                                          gymId = i.id;
                                          setState(() {});
                                        },
                                ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 15.0,
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          child: ActionChip.elevated(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            label: SizedBox(
                              width: 150,
                              child: Center(
                                child: Text(
                                  local.apply,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (gymId.isNotEmpty) {
                                BlocProvider.of<CurrentGymBloc>(context).add(
                                  SetSelectedGymEvent(gymId: gymId),
                                );
                              }
                              panelController.animatePanelToPosition(
                                0.0,
                                duration: duration,
                                curve: curve,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is CurrentGymErrorState) {
                    print("DEBUG: state: ${state.f}");
                    return ReloadScreenWidget(
                      f: state.f,
                      callBack: () {
                        BlocProvider.of<CurrentGymBloc>(context)
                            .add(const GetSubscribedToGymEvent());
                      },
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
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
                          // mainBlueDark,
                          Theme.of(context).colorScheme.primary,
                          // Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,

                          Theme.of(context).colorScheme.background,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.1,
                          // 0.5,
                          0.8,
                          1,
                        ],
                      ),
                    ),
                  ),

                  RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<TrainingBloc>(context)
                          .add(const GetProgramEvent());

                      BlocProvider.of<CurrentGymBloc>(context)
                          .add(const GetSubscribedToGymEvent());

                      BlocProvider.of<ProfileBloc>(context)
                          .add(const GetProfileDataEvent());
                      // await BlocProvider.of<TrainingBloc>(context)
                      //     .stream
                      //     .skip(1)
                      //     .first;
                    },
                    child: SafeArea(
                      child: Column(
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, playerState) {
                              //
                              //   H O M E   C A R D
                              //
                              print(
                                  "HOME SCREEN: profile state: ${playerState.runtimeType}");
                              if (playerState is ProfileLoadedState) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        textDirection: TextDirection.ltr,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 50),
                                          Row(
                                            children: [
                                              Text(
                                                local.hello,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white
                                                        .withAlpha(150),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                playerState.player.name
                                                    .split(" ")[0],
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed(ROUTE_PROFILE);
                                            },
                                            icon: const Icon(
                                              Icons.person,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    BlocConsumer<ProfileBloc, ProfileState>(
                                      listener: (context, state) {
                                        print("DEBUG: ${state.runtimeType}");
                                        if (state is CurrentGymUpdatedState) {
                                          BlocProvider.of<CurrentGymBloc>(
                                                  context)
                                              .add(
                                                  const GetSubscribedToGymEvent());

                                          BlocProvider.of<TrainingBloc>(context)
                                              .add(const GetProgramEvent());
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is ProfileLoadedState) {
                                          return HomeCard(
                                            section: section ?? local.map,
                                            // myGym: state.current,
                                            player: state.player,
                                            openQRPopup: () {},
                                            openGymSheet: () {
                                              if (!panelController.isAttached) {
                                                return;
                                              }
                                              isSheetOpen = true;
                                              panelController
                                                  .animatePanelToPosition(
                                                1.0,
                                                duration: duration,
                                                curve: curve,
                                              );
                                            },
                                            openSectionSheet: () {
                                              if (!daysController.isAttached) {
                                                return;
                                              }
                                              isSheetOpen = true;
                                              daysController
                                                  .animatePanelToPosition(
                                                1.0,
                                                duration: Durations.extralong4,
                                                curve: Curves.bounceOut,
                                              );
                                            },
                                          );
                                        } else if (state is ProfileErrorState) {
                                          return const SizedBox();
                                        }
                                        return Material(
                                          elevation: 3,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else if (playerState is ProfileErrorState) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.1),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      child: Center(
                                        child: ErrorScreenWidget(
                                          f: playerState.failure,
                                          callback: () {
                                            BlocProvider.of<ProfileBloc>(
                                                    context)
                                                .add(
                                                    const GetProfileDataEvent());
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (playerState is ProfileInitial ||
                                  playerState is ProfileSubmittedState) {
                                BlocProvider.of<ProfileBloc>(context)
                                    .add(const GetProfileDataEvent());
                                return const SizedBox();
                              }
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.1),
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 15.0),

                          //
                          //    C H O O S E   S E C T I O N   W I D G E T
                          //
                          BlocConsumer<TrainingBloc, TrainingState>(
                            listener: (context, state) {
                              if (state is TrainingProgramLoadedState) {
                                print("exercise refresh");
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
                                    //
                                    //    F I L T E R S   L I S T V I E W
                                    //
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: ListView.separated(
                                        controller: filtersController,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 8.0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 8,
                                        itemBuilder: (context, index) {
                                          return TrainingGroup2(
                                            name: trSections[index].title,
                                            isSelected:
                                                trSections[selectedGroup].num ==
                                                    trSections[index].num,
                                            isToday: index > 3,
                                            onPressed: () {
                                              BlocProvider.of<ExercisesBloc>(
                                                      context)
                                                  .add(
                                                GetExercisesByFilterEvent(
                                                    trSections[index].num),
                                              );
                                              setState(() {
                                                selectedGroup = index;
                                              });

                                              exercisesController.animateTo(0.0,
                                                  duration: duration,
                                                  curve: curve);
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
                          //
                          //  E X E R C I S E S   L I S T V I E W
                          //
                          Expanded(
                            child: GestureDetector(
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity == null) {
                                  return;
                                }
                                if (details.primaryVelocity! < 0) {
                                  print("Left");
                                  if (isRtl && selectedGroup > 0) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[--selectedGroup].num));
                                  } else if (!isRtl && selectedGroup < 7) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[++selectedGroup].num));
                                  }
                                } else if (details.primaryVelocity! > 0) {
                                  print("Right");
                                  if (isRtl && selectedGroup < 7) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[++selectedGroup].num));
                                  } else if (!isRtl && selectedGroup > 0) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[--selectedGroup].num));
                                  }
                                }
                                exercisesController.animateTo(0.0,
                                    duration: duration, curve: curve);
                                setState(() {});
                                filtersController.animateTo(selectedGroup * 100,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              child: SingleChildScrollView(
                                controller: exercisesController,
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
                                            BlocProvider.of<ExercisesBloc>(
                                                    context)
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
                                                    // height: MediaQuery.of(context)
                                                    //         .size
                                                    //         .height *
                                                    //     0.2,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 5.0),
                                                    child: ExerciseListTile(
                                                      exercise: index,
                                                      isCompleted: completed
                                                          .contains(index.id),
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              ExerciseInfoDialog(
                                                            weightCtl:
                                                                weightCtl,
                                                            e: index,
                                                            onPressed:
                                                                (newVal) {
                                                              BlocProvider.of<
                                                                          ExercisesBloc>(
                                                                      context)
                                                                  .add(
                                                                UpdateLastWeightEvent(
                                                                    eId: index
                                                                        .id,
                                                                    newVal:
                                                                        newVal),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      onCheck: () {
                                                        setState(() {
                                                          if (completed
                                                              .contains(
                                                                  index.id)) {
                                                            completed.remove(
                                                                index.id);
                                                          } else {
                                                            completed
                                                                .add(index.id);
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            );
                                          } else if (state
                                              is ExercisesErrorState) {
                                            print(
                                                "inside blocbuilder ${state.f.runtimeType}");
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              alignment: Alignment.center,
                                              child: ReloadScreenWidget(
                                                f: state.f,
                                                callBack: null,
                                              ),
                                            );
                                          } else if (state
                                              is ExercisesLoadingState) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7,
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          }
                                          return const SizedBox();
                                        },
                                      );
                                    } else if (tState
                                        is TrainingProgramErrorState) {
                                      return ReloadScreenWidget(
                                        f: tState.f,
                                        callBack: () {
                                          BlocProvider.of<TrainingBloc>(context)
                                              .add(const GetProgramEvent());
                                        },
                                      );
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
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            strokeCap: StrokeCap.round,
                                            strokeWidth: 3,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 30),
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

                  // if (isSheetOpen)
                  //   SizedBox(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height,
                  //     child: ColoredBox(
                  //       color: Colors.black.withAlpha(100),
                  //       child: GestureDetector(onTap: closeSheets),
                  //     ),
                  //   ),
                ],
              ),
            ),
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
