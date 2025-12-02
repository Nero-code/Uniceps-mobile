import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'routine_management_event.dart';
part 'routine_management_state.dart';

class RoutineManagementBloc extends Bloc<RoutineManagementEvent, RoutineManagementState> {
  final RoutineManagementCommands _usecases;

  RoutineManagementBloc({required RoutineManagementCommands routineManagementUsecases})
      : _usecases = routineManagementUsecases,
        super(RoutineManagementInitial()) {
    on<GetRoutinesEvent>((event, emit) async {
      emit(RoutineManagementLoadingState());

      final either = await _usecases.getAllRoutines();
      either.fold(
        (l) => emit(RoutineManagementErrorState(failure: l)),
        (r) => emit(RoutineManagementLoadedState(routines: r)),
      );
    });

    on<CreateRoutineEvent>((event, emit) async {
      emit(RoutineManagementLoadingState());

      final either = await _usecases.createRoutine(event.name);
      either.fold(
        (l) => emit(RoutineManagementErrorState(failure: l)),
        (r) => emit(RoutineManagementLoadedState(routines: r)),
      );
    });

    on<UpdateRoutineEvent>((event, emit) async {
      emit(RoutineManagementLoadingState());

      final either = await _usecases.updateRoutine(event.routineToUpdate);
      either.fold(
        (l) => emit(RoutineManagementErrorState(failure: l)),
        (r) => emit(RoutineManagementLoadedState(routines: r)),
      );
    });

    on<SetCurrentRoutineEvent>(
      (event, emit) async {
        emit(RoutineManagementLoadingState());

        final either = await _usecases.setCurrentRoutine(event.routine);
        either.fold(
          (l) => emit(RoutineManagementErrorState(failure: l)),
          (r) => emit(RoutineManagementLoadedState(routines: r, version: event.version + 1)),
        );
      },
    );

    on<DeleteRoutineEvent>((event, emit) async {
      emit(RoutineManagementLoadingState());

      final either = await _usecases.deleteRoutine(event.routineToDelete);
      either.fold(
        (l) => emit(RoutineManagementErrorState(failure: l)),
        (r) => emit(RoutineManagementLoadedState(routines: r)),
      );
    });
    on<ShareRoutineEvent>((event, emit) async {});
  }
}
