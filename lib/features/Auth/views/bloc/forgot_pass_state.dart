part of 'forgot_pass_bloc.dart';

sealed class FogotPassState extends Equatable {
  const FogotPassState();

  @override
  List<Object> get props => [];
}

final class FogotPassInitial extends FogotPassState {}

final class FPassLoadingState extends FogotPassState {}

final class FPassCodeSentState extends FogotPassState {}

final class FPassNewPassState extends FogotPassState {}

final class FPassErrorState extends FogotPassState {
  final Failure f;
  const FPassErrorState({required this.f});
}

final class FPassDoneState extends FogotPassState {}
