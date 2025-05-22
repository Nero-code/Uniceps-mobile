import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetAttendenceAtGym implements ICommand {
  final ProfileRepo _repo;
  const CommandGetAttendenceAtGym({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Attendence>>> call(
      String gymId, String pid) async {
    return await _repo.gymAttendence(gymId, pid);
  }
}
