import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecases usecases;

  ProfileBloc({required this.usecases}) : super(ProfileInitial()) {
    on<ProfileEvent>(
      (event, emit) async {
        // emit(MeasurementsLoadingState());
        if (event is GetProfileDataEvent) {
          emit(ProfileLoadingState());

          final either = await usecases.getProfileData();
          either.fold((f) {
            emit(ProfileErrorState(failure: f));
          }, (p) {
            emit(ProfileLoadedState(player: p));
          });
        }
      },
    );
  }
}
