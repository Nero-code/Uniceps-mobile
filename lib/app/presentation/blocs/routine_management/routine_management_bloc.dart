import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'routine_management_event.dart';
part 'routine_management_state.dart';

class RoutineManagementBloc
    extends Bloc<RoutineManagementEvent, RoutineManagementState> {
  RoutineManagementBloc() : super(RoutineManagementInitial()) {
    on<CreateRoutineEvent>((event, emit) {});
    on<UpdateRoutineEvent>((event, emit) {});
    on<DeleteRoutineEvent>((event, emit) {});
    on<ShareRoutineEvent>((event, emit) {});
  }
}
