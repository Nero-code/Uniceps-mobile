import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/blocs/routine_management/routine_management_bloc.dart';
import 'package:uniceps/app/presentation/screens/home/dialogs/comming_soon_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_management_screen.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/app/services/image_cache_manager.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/app/presentation/blocs/current_gym/current_gym_bloc.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_bloc.dart';
import 'package:uniceps/app/domain/commands/training_usecases/training_usecases.dart';
import 'package:uniceps/app/presentation/blocs/exercises/exercises_bloc.dart';
import 'package:uniceps/app/presentation/blocs/training/training_bloc.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/exercise_alert.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/exercise_list.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/home_card.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/mygym_widget.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/sliding_panal_decoration.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/progress_widget.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/training_day_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/screens/home/widgets/training_group.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/main_cubit/training_section_cubit.dart';
import 'package:uniceps/app/services/update_service.dart';
import 'package:alert_banner/exports.dart' as b;
import 'package:uniceps/injection_dependency.dart' as di;

// final enTrSections = [
//   const MuscleGroup(groupName: "Legs", id: 4),
//   const MuscleGroup(groupName: "Calves", id: 7),
//   const MuscleGroup(groupName: "Chest", id: 1),
//   const MuscleGroup(groupName: "Back", id: 3),
//   const MuscleGroup(groupName: "Shoulder", id: 2),
//   const MuscleGroup(groupName: "Biceps", id: 5),
//   const MuscleGroup(groupName: "Triceps", id: 6),
//   const MuscleGroup(groupName: "Abs", id: 8),
// ];

// final arTrSections = [
//   const MuscleGroup(groupName: "أرجل", id: 4),
//   const MuscleGroup(groupName: "بطة الرجل", id: 7),
//   const MuscleGroup(groupName: "صدر", id: 1),
//   const MuscleGroup(groupName: "ظهر", id: 3),
//   const MuscleGroup(groupName: "أكتاف", id: 2),
//   const MuscleGroup(groupName: "باي", id: 5),
//   const MuscleGroup(groupName: "تراي", id: 6),
//   const MuscleGroup(groupName: "معدة", id: 8),
// ];

final trSections = [
  const MuscleGroup(enGroupName: "Legs", arGroupName: "أرجل", id: 4),
  const MuscleGroup(enGroupName: "Calves", arGroupName: "بطة الرجل", id: 7),
  const MuscleGroup(enGroupName: "Chest", arGroupName: "صدر", id: 1),
  const MuscleGroup(enGroupName: "Back", arGroupName: "ظهر", id: 3),
  const MuscleGroup(enGroupName: "Shoulder", arGroupName: "أكتاف", id: 2),
  const MuscleGroup(enGroupName: "Biceps", arGroupName: "باي", id: 5),
  const MuscleGroup(enGroupName: "Triceps", arGroupName: "تراي", id: 6),
  const MuscleGroup(enGroupName: "Abs", arGroupName: "معدة", id: 8),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.trainingUsecases,
    required this.service,
    required this.manager,
  });

  final TrainingUsecases trainingUsecases;
  final UpdateService service;
  final ImageCacheManager manager;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // final Logger logger;
  final weightCtl = TextEditingController();

  String? section;
  final sheetPosition = 0.5;
  // final maxSheetSize = 0.33;

  // final duration = const Duration(milliseconds: 500);
  final duration = Durations.long1;
  final curve = Curves.easeOutExpo;

  int selectedGroup = 0;
  bool isGrid = false;
  bool isSheetOpen = false;
  bool isUpdateChecked = false;
  bool isRoutineLoading = false;
  // double gymSheetPosition = 0.4;
  // double daysSheetPosition = 0.4;

  final List<String> completed = [];

  String gymId = '';

  final filtersController = ScrollController();
  final exercisesController = ScrollController();

  late final PanelController panelController;
  late final PanelController daysController;
  late final StreamSubscription streamSubscription;

  void addPostFrameCallback(Function callback) =>
      WidgetsBinding.instance.addPostFrameCallback((_) => callback());

  void checkUpdate(BuildContext context) async {
    if (isUpdateChecked) return;
    // print("update service function started");

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(3.0),
          content: Center(
            child: Text(
              AppLocalizations.of(context)!.chackForUpdate,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
      );
    }

    if (await widget.service.isUpdateAvailable()) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.newVersion),
            actions: [
              ElevatedButton(
                onPressed: widget.service.updateAvailable != null &&
                        widget.service.updateAvailable!.playUrl.isNotEmpty
                    ? () {
                        widget.service.updatefromStore();
                        Navigator.pop(context);
                      }
                    : null,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Play Store"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Image(
                      width: 20,
                      height: 20,
                      image: AssetImage("images/play_store.png"),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.service.updatefromApi();
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TrioVerse"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(Icons.download),
                  ],
                ),
              ),
            ],
          ).build(context),
        );
      }
    }
    isUpdateChecked = true;
  }

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

    addPostFrameCallback(() => checkUpdate(context));

    streamSubscription = FirebaseMessaging.onMessage.listen(
      (event) {
        if (context.mounted) {
          b.showAlertBanner(
            // ignore: use_build_context_synchronously
            context,
            () {},
            durationOfStayingOnScreen: const Duration(seconds: 5),
            Material(
              elevation: 3,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.circle_notifications_rounded,
                          color: secondaryBlue,
                          size: 40,
                        ),
                        Text(
                          "${event.notification?.title}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.circle_notifications_rounded,
                          color: Colors.transparent,
                          size: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "${event.notification?.body}",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );

    super.initState();
  }

// Dispose the controllers to prevent memory leaks
  @override
  void dispose() async {
    filtersController.dispose();
    exercisesController.dispose();
    weightCtl.dispose();
    await streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    final screenSize = MediaQuery.sizeOf(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
    );

    return RestorationScope(
      restorationId: "HomePage",
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
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
          drawer: Drawer(),
          body: SlidingUpPanel(
            backdropEnabled: true,
            color: Colors.white,
            controller: daysController,
            minHeight: 0.0,
            maxHeight: screenSize.height,
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
                              width: screenSize.width,
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
                                width: screenSize.width,
                                child: CustomPaint(
                                  painter: SlidingPanalPainter(),
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
                                          SizedBox(
                                            height: 50,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                          ),
                                          for (var i in state
                                              .program.daysGroupMap.entries)
                                            TrainingDayItem(
                                              title: "${i.value}",
                                              isSelected: section != null &&
                                                  section == "${i.value}",
                                              onChanged: (val) async {
                                                // print(
                                                //     "Training DAYS new val: $val");

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
                                      width: screenSize.width,
                                      child: ColoredBox(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
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
              maxHeight: screenSize.height * 0.4,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              onPanelClosed: () {
                gymId = '';
                setState(() {});
              },
              panel: BlocBuilder<CurrentGymBloc, CurrentGymState>(
                builder: (context, state) {
                  // print("DEBUG: state: ${state.runtimeType}");

                  if (state is CurrentGymLoadedState) {
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.sizeOf(context).height * 0.1,
                            ),
                            child: Column(
                              children: [
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
                        ),
                        Positioned(
                          top: 0.0,
                          width: MediaQuery.sizeOf(context).width,
                          child: Material(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            child: const Icon(
                              Icons.remove_rounded,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15.0,
                          width: screenSize.width,
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
                    // print("DEBUG: state: ${state.f}");
                    return ReloadScreenWidget(
                      f: state.f,
                      callBack: () {
                        BlocProvider.of<CurrentGymBloc>(context)
                            .add(const GetSubscribedToGymEvent());
                      },
                    );
                  }
                  if (state is CurrentGymUpdatedState) {
                    BlocProvider.of<CurrentGymBloc>(context)
                        .add(const GetSubscribedToGymEvent());

                    BlocProvider.of<TrainingBloc>(context)
                        .add(const GetProgramEvent());
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
              body: Stack(
                children: [
                  //
                  //  G R A D I E N T   B A C K G R O U N D
                  //
                  Container(
                    height: screenSize.height * 0.27,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // mainBlueDark,
                          Theme.of(context).colorScheme.primary,
                          // Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,

                          Theme.of(context).colorScheme.surface,
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
                      if (isRoutineLoading) return;
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
                              if (playerState is ProfileLoadedState) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      //
                                      //  N A M E   A N D   P R O F I L E   B U T T O N
                                      //
                                      child: Row(
                                        textDirection: TextDirection.ltr,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 50),
                                          //
                                          //  N A M E
                                          //
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
                                          //
                                          //  P R O F I L E   B U T T O N
                                          //
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
                                    //
                                    //   H O M E   C A R D
                                    //
                                    BlocListener<CurrentGymBloc,
                                        CurrentGymState>(
                                      listener: (context, state) async {
                                        section = await BlocProvider.of<
                                                TrainingSectionCubit>(context)
                                            .getSection();
                                        if (state is CurrentGymUpdatedState) {
                                          BlocProvider.of<CurrentGymBloc>(
                                                  // ignore: use_build_context_synchronously
                                                  context)
                                              .add(
                                                  const GetSubscribedToGymEvent());

                                          BlocProvider.of<TrainingBloc>(
                                              // ignore: use_build_context_synchronously
                                              context).add(const GetProgramEvent());
                                          section = await BlocProvider.of<
                                                      TrainingSectionCubit>(
                                                  // ignore: use_build_context_synchronously
                                                  context)
                                              .getSection();
                                          setState(() {});

                                          // print("DEBUG HOME:"
                                          //     " $section");
                                        }
                                      },
                                      child: HomeCard(
                                        section: section ?? local.map,
                                        // myGym: state.current,
                                        player: playerState.player,
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
                                          daysController.animatePanelToPosition(
                                            1.0,
                                            duration: Durations.extralong4,
                                            curve: Curves.bounceOut,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else if (playerState is ProfileErrorState) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height * 0.1),
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    child: SizedBox(
                                      width: screenSize.width * 0.8,
                                      height: screenSize.height * 0.18,
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
                                    top: screenSize.height * 0.1),
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  child: SizedBox(
                                    width: screenSize.width * 0.8,
                                    height: screenSize.height * 0.18,
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
                                // print("exercise refresh");
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
                                      height: screenSize.height * 0.07,
                                      child: ListView.separated(
                                        controller: filtersController,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 8.0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: trSections.length,
                                        itemBuilder: (context, index) {
                                          return TrainingGroup(
                                            name: context
                                                    .read<LocaleCubit>()
                                                    .state
                                                    .isRtl()
                                                ? trSections[index].arGroupName
                                                : trSections[index].enGroupName,
                                            // isSelected:
                                            //     trSections[selectedGroup].num ==
                                            //         trSections[index].num,
                                            isSelected: selectedGroup == index,
                                            isToday: index > 3,
                                            onPressed: () {
                                              BlocProvider.of<ExercisesBloc>(
                                                      context)
                                                  .add(
                                                GetExercisesByFilterEvent(
                                                    trSections[index].id),
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
                                  // print("Left");
                                  if (isRtl && selectedGroup > 0) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[--selectedGroup].id));
                                  } else if (!isRtl && selectedGroup < 7) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[++selectedGroup].id));
                                  }
                                } else if (details.primaryVelocity! > 0) {
                                  // print("Right");
                                  if (isRtl && selectedGroup < 7) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[++selectedGroup].id));
                                  } else if (!isRtl && selectedGroup > 0) {
                                    BlocProvider.of<ExercisesBloc>(context).add(
                                        GetExercisesByFilterEvent(
                                            trSections[--selectedGroup].id));
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
                                      isRoutineLoading = false;
                                      return BlocConsumer<ExercisesBloc,
                                          ExercisesState>(
                                        listener: (context, state) async {
                                          // print(
                                          //     "Listener state: ${state.runtimeType}");

                                          if (state is ExercisesUpdatedState) {
                                            // BlocProvider.of<ExercisesBloc>(
                                            //         context)
                                            //     .add(GetExercisesByFilterEvent(
                                            //         selectedGroup + 1));
                                            BlocProvider.of<ExercisesBloc>(
                                                    context)
                                                .add(GetExercisesByFilterEvent(
                                                    trSections[selectedGroup]
                                                        .id));
                                            // BlocProvider.of<TrainingBloc>(context)
                                            //     .add(GetProgramEvent());
                                          }
                                        },
                                        builder: (context, state) {
                                          // print(
                                          //     "Exercise Bloc State: ${state.runtimeType}");
                                          if (state is ExercisesLoadedState) {
                                            // print(
                                            //     "Exercises Bloc Builder: list: ${state.list.length}");
                                            return Column(
                                              children: [
                                                for (var ex in state.list)
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
                                                      exercise: ex,
                                                      isCompleted: completed
                                                          .contains(ex.id),
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              ExerciseInfoDialog(
                                                            weightCtl:
                                                                weightCtl,
                                                            e: ex,
                                                            onPressed:
                                                                (newVal) {
                                                              BlocProvider.of<
                                                                          ExercisesBloc>(
                                                                      context)
                                                                  .add(
                                                                UpdateLastWeightEvent(
                                                                    eId: ex.id,
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
                                                                  ex.id)) {
                                                            completed
                                                                .remove(ex.id);
                                                          } else {
                                                            completed
                                                                .add(ex.id);
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            );
                                          } else if (state
                                              is ExercisesErrorState) {
                                            // print(
                                            //     "inside blocbuilder ${state.f.runtimeType}");
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
                                      isRoutineLoading = false;
                                      return ReloadScreenWidget(
                                        f: tState.f,
                                        callBack: () {
                                          BlocProvider.of<TrainingBloc>(context)
                                              .add(const GetProgramEvent());
                                        },
                                      );
                                    } else if (tState
                                        is TrainingProgramLoadingState) {
                                      isRoutineLoading = true;
                                      return SizedBox(
                                        height: screenSize.height * 0.4,
                                        child: ProgressWidget(
                                            percent: tState.percent),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.teal, Colors.lime],
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.black,
                          // onTap: () =>
                          onTap: () => kDebugMode
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) =>
                                          RoutineManagementBloc(
                                              routineManagementUsecases:
                                                  di.sl())
                                            ..add(GetRoutinesEvent()),
                                      child: RoutineManagementScreen(),
                                    ),
                                  ))
                              : showDialog(
                                  context: context,
                                  builder: (_) => const CommingSoonDialog(),
                                ),

                          child: SizedBox(
                            width: screenSize.width,
                            height: 30,
                            child: Center(
                              child: Text(
                                local.commingSoon,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
