import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingInitial()) {
    on<TrainingEvent>((event, emit) {
      if (event is ProgramLoadingEvent) {
        emit(TrainingProgramLoadingState());
      } else if (event is GetProgramEvent) {
      } else if (event is ExercisesLoadingEvent) {
        emit(ExercisesLoadingState());
      } else if (event is GetExercisesEvent) {
      } else if (event is SubscriptionsLoadingEvent) {
        emit(SubscriptionsLoadingState());
      } else if (event is GetSubscriptionsEvent) {}
    });
  }
}
