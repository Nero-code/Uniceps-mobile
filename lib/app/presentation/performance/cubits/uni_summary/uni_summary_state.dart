part of 'uni_summary_cubit.dart';

@freezed
class UniSummaryState with _$UniSummaryState {
  const factory UniSummaryState.initial() = _Initial;
  const factory UniSummaryState.loading() = _Loading;
  const factory UniSummaryState.success({required UnicepsSummery summary}) = _Success;
  const factory UniSummaryState.failure({required PerformanceFailure failure}) = _Failure;
}
