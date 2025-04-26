import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/sets_edit_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/set_widget.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineItemHorizontalWidget extends StatefulWidget {
  const RoutineItemHorizontalWidget(
      {super.key, required this.item, required this.onTap});

  final RoutineItem item;
  final void Function(int itemId) onTap;
  @override
  State<RoutineItemHorizontalWidget> createState() =>
      _RoutineItemHorizontalWidgetState();
}

class _RoutineItemHorizontalWidgetState
    extends State<RoutineItemHorizontalWidget> {
  final List<TextEditingController> controllers = [];
  List<RoutineSet> sets = [];
  bool isExpanded = false;

  void removeSet(int index) {
    sets.removeAt(index);
    controllers.removeAt(index);
    for (int i = index; i < sets.length; i++) {
      sets[i] = RoutineSet(
          id: sets[i].id,
          apiId: sets[i].apiId,
          routineItemId: sets[i].routineItemId,
          version: sets[i].version,
          index: sets[i].index - 1,
          reps: sets[i].reps,
          isSynced: sets[i].isSynced);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context);
    return BlocBuilder<SetsEditBloc, SetsEditState>(
      builder: (context, state) {
        if (state is SetsEditLoadedState) sets = state.sets;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            // onTap: () {
            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //         builder: (context) => SetsEditScreen(item: widget.item)));
            //   isExpanded = !isExpanded;
            //   setState(() {});
            // },
            onTap: () => widget.onTap(widget.item.id!),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              // l=0 , h=100
              // l=1 , h=150
              // height: isExpanded ? (sets.length + 1) * 50 + 100 : 100,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FlutterLogo(size: 100),
                      SizedBox(
                        width: screenSize.width * 0.4,
                        child: Image.network(
                          imgUrlParser(widget.item.exercise.muscleGroup.apiId,
                              widget.item.exercise.imageUrl),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(widget.item.exercise.name, maxLines: 2),
                            Text(
                                "Muscle Group: ${widget.item.exercise.muscleGroup.enGroupName}"),
                          ],
                        ),
                      )
                    ],
                  ),
                  AnimatedContainer(
                    height: isExpanded
                        ? (sets.length + 1) * screenSize.height * 0.08
                        : 0,
                    duration: Durations.medium4,
                    curve: Curves.easeOutQuint,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          for (int i = 0; i < sets.length; i++)
                            SetWidget(
                              index: i,
                              routineItemId: widget.item.id ?? 0,
                              controller: controllers[i],
                              onRemove: () {
                                removeSet(i);
                              },
                            ),
                          SizedBox(
                            height: screenSize.height * 0.08,
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    sets.add(
                                      RoutineSet(
                                          id: null,
                                          apiId: null,
                                          routineItemId: 0,
                                          version: 0,
                                          index: sets.length,
                                          reps: 10,
                                          isSynced: false),
                                    );
                                    controllers.add(TextEditingController());
                                    setState(() {});
                                  },
                                  child: Text(locale?.add ?? "")),
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
        );
      },
    );
  }
}
