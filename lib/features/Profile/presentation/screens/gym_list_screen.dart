import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/gym_profile_screen.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_widget_2.dart';

class GymListScreen extends StatelessWidget {
  const GymListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GymsBloc>(context)
              .add(const GetAllAvailableGymsEvent());
          await BlocProvider.of<GymsBloc>(context).stream.skip(1).first;
        },
        child: BlocBuilder<GymsBloc, GymsState>(
          builder: (context, state) {
            if (state is GymsLoadedState) {
              if (state.list.isEmpty) {
                return Center(child: Text(AppLocalizations.of(context)!.empty));
              }
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return GymWidget2(
                    gym: state.list[index],
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      BlocProvider.of<SubsBloc>(context)
                          .add(GetSubsEvent(gymId: state.list[index].id));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GymProfileScreen(
                            gym: state.list[index],
                          ),
                        ),
                      );
                    },
                  );
                },
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
    );
  }
}
