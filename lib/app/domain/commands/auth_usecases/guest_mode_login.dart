import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';
import 'package:uniceps/core/errors/failure.dart';

class GuestModeUsecase implements ICommand {
  const GuestModeUsecase({required this.authRepo});

  final AuthRepo authRepo;

  Future<Either<Failure, UserModel>> call() async {
    return await authRepo.loginAsGuest();
  }
}
