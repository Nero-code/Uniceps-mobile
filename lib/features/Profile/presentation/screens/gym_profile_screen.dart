import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/logo_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/subscription_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GymProfileScreen extends StatelessWidget {
  const GymProfileScreen({super.key, required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    // child: Image(
                    //   image: AssetImage("images/logo/Logo.png"),
                    // ),
                    child: LogoWidget(imageUrl: gym.logo, size: 75),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${local!.about}: ${gym.name}"),
                      Text("${local.address}: ${gym.address}"),
                      Text("${local.owner}: ${gym.ownerName}"),
                      Text("${local.telephone}:"),
                      Text(gym.phoneNum, textDirection: TextDirection.ltr),
                      Text(gym.telephone, textDirection: TextDirection.ltr),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            BlocBuilder<SubsBloc, SubsState>(
              builder: (context, state) {
                if (state is SubsLoadedState) {
                  if (state.list.isNotEmpty) {
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
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(child: Text(local.empty)),
                  );
                } else if (state is SubsErrorState) {
                  return ReloadScreenWiget(
                    image: const Icon(Icons.warning_rounded),
                    message: Text(local.error),
                    callBack: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        BlocProvider.of<SubsBloc>(context)
                            .add(GetSubsEvent(gymId: gym.id));
                      },
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
