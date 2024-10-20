part of 'progress_bloc.dart';

sealed class ProgressState extends Equatable {
  const ProgressState(this.percent);
  final double percent;

  @override
  List<Object> get props => [];
}

final class ProgressInitial extends ProgressState {
  ProgressInitial(super.percent);
}

final class ProgressUpdated extends ProgressState {
  const ProgressUpdated(super.percent);
}
