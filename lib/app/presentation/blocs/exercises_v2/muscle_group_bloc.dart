import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'muscle_group_event.dart';
part 'muscle_group_state.dart';

class MuscleGroupBloc extends Bloc<MuscleGroupEvent, MuscleGroupState> {
  final ExercisesCommands _commands;
  MuscleGroupBloc({required ExercisesCommands commands})
      : _commands = commands,
        super(MuscleGroupInitial()) {
    on<GetMuscleGroupsEvent>((event, emit) async {
      emit(MuscleGroupLoadingState());

      final either = await _commands.getExerciseGroups();
      either.fold(
        (l) => emit(MuscleGroupErrorState(failure: l)),
        (r) => emit(MuscleGroupLoadedState(groups: r)),
      );
    });
  }
}
