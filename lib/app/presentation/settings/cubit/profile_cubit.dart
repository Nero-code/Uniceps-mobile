import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/commands/profile_usecases/profile_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecases _commands;
  ProfileCubit(this._commands) : super(const ProfileState.initial());
  Future<void> getProfile() async {
    emit(const ProfileState.loading());

    final either = await _commands.getProfile();
    either.fold(
      (l) => emit(ProfileState.error(l)),
      (r) => emit(ProfileState.loaded(r)),
    );
  }

  Future<void> saveProfile(Player p) async {
    emit(const ProfileState.loading());
    final either = await _commands.submitProfileData(p);
    either.fold(
      (l) => emit(ProfileState.error(l)),
      (r) => emit(ProfileState.loaded(p)),
    );
  }
}
