import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/Profile/domain/classes/player_in_gym.dart';
import 'package:uniceps/app/Profile/domain/commands/usecases.dart';

part 'player_gym_event.dart';
part 'player_gym_state.dart';

class PlayerGymBloc extends Bloc<PlayerGymEvent, PlayerGymState> {
  final ProfileUsecases usecases;
  PlayerGymBloc({required this.usecases}) : super(PlayerGymInitial()) {
    on<GetPlayerInGymEvent>((event, emit) async {
      emit(PlayerInGymLoadingState());
      final either = await usecases.getPlayerInGym(event.gymId, event.pid);
      either.fold((l) => emit(PlayerInGymErrorState(l)),
          (r) => emit(PlayerInGymLoadedState(data: r)));
    });
  }
}
