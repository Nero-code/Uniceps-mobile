part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.found() = _Found;
  const factory ProfileState.notFound() = _NotFound;
}
