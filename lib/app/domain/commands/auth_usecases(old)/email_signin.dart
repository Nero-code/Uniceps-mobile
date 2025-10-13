// import 'package:dartz/dartz.dart';
// import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
// import 'package:uniceps/app/domain/commands/i_command.dart';
// import 'package:uniceps/core/errors/failure.dart';

// class CommandEmailSignin implements ICommand {
//   final IOTPAuthRepo _emailRepo;
//   const CommandEmailSignin({required IOTPAuthRepo emailRepo})
//       : _emailRepo = emailRepo;

//   Future<Either<Failure, bool>> verifyCredential(
//       {required String email}) async {
//     return await _emailRepo.verifyCredential(credential: email);
//   }

//   Future<Either<Failure, Unit>> verifyOtp(
//       {required String email, required String otp}) async {
//     return await _emailRepo.validateOTP(credential: email, otp: otp);
//   }
// }
