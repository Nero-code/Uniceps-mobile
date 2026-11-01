import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/performance_entities/performance_result.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'metrics_state.dart';

class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit({required PerformanceCommands performanceCommands})
    : _performanceCommands = performanceCommands,
      super(const MetricsInitial());

  final PerformanceCommands _performanceCommands;

  Future<void> loadMetricsData({DateTime? fromDate, DateTime? toDate}) async {
    emit(const MetricsLoading());

    final overviewEither = await _performanceCommands.getPerformanceOverview(from: fromDate, to: toDate);

    overviewEither.fold(
      (failure) => emit(MetricsFailure(failure: failure)),
      (result) => emit(MetricsLoaded(result: result, fromDate: fromDate, toDate: toDate)),
    );
  }
}
