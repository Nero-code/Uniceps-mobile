import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/commands/training_usecases(old)/training_usecases.dart';

part 'current_gym_event.dart';
part 'current_gym_state.dart';

class CurrentGymBloc extends Bloc<CurrentGymEvent, CurrentGymState> {
  final TrainingUsecases usecases;
  CurrentGymBloc({required this.usecases}) : super(CurrentGymInitial()) {
    on<GetSubscribedToGymEvent>((event, emit) async {
      emit(CurrentGymLoadingState());
      final either = await usecases.getSubscribedToGyms();
      either.fold(
        (l) => emit(CurrentGymErrorState(l)),
        (r) {
          Gym? current;
          for (var i in r) {
            if (i.isCurrent) {
              current = i;
              break;
            }
          }
          if (current != null) {
            r.remove(current);
            r.insert(0, current);
          }
          current ??= r.first;
          emit(
            CurrentGymLoadedState(
              r,
              current,
            ),
          );
        },
      );
    });

    on<SetSelectedGymEvent>(
      (event, emit) async {
        // print("DEBUG: Got event ${event.runtimeType}");
        emit(CurrentGymLoadingState());
        final either = await usecases.setSelectedGym(event.gymId);
        either.fold((l) => emit(CurrentGymLoadingState()),
            (r) => emit(CurrentGymUpdatedState()));
      },
    );
  }
}
