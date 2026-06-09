// import 'dart:ui';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LanguageCacheHelper {
//   const LanguageCacheHelper({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;
//   final SharedPreferences _sharedPreferences;
//
//   Future<void> cacheLanguageCode(String languageCode) async {
//     await _sharedPreferences.setString("LOCALE", languageCode);
//   }
//
//   Future<String> getCachedLanguageCode() async {
//     final cachedLanguageCode = _sharedPreferences.getString("LOCALE");
//     if (cachedLanguageCode != null) {
//       return cachedLanguageCode;
//     } else {
//       final sysLang = PlatformDispatcher.instance.locale.languageCode;
//       if (['ar', 'en'].contains(sysLang)) {
//         cacheLanguageCode(sysLang);
//         return sysLang;
//       }
//       cacheLanguageCode('en');
//       return 'en';
//     }
//   }
//
//   Future<void> saveExercisesLibContentLanguage(String languageCode) async {
//     await _sharedPreferences.setString("ExercisesLibContentLanguage", languageCode);
//   }
//
//   String getExercisesLibContentLanguage() {
//     final cachedLanguageCode = _sharedPreferences.getString("ExercisesLibContentLanguage");
//     if (cachedLanguageCode != null) {
//       return cachedLanguageCode;
//     } else {
//       final sysLang = PlatformDispatcher.instance.locale.languageCode;
//       if (['ar', 'en'].contains(sysLang)) {
//         saveExercisesLibContentLanguage(sysLang);
//         return sysLang;
//       }
//       saveExercisesLibContentLanguage('en');
//       return 'en';
//     }
//   }
// }
