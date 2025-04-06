part of 'items_edit_bloc.dart';

sealed class ItemsEditState extends Equatable {
  const ItemsEditState();
  
  @override
  List<Object> get props => [];
}

final class ItemsEditInitial extends ItemsEditState {}
