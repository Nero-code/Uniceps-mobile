import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
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

        print("Inside profile bloc");
        if (event is GetProfileDataEvent) {
          emit(ProfileLoadingState());

          print("Inside profile bloc");
          final either = await usecases.getProfileData();
          either.fold(
            (f) => emit(ProfileErrorState(failure: f)),
            (p) => emit(ProfileLoadedState(player: p)),
          );
          print("Inside profile bloc 2");
        } else if (event is ProfileSubmitEvent) {
          emit(ProfileLoadingState());
          print("Profile Submit Bloc");
          final either = await usecases.submitProfileData(
            event.player,
            isCreate: event.isCreate,
          );
          // either.fold(
          //   (l) => emit(ProfileErrorState(failure: l)),
          //   (r) => emit(ProfileSubmittedState(player: r)),
          either.fold((l) {
            print(l.getErrorMessage());
            emit(ProfileErrorState(failure: l));
          }, (r) {
            print(r.toString());
            emit(ProfileSubmittedState(player: r));
          });
        }
      },
    );
  }
}
