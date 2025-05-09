import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/constants/constants.dart';

class SetsEditScreen extends StatefulWidget {
  const SetsEditScreen({super.key, required this.item});
  final RoutineItem item;

  @override
  State<SetsEditScreen> createState() => _SetsEditScreenState();
}

class _SetsEditScreenState extends State<SetsEditScreen> {
  final List<RoutineSet> sets = List.generate(
    3,
    (index) => RoutineSet(
        id: null,
        apiId: null,
        routineItemId: index,
        version: 0,
        index: index,
        reps: index * 10,
        isSynced: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).width * 9 / 16,
            flexibleSpace: FlexibleSpaceBar(
              background: ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: NetworkImage(
                        imgUrlParser(widget.item.exercise.muscleGroupId,
                            widget.item.exercise.imageUrl),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverReorderableList(
            itemBuilder: (context, index) {
              // return SetWidget(key: ValueKey(index));
              return SizedBox();
            },
            itemCount: sets.length,
            onReorder: (oldIndex, newIndex) {
              final temp = sets[oldIndex];
              sets.removeAt(oldIndex);
              if (newIndex > oldIndex) {
                sets.insert(newIndex - 1, temp);
              } else {
                sets.insert(newIndex, temp);
              }
            },
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       ...sets.map((e) => SetWidget()),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
