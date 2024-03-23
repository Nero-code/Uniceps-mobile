part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

final class ThemeSwitch extends MainEvent {}

final class LanguageSwitch extends MainEvent {}
