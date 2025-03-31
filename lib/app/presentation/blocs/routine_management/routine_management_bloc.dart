import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

part 'routine_management_event.dart';
part 'routine_management_state.dart';

class RoutineManagementBloc
    extends Bloc<RoutineManagementEvent, RoutineManagementState> {
  RoutineManagementBloc() : super(RoutineManagementInitial()) {
    on<RoutineManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
