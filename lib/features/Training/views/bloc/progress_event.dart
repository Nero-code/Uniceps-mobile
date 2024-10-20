part of 'progress_bloc.dart';

sealed class ProgressEvent extends Equatable {
  const ProgressEvent(this.progress);
  final double progress;
  @override
  List<Object> get props => [];
}

final class ProgressUpdateEvent extends ProgressEvent {
  const ProgressUpdateEvent(super.progress);
}
