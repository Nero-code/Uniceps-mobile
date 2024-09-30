import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'attendence_event.dart';
part 'attendence_state.dart';

class AttendenceBloc extends Bloc<AttendenceEvent, AttendenceState> {
  final ProfileUsecases usecases;
  AttendenceBloc(this.usecases) : super(AttendenceInitial()) {
    on<AttendenceEvent>((event, emit) async {
      if (event is GetAttendenceEvent) {
        emit(AttenedenceLoadingState());
        final either = await usecases.gymAttendance(event.gymId, event.pid);
        either.fold(
          (l) => emit(AttenedenceErrorState(l)),
          (r) => emit(AttenedenceLoadedState(r)),
        );
      }
    });
  }
}
