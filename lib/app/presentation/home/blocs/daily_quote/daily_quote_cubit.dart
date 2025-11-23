import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/services/captian_quotes_service.dart';

part 'daily_quote_state.dart';
part 'daily_quote_cubit.freezed.dart';

class DailyQuoteCubit extends Cubit<DailyQuoteState> {
  final CaptianQuotesService _quotesService;
  DailyQuoteCubit(this._quotesService) : super(const DailyQuoteState.initial());

  void getQuote() async {
    final quote = await _quotesService.getQuote();
    emit(DailyQuoteState.loaded(quote));
  }
}
