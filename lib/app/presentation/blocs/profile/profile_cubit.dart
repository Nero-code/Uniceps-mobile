import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/domain/commands/profile_usecases/profile_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/logging/app_logger.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._commands) : super(const .initial());
  final ProfileUsecases _commands;
  Future<void> initializeProfile(Profile p) async {
    emit(const .loading());
    final either = await _commands.initializeProfileData(p);
    logger.i(p.toString());
    either.fold((l) => emit(.error(l)), (r) => emit(.loaded(p)));
  }

  Future<void> getProfile() async {
    emit(const .loading());
    final either = await _commands.getProfile();
    either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
  }

  Future<void> saveProfile(Profile p) async {
    emit(const .loading());
    final either = await _commands.submitProfileData(p);
    logger.i(p.toString());
    either.fold((l) => emit(.error(l)), (r) => emit(.loaded(p)));
  }

  Future<void> uploadProfilePic(Profile p, Uint8List image) async {
    emit(const .loading());
    final either = await _commands.changeProfilePic(image);
    either.fold((l) => emit(.error(l)), (r) => emit(.loaded(p)));
  }

  Future<void> deleteProfilePic(Profile p) async {
    emit(const .loading());
    final either = await _commands.deleteProfilePic();
    either.fold((l) => emit(.error(l)), (r) => emit(.loaded(p.copyWith(deletePhoto: true))));
  }

  Future<void> syncProfile() async {
    await _commands.syncProfile();
  }
}
