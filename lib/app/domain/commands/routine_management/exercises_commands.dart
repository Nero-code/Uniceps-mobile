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

  Future<Either<ExerciseFailure, bool>> checkExercises() => _repo.checkExercises();
  Future<Either<ExerciseFailure, bool>> changeLibLanguage(String language) => _repo.changeLibLanguage(language);

  Future<Either<ExerciseFailure, List<Exercise>>> getExercises() => _repo.getExercisesLib();
  Future<Either<ExerciseFailure, Unit>> saveExercises(List<Exercise> lib) => _repo.saveExercisesLib(lib);

  Future<Either<ExerciseFailure, List<MuscleGroup>>> getExerciseGroups() => _repo.getExerciseGroups();
  Future<Either<ExerciseFailure, List<Exercise>>> getExercisesByGroup(MuscleGroup filter) =>
      _repo.getExercisesByGroup(filter);

  Future<Either<ExerciseFailure, ExerciseFilter>> getExerciseFilters() => _repo.getExerciseFilters();
  Future<Either<ExerciseFailure, List<Exercise>>> getExercisesByFilter(ExerciseFilter filter) =>
      _repo.getExercisesByFilter(filter);

  Stream<Result<double, ExerciseFailure>> downloadImages(List<String> urls) => _repo.downloadImages(urls);

  Future<Either<ExerciseFailure, ExerciseDetailsResult>> getExerciseDetails(String id) => _repo.getExerciseDetails(id);
}
