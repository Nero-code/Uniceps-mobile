part of 'update_cubit.dart';

@freezed
class UpdateState with _$UpdateState {
  const factory UpdateState.initial() = _Initial;
  const factory UpdateState.needsUpdate(Version version) = _NeedsUpdate;
  const factory UpdateState.latestVersion() = _LatestVersion;
}
