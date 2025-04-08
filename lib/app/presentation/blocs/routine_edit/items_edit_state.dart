part of 'items_edit_bloc.dart';

sealed class ItemsEditState extends Equatable {
  const ItemsEditState();

  @override
  List<Object> get props => [];
}

final class ItemsEditInitial extends ItemsEditState {}

final class ItemsEditLoadingState extends ItemsEditState {}

final class ItemsEditLoadedState extends ItemsEditState {
  final List<RoutineItem> items;

  const ItemsEditLoadedState({required this.items});
}

final class ItemsEditErrorState extends ItemsEditState {
  final Failure failure;

  const ItemsEditErrorState({required this.failure});
}
