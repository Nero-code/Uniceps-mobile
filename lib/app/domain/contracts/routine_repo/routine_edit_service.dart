import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class RoutineEditRepo {
  //  ROUTINE DAYS EDIT
  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> reorderDays(List<RoutineDay> days);

  //  ROUTINE ITEMS EDIT
  Future<Either<Failure, List<RoutineItem>>> addItem(RoutineItem item);
  Future<Either<Failure, List<RoutineItem>>> removeItem(RoutineItem item);
  //  ROUTINE SETS EDIT
}
