part of 'locale_cubit.dart';

// sealed class LocaleState extends Equatable {
//   const LocaleState();

//   @override
//   List<Object> get props => [];
// }

// final class LocaleInitial extends LocaleState {}

final class ChangedLangState {
  final Locale locale;
  ChangedLangState({required this.locale});
}
