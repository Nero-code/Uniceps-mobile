import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'practice_state.dart';

class PracticeCubit extends Cubit<PracticeState> {
  final PracticeCommands _commands;
  PracticeCubit({required PracticeCommands commands})
      : _commands = commands,
        super(const PracticeState());

  Future<void> getPracticeDay(int dayId) async {
    emit(PracticeLoadingState());

    final either = await _commands.getdayItems(dayId);
    either.fold(
      (l) => emit(PracticeErrorState(failure: l)),
      (r) => emit(PracticeLoadedState(day: r)),
    );
  }
}
