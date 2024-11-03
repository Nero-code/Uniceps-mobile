import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subscription/subs_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
/// This screen is depricated
/// you can move on now...
///
@Deprecated("THE EXPANSION PANEL TYPE")
class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({super.key});

  @override
  State<SubScriptionScreen> createState() => _SubScriptionScreenState();
}

class _SubScriptionScreenState extends State<SubScriptionScreen> {
  final List<int> items = [];

  @override
  Widget build(BuildContext context) {
    // final gymId = ModalRoute.of(context)!.settings.arguments as String;
    // final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uniceps"),
      ),
      body: BlocBuilder<SubsBloc, SubsState>(
        builder: (context, state) {
          if (state is SubsInitial) {
            // BlocProvider.of<SubsBloc>(context).add(GetSubsEvent(gymId: gymId,pid: pi));
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubsLoadedState) {
            // if (state.list.isEmpty) {
            //   return Center(child: Text(AppLocalizations.of(context)!.empty));
            // }
            return SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (index, isOpen) {
                  setState(() {
                    if (isOpen) {
                      items.remove(index);
                    } else {
                      items.add(index);
                    }
                  });
                },
                children: [
                  for (int i = 0; i < items.length; i++)
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("S" " $i\nSport: Yoga"),
                          ),
                        );
                      },
                      isExpanded: items.contains(i),
                      body: Column(
                        children: [
                          Divider(),
                          Text("Value"),
                          Text("Description: "),
                        ],
                      ),
                    ),
                ],
              ),
            );
          } else if (state is SubsErrorState) {
            return Center(
              child: ReloadScreenWidget(
                f: state.f,
                callBack: () {
                  // BlocProvider.of<SubsBloc>(context).add(
                  //   GetSubsEvent(gymId: gymId),
                  // );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
