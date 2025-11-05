import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/domain/commands/profile_usecases(old)/profile_usecases.dart';

part 'attendence_event.dart';
part 'attendence_state.dart';

class AttendenceBloc extends Bloc<AttendenceEvent, AttendenceState> {
  final ProfileUsecases usecases;
  // final CommandGetAttendenceAtGym getAttendenceAtGym;
  AttendenceBloc(this.usecases /**, this.getAttendenceAtGym*/)
      : super(AttendenceInitial()) {
    on<GetAttendenceEvent>((event, emit) async {
      emit(AttenedenceLoadingState());
      final either = await usecases.gymAttendance(event.gymId, event.pid);
      // final either2 = await getAttendenceAtGym(event.gymId, event.pid);
      either.fold(
        (l) => emit(AttenedenceErrorState(l)),
        (r) => emit(AttenedenceLoadedState(r)),
      );
    });
  }
}
