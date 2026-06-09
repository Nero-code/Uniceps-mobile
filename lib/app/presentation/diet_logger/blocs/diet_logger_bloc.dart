import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_logger_bloc.freezed.dart';
part 'diet_logger_event.dart';
part 'diet_logger_state.dart';

class DietLoggerBloc extends Bloc<DietLoggerEvent, DietLoggerState> {
  DietLoggerBloc() : super(const DietLoggerState.initial()) {
    on<DietLoggerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
