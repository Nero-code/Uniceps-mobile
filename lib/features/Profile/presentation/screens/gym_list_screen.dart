import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/gym_profile_2.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_logo_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gyms_list_wave_back.dart';
import 'package:uniceps/features/Training/views/widgets/my_gym_widget.dart';

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
              if (state is GymsLoadedState) {
                if (state.restList.isEmpty && state.myGyms.isEmpty) {
                  return Center(
                      child: Text(AppLocalizations.of(context)!.empty));
                }
                gym = state.myGyms.first;
                return Stack(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.35),
                      itemCount: state.restList.length + 1,
                      itemBuilder: (context, index) {
                        // return GymWidget2(
                        //   gym: state.list[index],
                        //   icon: const Icon(Icons.arrow_forward_ios_rounded),
                        //   onPressed: () {
                        //     BlocProvider.of<SubsBloc>(context)
                        //         .add(GetSubsEvent(gymId: state.list[index].id));
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => GymProfileScreen(
                        //           gym: state.list[index],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
                        gymsList = state.restList;
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(""),
                          );
                        }
                        return MyGymWidget(
                            myGym: state.restList[index - 1],
                            isSelected: false,
                            isCurrent: false,
                            onPressed: () {
                              BlocProvider.of<SubsBloc>(context).add(
                                  GetSubsEvent(
                                      gymId: state.restList[index - 1].id,
                                      pid: state.restList[index - 1].pid));
                              BlocProvider.of<AttendenceBloc>(context).add(
                                  GetAttendenceEvent(
                                      state.restList[index - 1].id,
                                      state.restList[index - 1].pid));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GymProfileScreen2(
                                    gym: state.restList[index - 1],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    Positioned(
                      top: 0.0,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: CustomPaint(
                        painter: WavePainter(),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.35,
                      child: Container(
                        decoration: BoxDecoration(
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
                    SafeArea(
                      child: Column(
                        // top: 0.0,
                        // width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.25,
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
                            child: Row(
                              children: [
                                for (var i in state.myGyms)
                                  GymLogoWidget(
                                    gym: i,
                                    onPressed: () {
                                      BlocProvider.of<SubsBloc>(context).add(
                                        GetSubsEvent(
                                          gymId: i.id,
                                          pid: i.pid,
                                        ),
                                      );
                                      BlocProvider.of<AttendenceBloc>(context)
                                          .add(
                                        GetAttendenceEvent(
                                          i.id,
                                          i.pid,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    // search bar
                    SafeArea(
                      child: SearchAnchor(
                        // viewBackgroundColor: Colors.transparent,
                        // viewBuilder: (suggestions) {
                        //   return Container(
                        //     color: Colors.amber,
                        //     width: 210,
                        //     height: 150,
                        //     child: const Text("asasd"),
                        //   );
                        // },
                        builder: (context, controller) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SearchBar(
                              focusNode: node2,
                              // controller: controller,
                              hintText: local.search,
                              hintStyle:
                                  const MaterialStatePropertyAll<TextStyle>(
                                      TextStyle(color: Colors.white54)),
                              textStyle:
                                  const MaterialStatePropertyAll<TextStyle>(
                                      TextStyle(color: Colors.white70)),
                              leading: const Icon(Icons.search,
                                  color: Colors.white54),
                              shadowColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.transparent),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.white24),
                              constraints: const BoxConstraints(
                                minHeight: 40,
                              ),
                              onTap: () {
                                isOpen = true;
                                node2.unfocus();
                                node.requestFocus();
                                setState(() {});
                              },
                            ),
                          );
                        },
                        suggestionsBuilder: (context, controller) {
                          return [
                            const SizedBox(),
                          ];
                        },
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
                                    itemCount: searchRes.isEmpty
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
                                          // clean search
                                        },
                                      );
                                    }),
                              ),
                            ),
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
                                      child:
                                          //  SearchBar(
                                          //   controller: controller,
                                          //   padding: const MaterialStatePropertyAll(
                                          //       EdgeInsets.zero),
                                          //   focusNode: node,
                                          //   hintText: "بحث",
                                          //   hintStyle:
                                          //       const MaterialStatePropertyAll<
                                          //               TextStyle>(
                                          //           TextStyle(
                                          //               color: Colors.white30)),
                                          //   textStyle:
                                          //       const MaterialStatePropertyAll<
                                          //           TextStyle>(
                                          //     TextStyle(
                                          //       color: Colors.white70,
                                          //     ),
                                          //   ),
                                          //   leading: IconButton(
                                          //     // constraints: BoxConstraints.tight(
                                          //     //   Size(25.0, 25.0),
                                          //     // ),
                                          //     style: ButtonStyle(
                                          //       backgroundColor:
                                          //           MaterialStatePropertyAll(
                                          //               Colors.blueGrey),
                                          //     ),
                                          //     onPressed: () {
                                          //       print("yoyoyoy");
                                          //       print(controller.text);
                                          //       FocusManager.instance.primaryFocus
                                          //           ?.unfocus();
                                          //     },
                                          //     icon: const Icon(Icons.search,
                                          //         color: Colors.white70),
                                          //   ),
                                          //   elevation:
                                          //       const MaterialStatePropertyAll<
                                          //           double>(0),
                                          //   backgroundColor:
                                          //       const MaterialStatePropertyAll<
                                          //           Color>(Colors.white10),
                                          //   constraints: const BoxConstraints(
                                          //     minHeight: 40,
                                          //   ),
                                          //   onSubmitted: (value) {
                                          //     FocusManager.instance.primaryFocus
                                          //         ?.unfocus();
                                          //   },
                                          // ),
                                          Container(
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
                                              isCollapsed: true,
                                              icon: SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: Material(
                                                  color: Colors.white30,
                                                  shape: const CircleBorder(),
                                                  child: Tooltip(
                                                    message: local.search,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.search,
                                                        color: Colors.white70,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
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
