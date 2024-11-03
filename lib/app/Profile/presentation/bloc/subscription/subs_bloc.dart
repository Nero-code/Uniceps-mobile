import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/Profile/domain/classes/subscription.dart';
import 'package:uniceps/app/Profile/domain/commands/usecases.dart';

part 'subs_event.dart';
part 'subs_state.dart';

class SubsBloc extends Bloc<SubsEvent, SubsState> {
  final ProfileUsecases usecases;

  SubsBloc({required this.usecases}) : super(SubsInitial()) {
    on<GetSubsEvent>((event, emit) async {
      emit(SubsLoadingState());
      final either = await usecases.getSubs(event.gymId, event.pid);
      either.fold((f) {
        emit(SubsErrorState(f: f));
      }, (list) {
        emit(SubsLoadedState(list: list));
      });
    });
  }
}
