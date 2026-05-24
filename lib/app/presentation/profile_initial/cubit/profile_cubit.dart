import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/domain/commands/profile_usecases/profile_usecases.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecases _commands;
  ProfileCubit(this._commands) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    final either = await _commands.getProfile();
    either.fold((l) => emit(const ProfileState.notFound()), (r) => emit(const ProfileState.found()));
  }

  Future<void> saveProfile(Profile m) async {
    final either = await _commands.submitProfileData(m);
    either.fold((l) => emit(const ProfileState.notFound()), (r) => emit(const ProfileState.found()));
  }
}
