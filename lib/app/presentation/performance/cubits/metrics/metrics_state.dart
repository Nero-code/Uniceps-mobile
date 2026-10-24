part of 'metrics_cubit.dart';

abstract class MetricsState {
  const MetricsState();
}

class MetricsInitial extends MetricsState {
  const MetricsInitial();
}

class MetricsLoading extends MetricsState {
  const MetricsLoading();
}

class MetricsLoaded extends MetricsState {
  final PerformanceResult result;
  final DateTime? fromDate;
  final DateTime? toDate;

  const MetricsLoaded({required this.result, this.fromDate, this.toDate});
}

class MetricsFailure extends MetricsState {
  final PerformanceFailure failure;
  const MetricsFailure({required this.failure});
}
