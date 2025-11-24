import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/core/constants/constants.dart';

const quotekey = 'DailyQuote';

class CaptianQuotesService {
  final SharedPreferences _prefs;
  const CaptianQuotesService({required SharedPreferences prefs}) : _prefs = prefs;

  Future<DailyQuote> getQuote() async {
    final tempQuotes = jsonDecode(await rootBundle.loadString(ASSET_QUOTES)) as List;
    final List<Map<Lang, String>> quotes = [];
    for (var i in tempQuotes) {
      final q = (i as Map).map((key, value) => MapEntry(parseLang(key.toString()), value.toString()));
      quotes.add(q);
    }
    final oldQuote = _prefs.getString(quotekey);
    DailyQuote quote;
    if (oldQuote == null) {
      final sentance = quotes[Random().nextInt(quotes.length - 1)];
      quote = DailyQuote(quote: sentance, date: DateTime.now());
    } else {
      final decodedOldQuote = DailyQuote.fromJson(jsonDecode(oldQuote) as Map<String, dynamic>);

      if (decodedOldQuote.date.difference(DateTime.now()).inDays == 0) {
        quote = decodedOldQuote;
      } else {
        final sentance = quotes[Random().nextInt(quotes.length - 1)];
        quote = DailyQuote(quote: sentance, date: DateTime.now());
      }
    }
    await _prefs.setString(quotekey, jsonEncode(quote.toJson()));
    return quote;
  }
}

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

  factory DailyQuote.fromJson(Map<String, dynamic> json) {
    final q = json['quote'] as Map;
    Map<Lang, String> quote = {};
    for (MapEntry m in q.entries) {
      quote.addAll({parseLang(m.key.toString()): m.value});
    }

    return DailyQuote(quote: quote, date: DateTime.parse(json['date']));
  }

  Map<String, dynamic> toJson() =>
      {'quote': quote.map((lang, sentance) => MapEntry(lang.name, sentance)), 'date': date.toIso8601String()};
}
