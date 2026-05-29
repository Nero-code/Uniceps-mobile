import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine/i_exercises_contract.dart';
import 'package:uniceps/app/domain/helpers/result.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/exercise_details_result.dart';

class ExercisesCommands implements ICommand {
  final IExercisesContract _repo;
  const ExercisesCommands({required IExercisesContract repo}) : _repo = repo;

  Future<Either<Failure, bool>> checkExercises() => _repo.checkExercises();
  Future<Either<Failure, bool>> changeLibLanguage(String language) => _repo.changeLibLanguage(language);

  Future<Either<Failure, List<Exercise>>> getExercises() => _repo.getExercisesLib();
  Future<Either<Failure, Unit>> saveExercises(List<Exercise> lib) => _repo.saveExercisesLib(lib);

  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups() => _repo.getExerciseGroups();
  Future<Either<Failure, List<Exercise>>> getExercisesByGroup(MuscleGroup filter) => _repo.getExercisesByGroup(filter);

  Future<Either<Failure, ExerciseFilter>> getExerciseFilters() => _repo.getExerciseFilters();
  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(ExerciseFilter filter) =>
      _repo.getExercisesByFilter(filter);

  Stream<Result<double, Failure>> downloadImages(List<String> urls) => _repo.downloadImages(urls);

  Future<Either<Failure, ExerciseDetailsResult>> getExerciseDetails(String id) => _repo.getExerciseDetails(id);
}
