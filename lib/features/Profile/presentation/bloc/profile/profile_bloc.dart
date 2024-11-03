import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/commands/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecases usecases;

  ProfileBloc({required this.usecases}) : super(ProfileInitial()) {
    on<GetProfileDataEvent>(
      (event, emit) async {
        emit(ProfileLoadingState());

        final either = await usecases.getProfileData();
        either.fold(
          (f) => emit(ProfileErrorState(failure: f)),
          (p) => emit(ProfileLoadedState(player: p)),
        );
      },
    );
    on<ProfileSubmitEvent>(
      (event, emit) async {
        emit(ProfileLoadingState());

        final either = await usecases.submitProfileData(
          event.player,
          isCreate: event.isCreate,
        );
        either.fold(
          (l) => emit(ProfileErrorState(failure: l)),
          (r) => emit(ProfileSubmittedState(player: r)),
        );
      },
    );
  }
}
