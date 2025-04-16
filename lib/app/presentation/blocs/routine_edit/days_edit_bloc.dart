import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'days_edit_event.dart';
part 'days_edit_state.dart';

class DaysEditBloc extends Bloc<DaysEditEvent, DaysEditState> {
  // final RoutineEditUsecases _usecases;
  List<RoutineDay> days = [];
  DaysEditBloc()
      :
        //  _usecases = usecases,
        super(DaysEditInitial()) {
    on<GetDaysEvent>((event, emit) async {
      emit(DaysEditLoadingState());
      emit(DaysEditLoadedState(days: days));
    });
    on<AddDayEvent>((event, emit) async {
      // final either = await _usecases.addDay(event.day);
      // either.fold(
      //   (f) => emit(DaysEditErrorState(failure: f)),
      //   (s) => emit(DaysEditLoadedState(days: s)),
      // );
      print("inside Days Bloc: ${days.length}");
      emit(DaysEditLoadingState());
      days.add(event.day);

      print("inside Days Bloc: ${days.length}");
      emit(DaysEditLoadedState(days: days));
    });
    on<RemoveDayEvent>((event, emit) async {
      emit(DaysEditLoadingState());
      days.removeAt(event.day.index);
      for (int i = event.day.index; i < days.length; i++) {
        days[i] = days[i].copyWith(index: i - 1);
      }
      emit(DaysEditLoadedState(days: days));
    });
    on<RenameDayEvent>((event, emit) async {
      emit(DaysEditLoadingState());
      print(days);
      days.removeAt(event.day.index);
      print(days);
      days.insert(event.day.index, event.day);
      print(days);
      emit(DaysEditLoadedState(days: days));
    });
    on<ReorderDaysEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      days = [];
      for (int i = 0; i < event.newOrder.length; i++) {
        days.add(event.newOrder[i].copyWith(index: i));
        print("Added day: ${event.newOrder[i].toString()}");
      }
      print("reorderEvent filled $days");

      emit(DaysEditLoadedState(days: days, version: event.version + 1));
    });
  }
}
