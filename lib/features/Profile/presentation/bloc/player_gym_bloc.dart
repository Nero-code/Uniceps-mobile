import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/player_in_gym.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'player_gym_event.dart';
part 'player_gym_state.dart';

class PlayerGymBloc extends Bloc<PlayerGymEvent, PlayerGymState> {
  final ProfileUsecases usecases;
  PlayerGymBloc({required this.usecases}) : super(PlayerGymInitial()) {
    on<PlayerGymEvent>((event, emit) async {
      if (event is GetPlayerInGymEvent) {
        emit(PlayerInGymLoadingState());
        final either = await usecases.getPlayerInGym(event.gymId);
        either.fold((l) => emit(PlayerInGymErrorState(l)),
            (r) => emit(PlayerInGymLoadedState(data: r)));
      }
    });
  }
}
