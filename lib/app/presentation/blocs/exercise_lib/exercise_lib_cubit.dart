import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';

part 'exercise_lib_cubit.freezed.dart';
part 'exercise_lib_state.dart';

class ExerciseLibCubit extends Cubit<ExerciseLibState> {
  final ExercisesCommands _commands;
  ExerciseLibCubit(this._commands) : super(const .initial());

  void checkExercises() async {
    final either = await _commands.checkExercises();
    either.fold((l) => emit(const .needsUpdate()), (r) => emit(r ? const .statusGood() : const .needsUpdate()));
  }
}
