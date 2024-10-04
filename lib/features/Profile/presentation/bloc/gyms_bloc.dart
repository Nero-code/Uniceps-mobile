import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

part 'gyms_event.dart';
part 'gyms_state.dart';

class GymsBloc extends Bloc<GymsEvent, GymsState> {
  final ProfileUsecases usecases;
  GymsBloc({required this.usecases}) : super(GymsInitial()) {
    on<GymsEvent>((event, emit) async {
      // if (event is GetSubscribedToGym) {
      //   emit(GymsLoadingState());
      //   final either = await usecases.getSubscribedToGyms();
      //   either.fold((l) => emit(GymsErrorState(f: l)),
      //       (r) => emit(GymsLoadedState(list: r)));
      // } else
      if (event is GetAllAvailableGymsEvent) {
        emit(GymsLoadingState());
        final either = await usecases.getGyms();
        either.fold(
          (l) => emit(GymsErrorState(f: l)),
          (r) {
            final myGyms = <Gym>[];

            while (r.isNotEmpty && r.first.isSelected) {
              print("Gyms Bloc: GetGyms: Found 1 gym isSelected true");
              myGyms.add(r.first);
              r.removeAt(0);
            }

            emit(GymsLoadedState(
              restList: r,
              myGyms: myGyms,
            ));
          },
        );
      }
    });
  }
}
