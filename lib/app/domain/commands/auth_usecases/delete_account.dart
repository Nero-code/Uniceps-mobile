import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandDeleteAccount implements ICommand {
  final AuthRepo _repo;
  const CommandDeleteAccount({required AuthRepo authRepo}) : _repo = authRepo;
  Future<Either<Failure, bool>> call() async {
    return await _repo.deleteAccount();
  }
}
