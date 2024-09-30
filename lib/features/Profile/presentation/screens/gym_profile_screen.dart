import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/player_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/logo_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/subscription_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:uniceps/features/Profile/presentation/screens/presence_screen.dart';
import 'package:uniceps/features/Training/views/widgets/panal_circle.dart';

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
              .add(GetPlayerInGymEvent(gymId: gym.id));
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.3,
                child: CustomPaint(
                  painter: PanaleCirclePainter(),
                ),
              ),
            ),
            BlocBuilder<SubsBloc, SubsState>(
              builder: (context, sState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: LogoWidget(
                                    gymId: gym.id,
                                    size: MediaQuery.of(context).size.width *
                                        0.33),
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
                              child: BlocBuilder<PlayerGymBloc, PlayerGymState>(
                                  builder: (context, state) {
                                if (state is PlayerGymInitial) {
                                  BlocProvider.of<PlayerGymBloc>(context)
                                      .add(GetPlayerInGymEvent(gymId: gym.id));
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
                                          Center(
                                            child: Text(
                                              local.balance,
                                              // style: TextStyle(
                                              //   fontSize: 20,
                                              //   fontWeight: FontWeight.bold,
                                              // ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              local.subscriptions,
                                              // style: TextStyle(
                                              //   fontSize: 20,
                                              //   fontWeight: FontWeight.bold,
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Center(
                                            child: Text(
                                              balance,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              sState is SubsLoadedState
                                                  ? "${sState.list.length}"
                                                  : "0",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2.0,
                      ),
                      Builder(
                        builder: (context) {
                          if (sState is SubsLoadedState) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...[
                                        Text("Filter 1:"),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              for (int i = 0;
                                                  i < sState.list.length + 2;
                                                  i++)
                                                SubscriptionWidget(
                                                  sub: sState.list[0],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else if (sState is SubsErrorState) {
                            print(sState.f.runtimeType);
                            if (sState.f is EmptyCacheFailure) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Center(
                                  child: ReloadScreenWidget(
                                    f: sState.f,
                                    callBack: () {
                                      BlocProvider.of<SubsBloc>(context).add(
                                          GetSubsEvent(
                                              gymId: gym.id, pid: gym.pid));
                                    },
                                  ),
                                ),
                              );
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Center(
                                child: ReloadScreenWidget(
                                  f: sState.f,
                                  callBack: () {
                                    BlocProvider.of<SubsBloc>(context).add(
                                        GetSubsEvent(
                                            gymId: gym.id, pid: gym.pid));
                                  },
                                ),
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
