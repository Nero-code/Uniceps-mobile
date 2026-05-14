import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'uni_summary_cubit.freezed.dart';
part 'uni_summary_state.dart';

class UniSummaryCubit extends Cubit<UniSummaryState> {
  final PerformanceCommands _commands;
  UniSummaryCubit({required PerformanceCommands commands})
    : _commands = commands,
      super(const UniSummaryState.initial());

  Future<void> getSummary() async {
    emit(const .loading());

    final either = await _commands.getSummery();
    either.fold((l) => emit(.failure(failure: l)), (r) => emit(.success(summary: r)));
  }
}
