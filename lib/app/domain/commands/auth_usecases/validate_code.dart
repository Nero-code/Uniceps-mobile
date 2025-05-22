import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandValidateCode implements ICommand {
  final AuthRepo _repo;
  const CommandValidateCode({required AuthRepo authRepo}) : _repo = authRepo;

  Future<Either<Failure, bool>> call(
      {required String code,
      required String email,
      required String notifyToken}) async {
    return await _repo.validateEmail(
        code: code, email: email, notifyToken: notifyToken);
  }
}
