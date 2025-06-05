part of 'practice_cubit.dart';

class PracticeState extends Equatable {
  const PracticeState();
  @override
  List<Object?> get props => [];
}

final class PracticeLoadingState extends PracticeState {}

final class PracticeLoadedState extends PracticeState {
  final RoutineDay day;

  const PracticeLoadedState({required this.day});
}

final class PracticeErrorState extends PracticeState {
  final Failure failure;

  const PracticeErrorState({required this.failure});
}
