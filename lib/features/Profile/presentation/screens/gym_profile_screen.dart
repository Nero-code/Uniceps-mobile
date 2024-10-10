import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/player_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/Subscription_widget_2.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gyms_list_wave_back.dart';
import 'package:uniceps/features/Profile/presentation/widgets/logo_widget.dart';
// import 'package:uniceps/features/Profile/presentation/widgets/subscription_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:uniceps/features/Profile/presentation/screens/presence_screen.dart';
// import 'package:uniceps/features/Training/views/widgets/panal_circle.dart';

@Deprecated("Use GymProfileScreen2 instead")
class GymProfileScreen extends StatelessWidget {
  const GymProfileScreen({super.key, required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<PlayerGymBloc>(context)
              .add(GetPlayerInGymEvent(gymId: gym.id, pid: gym.pid));
        },
      ),
      // appBar: AppBar(
      //   title: Text(gym.name),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         BlocProvider.of<AttendenceBloc>(context)
      //             .add(GetAttendenceEvent(gym.id, gym.pid));
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => PresenceScreen(
      //               gymId: gym.id,
      //               pid: gym.pid,
      //             ),
      //           ),
      //         );
      //       },
      //       icon: const Icon(Icons.calendar_month),
      //     ),
      //   ],
      // ),

      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: CustomPaint(
                painter: WavePainter(),
              ),
            ),
          ),
          SafeArea(
            child: BlocBuilder<SubsBloc, SubsState>(
              builder: (context, sState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: LogoWidget(
                                      gymId: gym.id,
                                      size: MediaQuery.of(context).size.width *
                                          0.2),
                                ),
                              ),

                              // Expanded(
                              //   flex: 3,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         gym.name,
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold,
                              //             color: Theme.of(context).colorScheme.primary),
                              //         overflow: TextOverflow.visible,
                              //       ),
                              //       Text("${local.address}: ${gym.address}"),
                              //       Text("${local.owner}: ${gym.ownerName}"),
                              //       Padding(
                              //         padding: EdgeInsets.only(
                              //             left: isRtl ? 5.0 : 0.0,
                              //             right: isRtl ? 0.0 : 5.0),
                              //         child: Table(
                              //           columnWidths: const {
                              //             0: FixedColumnWidth(50),
                              //             1: FlexColumnWidth(),
                              //           },
                              //           children: [
                              //             TableRow(children: [
                              //               Text("${local.telephone}:"),
                              //               Text(gym.phoneNum,
                              //                   textDirection: TextDirection.ltr),
                              //             ]),
                              //             TableRow(children: [
                              //               SizedBox(),
                              //               Text(gym.telephone,
                              //                   textDirection: TextDirection.ltr)
                              //             ]),
                              //           ],
                              //         ),
                              //       ),
                              //       // Icon(Icons.phone, size: 17),,
                              //     ],
                              //   ),
                              // ),

                              const SizedBox(width: 10.0),

                              Expanded(
                                flex: 9,
                                child:
                                    BlocBuilder<PlayerGymBloc, PlayerGymState>(
                                        builder: (context, state) {
                                  if (state is PlayerGymInitial) {
                                    BlocProvider.of<PlayerGymBloc>(context).add(
                                        GetPlayerInGymEvent(
                                            gymId: gym.id, pid: gym.pid));
                                  }
                                  print(state.runtimeType);
                                  if (state is PlayerInGymLoadedState) {
                                    final balance =
                                        intl.NumberFormat("###,###,###.##")
                                            .format(state.data.balance);

                                    print("Balance: ${state.data.balance}");
                                    return Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            Text(
                                              local.balance,
                                              style: TextStyle(
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              local.subscriptions,
                                              style: TextStyle(
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  balance,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    // color: state.data
                                                    //             .balance <=
                                                    //         0
                                                    //     ? Colors.red.shade700
                                                    //     : Colors
                                                    //         .green.shade800,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                state.data.balance < 0
                                                    ? Icon(
                                                        Icons.arrow_drop_down,
                                                        color:
                                                            Colors.red.shade700,
                                                      )
                                                    : Icon(
                                                        Icons.arrow_drop_up,
                                                        color: Colors
                                                            .green.shade800,
                                                      ),
                                              ],
                                            ),
                                            Text(
                                              sState is SubsLoadedState
                                                  ? "${sState.list.length}"
                                                  : "0",
                                              // textDirection: TextDirection.ltr,
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else if (state is PlayerInGymErrorState) {
                                    return Container();
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  gym.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${local.address} : ${gym.address}",
                                  style: TextStyle(
                                    // fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${local.phoneNum} : ",
                                      style: TextStyle(
                                        // fontSize: 20,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${gym.phoneNum} | ${gym.telephone}",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        // fontSize: 20,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Builder(
                      builder: (context) {
                        if (sState is SubsLoadedState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 0;
                                        i < sState.list.length + 2;
                                        i++)
                                      SubsrciptionWidget2(
                                        sub: sState.list[0],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (sState is SubsErrorState) {
                          print(sState.f.runtimeType);
                          if (sState.f is EmptyCacheFailure) {
                            return Center(
                              child: ReloadScreenWidget(
                                f: sState.f,
                                callBack: () {
                                  BlocProvider.of<SubsBloc>(context).add(
                                      GetSubsEvent(
                                          gymId: gym.id, pid: gym.pid));
                                },
                              ),
                            );
                          }
                          return Center(
                            child: ReloadScreenWidget(
                              f: sState.f,
                              callBack: () {
                                BlocProvider.of<SubsBloc>(context).add(
                                    GetSubsEvent(gymId: gym.id, pid: gym.pid));
                              },
                            ),
                          );
                        } else if (sState is SubsLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          BlocProvider.of<SubsBloc>(context)
                              .add(GetSubsEvent(gymId: gym.id, pid: gym.pid));

                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
