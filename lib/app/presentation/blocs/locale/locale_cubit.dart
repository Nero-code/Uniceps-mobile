// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uniceps/app/services/language_cache_helper.dart';
//
// part 'locale_state.dart';
//
// class LocaleCubit extends Cubit<ChangedLangState> {
//   final LanguageCacheHelper _languageCacheHelper;
//   LocaleCubit({required LanguageCacheHelper languageCacheHelper})
//     : _languageCacheHelper = languageCacheHelper,
//       super(ChangedLangState(locale: const Locale('ar')));
//
//   ///
//   ///     Get Already Saved Language on App open from SharedPreferences...
//   ///
//   Future<void> getSavedLanguageCode() async {
//     final String langCode = await _languageCacheHelper.getCachedLanguageCode();
//     emit(ChangedLangState(locale: Locale(langCode)));
//   }
//
//   ///
//   ///     Change language in-app by user interaction...
//   ///
//   Future<void> changeLanguage(String langCode) async {
//     await _languageCacheHelper.cacheLanguageCode(langCode);
//     emit(ChangedLangState(locale: Locale(langCode)));
//   }
// }
