import 'package:dartz/dartz.dart';
import 'package:uniceps/app/contracts/auth_repo.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandEmailSignin implements ICommand {
  final AuthRepo _repo;
  const CommandEmailSignin({required AuthRepo authRepo}) : _repo = authRepo;

  Future<Either<Failure, bool>> call({required String email}) async {
    return await _repo.signinWithEmail(email: email);
  }
}
