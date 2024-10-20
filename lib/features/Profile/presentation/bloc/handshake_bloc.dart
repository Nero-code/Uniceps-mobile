import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'handshake_event.dart';
part 'handshake_state.dart';

class HandshakeBloc extends Bloc<HandshakeEvent, HandshakeState> {
  final ProfileUsecases usecases;
  HandshakeBloc({required this.usecases}) : super(HandshakeInitial()) {
    on<HandshakeEvent>((event, emit) async {
      // print("inside handshake bloc");
      emit(HandshakeLoadingState());
      if (event is GetAllHandShakeEvent) {
        final either = await usecases.getAllGymHandShake();
        either.fold(
          (fail) => emit(HandshakeErrorState(f: fail)),
          (list) => emit(HandshakeLoadedState(handshakes: list)),
        );
      }
      //  else if (event is GetAllAttendanceEvent) {
      //   final either = await usecases.gymAttendance(event.gymId);
      //   either.fold(
      //     (l) => emit(AttErrorState(f: l)),
      //     (r) => emit(AttDoneState(list: r)),
      //   );
      // }
    });
  }
}
