import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetMeasurements implements ICommand {
  final ProfileRepo _repo;
  const CommandGetMeasurements({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Measurement>>> call() async {
    return await _repo.getMeasurement();
  }
}
