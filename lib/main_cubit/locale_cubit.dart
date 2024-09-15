import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangedLangState> {
  LocaleCubit() : super(ChangedLangState(locale: const Locale('ar')));

  ///
  ///     Get Already Saved Language on App open from SharedPrefrences...
  ///
  Future<void> getSavedLanguageCode() async {
    final String langCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangedLangState(locale: Locale(langCode)));
  }

  ///
  ///     Change language in-app by user interaction...
  ///
  Future<void> changeLanguage(String langCode) async {
    await LanguageCacheHelper().cacheLanguageCode(langCode);
    emit(ChangedLangState(locale: Locale(langCode)));
  }
}
