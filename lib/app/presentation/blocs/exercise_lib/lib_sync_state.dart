part of 'lib_sync_cubit.dart';

@freezed
class LibSyncState with _$LibSyncState {
  const factory LibSyncState.initial() = _Initial;
  const factory LibSyncState.syncing() = _Syncing;
  const factory LibSyncState.success({required int total}) = _Success;
  const factory LibSyncState.failure({required LibSyncFailure failure}) = _Failure;
}
