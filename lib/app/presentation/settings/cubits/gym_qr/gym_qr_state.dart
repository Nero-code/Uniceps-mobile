part of 'gym_qr_cubit.dart';

@freezed
class GymQrState with _$GymQrState {
  const factory GymQrState.initial() = _Initial;
  const factory GymQrState.loading() = _Loading;
  const factory GymQrState.loaded(String qr) = _Loaded;
}
