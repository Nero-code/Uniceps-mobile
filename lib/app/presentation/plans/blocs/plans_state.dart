part of 'plans_bloc.dart';

@freezed
class PlansState with _$PlansState {
  const factory PlansState.initial() = _Initial;
  const factory PlansState.loading() = _Loading;
  const factory PlansState.loaded(Plan p) = _Loaded;
  const factory PlansState.buyPlanAndReset(PaymentResponse paymentResponse) = _BuyPlanAndReset;
  const factory PlansState.error(Failure f) = _Error;
}
