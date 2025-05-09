import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/exercise_grid_widget.dart';

class ExercisesListTab extends StatefulWidget {
  const ExercisesListTab({
    super.key,
    required this.onSelect,
    required this.muscleGroup,
  });

  final MuscleGroup muscleGroup;
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
    return BlocBuilder<ExercisesV2Bloc, ExercisesV2State>(
      builder: (context, state) {
        if (state is ExercisesV2Initial) {
          BlocProvider.of<ExercisesV2Bloc>(context)
              .add(GetExercisesByFilterEvent(filter: widget.muscleGroup));
        }
        if (state is ExercisesV2LoadedState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
            padding: EdgeInsets.all(spacing),
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              print("selectedIDs: ${selectedIds.length}");
              return Stack(
                children: [
                  ExerciseGridWidget(
                    isSelected: selectedIds.contains(state.list[index].apiId),
                    exercise: state.list[index],
                    index: index % 6 + 1,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: const Color.fromARGB(30, 158, 158, 158),
                      highlightColor: const Color.fromARGB(30, 158, 158, 158),
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        if (!selectedIds.contains(state.list[index].apiId)) {
                          print("added");
                          // ----------------------------------------------
                          // Add exercise here and parent widget and notify
                          selectedIds.add(state.list[index].apiId!);
                          widget.onSelect(state.list[index], false);
                          // ----------------------------------------------
                        } else {
                          print("removed");
                          // -------------------------------------------------
                          // Remove exercise here and parent widget and notify
                          selectedIds.remove(state.list[index].apiId!);
                          widget.onSelect(state.list[index], true);
                          // -------------------------------------------------
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
        } else if (state is ExercisesV2ErrorState) {
          return Center(child: Text(state.failure.getErrorMessage()));
        }
        return const LoadingPage();
      },
    );
  }

  @override
  bool get wantKeepAlive => selectedIds.isNotEmpty;
}

// import 'package:flutter/material.dart';
// import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
// import 'package:uniceps/app/presentation/screens/routine/widgets/exercise_grid_widget.dart';
//
// class ExercisesListTab extends StatelessWidget {
//   const ExercisesListTab(
//       {super.key,
//       required this.list,
//       required this.onSelect,
//       required this.selectedIds});
//   final List<ExerciseV2> list;
//   final List<int> selectedIds;
//   final void Function(ExerciseV2 exercise, bool isSelect) onSelect;
//
//   final double spacing = 8.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 1.1,
//         crossAxisCount: 2,
//         mainAxisSpacing: spacing,
//         crossAxisSpacing: spacing,
//       ),
//       padding: EdgeInsets.all(spacing),
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         print("selectedIDs: ${selectedIds.length}");
//         return Stack(
//           children: [
//             ExerciseGridWidget(
//               isSelected: selectedIds.contains(list[index].id),
//               exercise: list[index],
//             ),
//             Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 splashColor: const Color.fromARGB(30, 158, 158, 158),
//                 highlightColor: const Color.fromARGB(30, 158, 158, 158),
//                 borderRadius: BorderRadius.circular(15.0),
//                 onTap: () {
//                   if (!selectedIds.contains(list[index].id)) {
//                     print("added");
//                     // selectedIds.add(list[index].id!);
//                     onSelect(list[index], false);
//                   } else {
//                     print("removed");
//                     selectedIds.remove(list[index].id!);
//                     onSelect(list[index], true);
//                   }
//                 },
//                 child: const SizedBox.expand(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }
