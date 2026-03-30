import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'media_downloader_cubit.freezed.dart';
part 'media_downloader_state.dart';

class MediaDownloaderCubit extends Cubit<MediaDownloaderState> {
  final ExercisesCommands _commands;

  MediaDownloaderCubit(this._commands) : super(const MediaDownloaderState());

  void startLibDownload() async {
    final either = await _commands.getExercises();
    return either.fold(
      (l) => emit(state.copyWith(progress: 0, failure: l, status: .failure)),
      (r) => downloadImages(r.map((e) => e.apiId).toList()),
    );
  }

  void downloadImages(List<String> ids) {
    emit(state.copyWith(status: .downloading, progress: 0.0, failure: null));

    _commands.downloadImages(ids).listen((result) {
      if (result.error == null) {
        emit(state.copyWith(progress: result.data, status: result.data >= 1.0 ? .success : .downloading));
      } else {
        emit(state.copyWith(status: .failure, failure: result.error));
      }
    });
  }
}
