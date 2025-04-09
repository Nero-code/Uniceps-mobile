import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/fakes/routine_fakes.dart';

part 'routine_management_event.dart';
part 'routine_management_state.dart';

class RoutineManagementBloc
    extends Bloc<RoutineManagementEvent, RoutineManagementState> {
  // final RoutineManagementUsecases _usecases;
  RoutineManagementBloc()
      :
        // _usecases = usecases,
        super(RoutineManagementInitial()) {
    on<GetRoutinesEvent>((event, emit) {
      emit(RoutineManagementLoadedState(routines: [fakeRoutine]));
    });
    on<CreateRoutineEvent>((event, emit) {});
    on<UpdateRoutineEvent>((event, emit) {});
    on<DeleteRoutineEvent>((event, emit) {});
    on<ShareRoutineEvent>((event, emit) {});
  }
}
