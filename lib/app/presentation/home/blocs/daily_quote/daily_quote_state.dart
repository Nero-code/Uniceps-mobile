part of 'daily_quote_cubit.dart';

@freezed
class DailyQuoteState with _$DailyQuoteState {
  const factory DailyQuoteState.initial() = _Initial;
  const factory DailyQuoteState.loaded(DailyQuote quote) = _Loaded;
}
