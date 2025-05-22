import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/stores/auth/email_auth_repo.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandEmailSignin implements ICommand {
  final I2FAuthRepo _emailRepo;
  const CommandEmailSignin({required I2FAuthRepo emailRepo})
      : _emailRepo = emailRepo;

  Future<Either<Failure, bool>> call({required String email}) async {
    return await _emailRepo.verifyCredentials(credential: email);
  }
}
