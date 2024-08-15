import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class GymListScreen extends StatelessWidget {
  const GymListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
      ),
      body: BlocBuilder<GymsBloc, GymsState>(
        builder: (context, state) {
          if (state is GymsLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            );
          } else if (state is GymsErrorState) {
            return Center(
              child: ReloadScreenWiget(
                image: const Icon(Icons.warning_rounded),
                message: Text(AppLocalizations.of(context)!.error),
                callBack: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    BlocProvider.of<GymsBloc>(context)
                        .add(const GetAllAvailableGymsEvent());
                  },
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
