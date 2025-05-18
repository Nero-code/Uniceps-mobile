import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/sets_edit_bloc.dart';
// import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/set_widget.dart';

class RoutineSetsSheet extends StatefulWidget {
  const RoutineSetsSheet({
    super.key,
    required this.itemId,
    required this.sets,
    required this.onDelete,
    required this.onSave,
  });

  final void Function() onDelete, onSave;
  final int itemId;
  final List<RoutineSet> sets;

  @override
  State<RoutineSetsSheet> createState() => _RoutineSetsSheetState();
}

class _RoutineSetsSheetState extends State<RoutineSetsSheet> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    controllers.clear();
    for (final i in widget.sets) {
      controllers.add(TextEditingController(text: "${i.reps}"));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controllers.clear();
    for (var i in widget.sets) {
      controllers.add(TextEditingController(text: "${i.reps}"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image(image: NetworkImage(imgUrlParser(4, "6"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.red,
                  iconSize: 30,
                  splashRadius: 30,
                  icon: const Icon(Icons.delete),
                  onPressed: widget.onDelete,
                ),
                const Text("yoyo"),
                IconButton(
                  color: Colors.green,
                  iconSize: 30,
                  splashRadius: 30,
                  icon: const Icon(Icons.done_all_rounded),
                  onPressed: () {
                    for (int i = 0; i < widget.sets.length; i++) {
                      widget.sets[i] = widget.sets[i]
                          .copyWith(reps: int.parse(controllers[i].text));
                    }
                    BlocProvider.of<SetsEditBloc>(context).add(SaveSetsEvent(
                        itemId: widget.itemId, sets: widget.sets));

                    widget.onSave();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < widget.sets.length; i++)
            SetWidget(
                set: widget.sets[i],
                index: i,
                routineItemId: 0,
                controller: controllers[i],
                onRemove: () {
                  BlocProvider.of<SetsEditBloc>(context).add(RemoveSetEvent(
                      itemId: widget.itemId, set: widget.sets[i]));
                }),

          SizedBox(
            width: MediaQuery.sizeOf(context).width - 50,
            child: OutlinedButton(
              onPressed: () {
                for (int i = 0; i < widget.sets.length; i++) {
                  widget.sets[i] = widget.sets[i]
                      .copyWith(reps: int.parse(controllers[i].text));
                }
                BlocProvider.of<SetsEditBloc>(context).add(
                  AddSetEvent(itemId: widget.itemId, oldSets: widget.sets),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
