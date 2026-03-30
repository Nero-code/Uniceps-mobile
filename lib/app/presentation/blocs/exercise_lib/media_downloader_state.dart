part of 'media_downloader_cubit.dart';

enum MediaDownloaderStatus { initial, downloading, success, failure }

@freezed
abstract class MediaDownloaderState with _$MediaDownloaderState {
  const factory MediaDownloaderState({
    @Default(MediaDownloaderStatus.initial) MediaDownloaderStatus status,
    @Default(0.0) double progress,
    Failure? failure,
  }) = _MediaDownloaderState;
}
