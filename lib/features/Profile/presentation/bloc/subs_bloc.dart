import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'subs_event.dart';
part 'subs_state.dart';

class SubsBloc extends Bloc<SubsEvent, SubsState> {
  final ProfileUsecases usecases;

  SubsBloc({required this.usecases}) : super(SubsInitial()) {
    on<SubsEvent>((event, emit) async {
      if (event is GetSubsEvent) {
        emit(SubsLoadingState());
        final either = await usecases.getSubs(event.gymId, event.pid);
        either.fold((f) {
          emit(SubsErrorState(f: f));
        }, (list) {
          emit(SubsLoadedState(list: list));
        });
      }
    });
  }
}
