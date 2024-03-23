part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitial extends MainState {}

final class ActiveState extends MainState {
  final ThemeMode themeMode;

  final Language language;
  const ActiveState({required this.themeMode, required this.language});
}
