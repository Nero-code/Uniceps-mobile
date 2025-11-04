part of 'items_edit_bloc.dart';

sealed class ItemsEditState extends Equatable {
  const ItemsEditState();

  @override
  List<Object> get props => [];
}

final class ItemsEditInitial extends ItemsEditState {}

final class ItemsEditLoadingState extends ItemsEditState {}

final class ItemsEditLoadedState extends ItemsEditState {
  final int version;
  final List<RoutineItem> items;

  const ItemsEditLoadedState({required this.items, this.version = 0});

  @override
  List<Object> get props => [version, items.length];
}

final class ItemsEditErrorState extends ItemsEditState {
  final Failure failure;

  const ItemsEditErrorState({required this.failure});
}

final class ItemsDownloadingState extends ItemsEditState {
  final double progress;

  const ItemsDownloadingState({required this.progress});
  @override
  List<Object> get props => [progress];
}
