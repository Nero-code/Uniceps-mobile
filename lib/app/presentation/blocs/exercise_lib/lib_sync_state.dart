part of 'lib_sync_cubit.dart';

@freezed
class LibSyncState with _$LibSyncState {
  const factory LibSyncState.initial() = _Initial;
  const factory LibSyncState.loading() = _Loading;
  const factory LibSyncState.syncing({required double progress}) = _Syncing;
  const factory LibSyncState.success() = _Success;
  const factory LibSyncState.failure({required LibSyncFailure failure}) = _Failure;
}
