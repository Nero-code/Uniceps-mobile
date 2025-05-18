import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    // final locale = AppLocalizations.of(context)!;
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const FlutterLogo(size: 100),
              SizedBox(
                width: screenSize.width * 0.4,
                child: widget.item.exercise.imageBitMap != null
                    ? Image.memory(widget.item.exercise.imageBitMap!)
                    : null,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(widget.item.exercise.name, maxLines: 2),
                    const Text("Muscle Group: "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
