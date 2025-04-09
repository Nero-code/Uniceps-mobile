import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/set_widget.dart';
import 'package:uniceps/core/constants/constants.dart';

class SetsEditScreen extends StatefulWidget {
  const SetsEditScreen({super.key, required this.exerciseName});
  final String exerciseName;

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
        weight: null,
        isSynced: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.exerciseName),
      // ),
      // body: ListView(
      //   children: [
      //     Image(image: NetworkImage(imgUrlParser(4, "6"))),
      //     Center(
      //       child: Text(
      //         "sets and reps",
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Expanded(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Text("index"),
      //               Text("reps"),
      //             ],
      //           ),
      //         ),
      //         Expanded(child: SizedBox()),
      //       ],
      //     ),
      //     ...sets.map(
      //       (e) => SizedBox(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Text(e.index.toString()),
      //             Text(e.reps.toString()),
      //             Row(
      //               children: [
      //                 IconButton(
      //                   onPressed: () {},
      //                   color: Colors.green,
      //                   icon: const Icon(Icons.edit),
      //                 ),
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.delete),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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
                    Image(image: NetworkImage(imgUrlParser(4, "6"))),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...sets.map((e) => SetWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
