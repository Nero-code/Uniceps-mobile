import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/exercise_grid_widget.dart';

class ExercisesListTab extends StatefulWidget {
  const ExercisesListTab(
      {super.key, required this.list, required this.onSelect});

  final List<ExerciseV2> list;
  final void Function(ExerciseV2 exercise, bool isSelect) onSelect;

  @override
  State<ExercisesListTab> createState() => _ExercisesListTabState();
}

class _ExercisesListTabState extends State<ExercisesListTab>
    with AutomaticKeepAliveClientMixin {
  final double spacing = 8.0;
  List<int> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.1,
        crossAxisCount: 2,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      padding: EdgeInsets.all(spacing),
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        print("selectedIDs: ${selectedIds.length}");
        return Stack(
          children: [
            ExerciseGridWidget(
              isSelected: selectedIds.contains(widget.list[index].id),
              exercise: widget.list[index],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromARGB(30, 158, 158, 158),
                highlightColor: const Color.fromARGB(30, 158, 158, 158),
                borderRadius: BorderRadius.circular(15.0),
                onTap: () {
                  if (!selectedIds.contains(widget.list[index].id)) {
                    print("added");
                    selectedIds.add(widget.list[index].id!);
                    widget.onSelect(widget.list[index], false);
                  } else {
                    print("removed");
                    selectedIds.remove(widget.list[index].id!);
                    widget.onSelect(widget.list[index], true);
                  }
                  setState(() {});
                },
                child: const SizedBox.expand(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => selectedIds.isNotEmpty;
}
