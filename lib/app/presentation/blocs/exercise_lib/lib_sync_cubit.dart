import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/services/exercise_lib_sync_service.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'lib_sync_cubit.freezed.dart';
part 'lib_sync_state.dart';

class LibSyncCubit extends Cubit<LibSyncState> {
  final ExerciseLibSyncService _syncService;
  LibSyncCubit(this._syncService) : super(const LibSyncState.initial());

  Future<void> syncLibrary() async {
    emit(const .syncing());
    final either = await _syncService.syncExercises();
    either.fold((l) => emit(.failure(failure: l)), (r) => emit(.success(total: r)));
  }
}
