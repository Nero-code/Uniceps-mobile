import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/exercise_details_screen.dart';

class PracticeHeader extends StatelessWidget {
  const PracticeHeader({super.key, required this.item});

  final RoutineItem item;
  // final List<TLog> logs;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              item.exercise.imageBitMap != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.memory(item.exercise.imageBitMap!, width: screenSize.width * 0.3),
                    )
                  : const Icon(Icons.broken_image, size: 50),
              const SizedBox(width: 10),
              Expanded(
                child: BlocSelector<SessionBloc, SessionState, List<TLog>>(
                  selector: (state) {
                    return state.maybeMap(
                      loaded: (loaded) =>
                          loaded.session.logs.where((log) => log.exerciseId == item.exercise.apiId).toList(),
                      orElse: () => [],
                    );
                  },
                  builder: (context, logs) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.exercise.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: item.sets.isNotEmpty ? logs.length / item.sets.length : 0,
                          backgroundColor: Colors.grey.shade200,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        const SizedBox(height: 5),
                        Text("${logs.length} / ${item.sets.length}", textDirection: TextDirection.ltr),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          top: 0.0,
          start: 0.0,
          child: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.info_outline),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExerciseDetailsScreen(exerciseId: item.exercise.apiId)),
            ),
          ),
        ),
      ],
    );
  }
}
