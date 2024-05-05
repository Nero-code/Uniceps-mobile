import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/logs/logger.dart';
import 'package:uniceps/features/Auth/data/repo_impl/repo_impl.dart';
import 'package:uniceps/features/Auth/data/sources/local_source.dart';
import 'package:uniceps/features/Auth/data/sources/remote_source.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Profile/data/repo_impl.dart';
import 'package:uniceps/features/Profile/data/sources.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';
import 'package:uniceps/features/Training/data/repos_impl/repo_imple.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  final userBox = await Hive.openBox<Map<String, dynamic>>("User");
  final profileBox = await Hive.openBox<Map<String, dynamic>>("Profile");
  final trainBox = await Hive.openBox<Map<String, dynamic>>("Training");

  ///////                             ///
  //////                             ////
  /////   D A T A   S O U R C E S   /////
  ////                             //////
  ///                             ///////

  sl.registerLazySingleton<LocalTrainingSource>(
    () => LocalTrainingSourceImpl(trainBox: trainBox),
  );
  sl.registerLazySingleton<RemoteTrainingSource>(
    () => RemoteTrainingSourceImpl(sl()),
  );
  sl.registerLazySingleton<LocalProfileSource>(
    () => LocalProfileSource(box: profileBox),
  );
  sl.registerLazySingleton<RemoteProfileSource>(
    () => RemoteProfileSource(client: sl()),
  );
  sl.registerLazySingleton<LocalAuthSourceImple>(
    () => LocalAuthSourceImple(userBox: userBox),
  );
  sl.registerLazySingleton<RemoteAuthSourceImpl>(
    () => RemoteAuthSourceImpl(sl()),
  );

  ///
  ///
  ///   R E P O S I T O R I E S
  ///
  ///

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      local: sl(),
      remote: sl(),
      connection: sl(),
    ),
  );
  sl.registerLazySingleton<TrainingRepo>(
    () => TrainingRepoImple(
      local: sl(),
      remote: sl(),
      connection: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      local: sl(),
      remote: sl(),
      checker: sl(),
    ),
  );

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   U S E C A S E S
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<TrainingUsecases>(
    () => TrainingUsecases(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileUsecases>(
    () => ProfileUsecases(
      repo: sl(),
    ),
  );

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   B L O C S
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerFactory<AuthBloc>(() => AuthBloc(usecases: sl()));
  sl.registerFactory<TrainingBloc>(() => TrainingBloc(usecases: sl()));
  // sl.registerFactory<ProfileBloc>(()=> ProfileBloc(usecases: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   O T H E R
  ///
  //////////////////////////////////////////////////////////////////////////////

  final client = http.Client();
  sl.registerLazySingleton<http.Client>(() => client);

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<Logger>(() => Logger());
}
