import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/exercise_details_result.dart';

part 'exercise_details_cubit.freezed.dart';
part 'exercise_details_state.dart';

class ExerciseDetailsCubit extends Cubit<ExerciseDetailsState> {
  ExerciseDetailsCubit({required ExercisesCommands commands}) : _commands = commands, super(const .initial());
  final ExercisesCommands _commands;

  Future<void> getExerciseDetails(String id) async {
    emit(const .loading());
    final either = await _commands.getExerciseDetails(id);
    either.fold((l) => emit(.failure(f: l)), (r) => emit(.success(result: r)));
  }
}
