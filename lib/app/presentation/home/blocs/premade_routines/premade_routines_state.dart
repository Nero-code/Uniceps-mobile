part of 'premade_routines_cubit.dart';

@freezed
class PremadeRoutinesState with _$PremadeRoutinesState {
  const factory PremadeRoutinesState.initial() = _Initial;
  const factory PremadeRoutinesState.loading() = _Loading;
  const factory PremadeRoutinesState.success({required List<PremadeRoutine> premade}) = _Success;
  const factory PremadeRoutinesState.failure({required PremadeFailure failure}) = _Failure;
}
