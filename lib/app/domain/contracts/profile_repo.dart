// import 'package:dartz/dartz.dart';
// import 'package:uniceps/core/errors/failure.dart';
// import 'package:uniceps/app/data/models/auth_models/player_model.dart';
// import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
// // import 'package:uniceps/app/domain/models/profile_models/gym_model.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';

// abstract class ProfileRepo {
//   Future<Either<Failure, Player>> getProfileData();
//   Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
//       {required bool isCreate});
//   Future<Either<Failure, List<Gym>>> getGyms();
//   // Future<void> saveGyms(List<GymModel> list);
//   Future<Either<Failure, List<Measurement>>> getMeasurement();
//   Future<Either<Failure, List<Subscription>>> getSubscriptions(
//       String gymId, String pid);
//   Future<Either<Failure, List<Attendence>>> gymAttendence(
//       String gymId, String pid);
//   Future<Either<Failure, PlayerInGym>> getPlayerInGym(String gymId, String pid);
// }
