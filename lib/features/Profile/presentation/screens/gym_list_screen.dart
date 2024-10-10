import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:uniceps/features/Profile/presentation/bloc/player_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/gym_profile_2.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_logo_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gyms_list_wave_back.dart';
import 'package:uniceps/features/Training/views/widgets/my_gym_widget.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class GymListScreen extends StatefulWidget {
  const GymListScreen({super.key});

  @override
  State<GymListScreen> createState() => _GymListScreenState();
}

class _GymListScreenState extends State<GymListScreen> {
  bool isOpen = false;

  final node = FocusNode();
  final node2 = FocusNode();

  final controller = TextEditingController();

  List<Gym> gymsList = [], searchRes = [];

  Gym? gym;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(APP_NAME),
      // ),
      resizeToAvoidBottomInset: false,

      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (isOpen) {
            isOpen = false;
            node.unfocus();
            node2.unfocus();
            searchRes.clear();
            controller.clear();
            setState(() {});
          } else if (context.mounted) {
            Navigator.pop(context);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<GymsBloc>(context)
                .add(const GetAllAvailableGymsEvent());
            await BlocProvider.of<GymsBloc>(context).stream.skip(1).first;
          },
          child: BlocBuilder<GymsBloc, GymsState>(
            builder: (context, state) {
              print("Inside Gyms Bloc 1");
              if (state is GymsLoadedState) {
                print("Inside Gyms Bloc 2");
                if (state.restList.isEmpty && state.myGyms.isEmpty) {
                  print("Inside Gyms Bloc 3");
                  return Center(
                      child: Text(AppLocalizations.of(context)!.empty));
                }
                if (state.myGyms.isNotEmpty) {
                  gym = state.myGyms.first;
                }
                return Stack(
                  children: [
                    //
                    //  R E S T   L I S T   G Y M S
                    //
                    ListView.builder(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.4),
                      itemCount: state.restList.length,
                      itemBuilder: (context, index) {
                        gymsList = state.restList;

                        return MyGymWidget(
                            myGym: state.restList[index],
                            isSelected: false,
                            isCurrent: false,
                            onPressed: () {
                              BlocProvider.of<SubsBloc>(context).add(
                                GetSubsEvent(
                                  gymId: state.restList[index].id,
                                  pid: "",
                                ),
                              );
                              BlocProvider.of<AttendenceBloc>(context).add(
                                GetAttendenceEvent(
                                  state.restList[index].id,
                                  "",
                                ),
                              );
                              BlocProvider.of<PlayerGymBloc>(context).add(
                                GetPlayerInGymEvent(
                                  gymId: state.restList[index].id,
                                  pid: "",
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GymProfileScreen2(
                                    gym: state.restList[index],
                                  ),
                                ),
                              );
                            });
                      },
                    ),

                    //
                    //  W A V E   P A I N T E R
                    //
                    Positioned(
                      top: 0.0,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: CustomPaint(
                        painter: WavePainter(),
                      ),
                    ),

                    //
                    //  A V A I L A B L E   G Y M S   B A N N E R
                    //
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: isRtl ? null : 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 218, 218, 218),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 8.0, top: 8.0, bottom: 8.0),
                          child: Text(
                            local.availableGyms,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                    //  M Y - G Y M S   L I S T
                    //
                    SafeArea(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 35,
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: state.myGyms.isNotEmpty
                                ? Row(
                                    children: [
                                      for (var i in state.myGyms)
                                        GymLogoWidget(
                                          gym: i,
                                          onPressed: () {
                                            BlocProvider.of<SubsBloc>(context)
                                                .add(
                                              GetSubsEvent(
                                                gymId: i.id,
                                                pid: i.pid,
                                              ),
                                            );
                                            BlocProvider.of<AttendenceBloc>(
                                                    context)
                                                .add(
                                              GetAttendenceEvent(
                                                i.id,
                                                i.pid,
                                              ),
                                            );
                                            BlocProvider.of<PlayerGymBloc>(
                                                    context)
                                                .add(
                                              GetPlayerInGymEvent(
                                                gymId: i.id,
                                                pid: i.pid,
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    GymProfileScreen2(
                                                  gym: i,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  )
                                : SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    child: Center(
                                      child: DefaultTextStyle(
                                        style: GoogleFonts.cairo()
                                          ..copyWith(color: Colors.white),
                                        child: ErrorScreenWidget(
                                            f: NoGymSpecifiedFailure(
                                                errMsg: "errMsg"),
                                            callback: null),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    // S E A R C H   B A R
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 15.0,
                          left: isRtl ? 15.0 : 0.0,
                          right: isRtl ? 0.0 : 15.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                                iconSize: 30,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                height: 40,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    onTap: () {
                                      isOpen = true;
                                      node2.unfocus();
                                      node.requestFocus();
                                      setState(() {});
                                    },
                                    focusNode: node2,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                      isCollapsed: true,
                                      enabledBorder: InputBorder.none,
                                      hintText: local.search,
                                      hintStyle: const TextStyle(
                                        color: Colors.white70,
                                        decoration: TextDecoration.none,
                                        decorationColor: Colors.white70,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      decoration: TextDecoration.none,
                                      decorationColor: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isOpen)
                      Container(
                        color: Theme.of(context).colorScheme.background,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            SafeArea(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.25,
                                  left: 15.0,
                                  right: 15.0,
                                ),
                                child: ListView.builder(
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior
                                            .onDrag,
                                    itemCount: controller.text.isEmpty
                                        ? gymsList.length
                                        : searchRes.length,
                                    itemBuilder: (context, index) {
                                      return MyGymWidget(
                                        myGym: searchRes.isEmpty
                                            ? gymsList[index]
                                            : searchRes[index],
                                        isSelected: false,
                                        isCurrent: false,
                                        onPressed: () {
                                          BlocProvider.of<SubsBloc>(context)
                                              .add(GetSubsEvent(
                                                  gymId: searchRes.isEmpty
                                                      ? gymsList[index].id
                                                      : searchRes[index].id,
                                                  pid: searchRes.isEmpty
                                                      ? gymsList[index].pid
                                                      : searchRes[index].pid));
                                          BlocProvider.of<AttendenceBloc>(
                                                  context)
                                              .add(GetAttendenceEvent(
                                                  searchRes.isEmpty
                                                      ? gymsList[index].id
                                                      : searchRes[index].id,
                                                  searchRes.isEmpty
                                                      ? gymsList[index].pid
                                                      : searchRes[index].pid));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GymProfileScreen2(
                                                gym: searchRes.isEmpty
                                                    ? gymsList[index]
                                                    : searchRes[index],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                              ),
                            ),
                            //
                            //  R E A L   S E A R C H   B A R
                            //
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: CustomPaint(
                                painter: WavePainter(),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Theme(
                                      data: ThemeData(
                                        inputDecorationTheme:
                                            const InputDecorationTheme(
                                          activeIndicatorBorder:
                                              BorderSide.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          outlineBorder: BorderSide.none,
                                        ),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 40,
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: TextFormField(
                                            focusNode: node,
                                            decoration: InputDecoration(
                                              hintText: local.search,
                                              hintStyle: const TextStyle(
                                                color: Colors.white54,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              isCollapsed: true,
                                            ),
                                            onChanged: (value) {
                                              searchRes.clear();
                                              for (var i in gymsList) {
                                                if (i.name.contains(
                                                  RegExp(value,
                                                      caseSensitive: false),
                                                )) {
                                                  searchRes.add(i);
                                                }
                                              }
                                              setState(() {});
                                            },
                                            onFieldSubmitted: (value) {},
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              decoration: TextDecoration.none,
                                              decorationColor: Colors.white70,
                                            ),
                                            onTapOutside: (pointerEvent) {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            controller: controller,
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
                  ],
                );
              } else if (state is GymsErrorState) {
                return Center(
                  child: ReloadScreenWidget(
                    f: state.f,
                    callBack: () {
                      BlocProvider.of<GymsBloc>(context)
                          .add(const GetAllAvailableGymsEvent());
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
