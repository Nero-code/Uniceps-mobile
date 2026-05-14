import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';

part 'exercise_filter_state.dart';

class ExerciseFilterCubit extends Cubit<ExerciseFilterState> {
  final ExercisesCommands _commands;
  ExerciseFilterCubit({required ExercisesCommands commands})
    : _commands = commands,
      super(AvailableExercisesFilter(filter: .empty()));

  void getFilters() async {
    final either = await _commands.getExerciseFilters();
    either.fold((l) {}, (r) => emit(AvailableExercisesFilter(filter: r)));
  }
}
