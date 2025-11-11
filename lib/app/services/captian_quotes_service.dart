import 'package:uniceps/core/constants/constants.dart';

class CaptianQuotesService {}

/// The `DailyQuote` class for **Captain Uni** card.
///
/// This class is serializable, meaning it should be stored as a hole
/// entity in [Prefrences] just like an App config.
class DailyQuote {
  /// Holds the quote with its translations for dynamic switching.
  final Map<Lang, String> quote;

  /// `date` to ensure a quote for an entire day.
  final DateTime date;

  const DailyQuote({required this.quote, required this.date});

  factory DailyQuote.fromJson(Map<String, dynamic> json) =>
      DailyQuote(quote: json['quote'], date: DateTime.parse(json['date']));

  Map<String, dynamic> toJson() => {'quote': quote, 'date': date.toIso8601String()};
}
