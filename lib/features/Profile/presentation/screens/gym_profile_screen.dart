import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/logo_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/subscription_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/features/Profile/presentation/screens/presence_screen.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class GymProfileScreen extends StatelessWidget {
  const GymProfileScreen({super.key, required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isRtl = BlocProvider.of<LocaleCubit>(context).state.isRtl();
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.name),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AttendenceBloc>(context)
                    .add(GetAttendenceEvent(gym.id));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PresenceScreen(gymId: gym.id)),
                );
              },
              icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      // child: Image(
                      //   image: AssetImage("images/logo/Logo.png"),
                      // ),
                      child: LogoWidget(
                          gymId: gym.id,
                          size: MediaQuery.of(context).size.width * 0.33),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gym.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                          overflow: TextOverflow.visible,
                        ),
                        Text("${local.address}: ${gym.address}"),
                        Text("${local.owner}: ${gym.ownerName}"),

                        Padding(
                          padding: EdgeInsets.only(
                              left: isRtl ? 5.0 : 0.0,
                              right: isRtl ? 0.0 : 5.0),
                          child: Table(
                            columnWidths: const {
                              0: FixedColumnWidth(50),
                              1: FlexColumnWidth(),
                            },
                            children: [
                              TableRow(children: [
                                Text("${local.telephone}:"),
                                Text(gym.phoneNum,
                                    textDirection: TextDirection.ltr),
                              ]),
                              TableRow(children: [
                                SizedBox(),
                                Text(gym.telephone,
                                    textDirection: TextDirection.ltr)
                              ]),
                            ],
                          ),
                        ),
                        // Icon(Icons.phone, size: 17),,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white),
            BlocBuilder<SubsBloc, SubsState>(
              builder: (context, state) {
                if (state is SubsLoadedState) {
                  return Column(
                    children: [
                      for (int i = 0; i < state.list.length; i++)
                        SubscriptionWidget(
                          // sub: Subscription(
                          //     id: "",
                          //     discountDes: "",
                          //     discountVal: 5,
                          //     endDate: stringToDate("10/09/2024"),
                          //     startDate: stringToDate("10/08/2024"),
                          //     gymId: "",
                          //     isPaid: true,
                          //     pId: "",
                          //     paidValue: 20000,
                          //     payments: [],
                          //     price: 30000,
                          //     sportName: "YOGA",
                          //     trainerName: "Abu Mahasen"),
                          sub: state.list[i],
                        ),
                    ],
                  );
                } else if (state is SubsErrorState) {
                  print(state.f.runtimeType);
                  if (state.f is EmptyCacheFailure) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: ReloadScreenWidget(
                          f: state.f,
                          callBack: () {
                            BlocProvider.of<SubsBloc>(context)
                                .add(GetSubsEvent(gymId: gym.id));
                          },
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: ReloadScreenWidget(
                        f: state.f,
                        callBack: () {
                          BlocProvider.of<SubsBloc>(context)
                              .add(GetSubsEvent(gymId: gym.id));
                        },
                      ),
                    ),
                  );
                } else if (state is SubsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  BlocProvider.of<SubsBloc>(context)
                      .add(GetSubsEvent(gymId: gym.id));

                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
