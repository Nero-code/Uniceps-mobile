import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_logger_bloc.freezed.dart';
part 'diet_logger_event.dart';
part 'diet_logger_state.dart';

class DietLoggerBloc extends Bloc<DietLoggerEvent, DietLoggerState> {
  final DietCommands _commands;
  DietLoggerBloc({required DietCommands commands}) : _commands = commands, super(const DietLoggerState.initial()) {
    on<_Started>((event, emit) async {
      emit(const .loading());

      final either = await _commands.getTodayLogs();
      either.fold((l) => emit(.failure(failure: l)), (r) => emit(.success(logs: r)));
    });
    on<_LogServing>((event, emit) async {
      final either = await _commands.logMeal(event.log);
      either.fold((l) => emit(.failure(failure: l)), (r) => add(const .started()));
    });
  }
}
