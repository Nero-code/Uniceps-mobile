import 'package:dartz/dartz.dart';
import 'package:uniceps/app/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetSubscriptions implements ICommand {
  final ProfileRepo _repo;
  const CommandGetSubscriptions({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Subscription>>> call(
      String gymId, String pid) async {
    return await _repo.getSubscriptions(gymId, pid);
  }
}
