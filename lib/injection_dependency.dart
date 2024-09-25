import 'dart:typed_data';

import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/core/logs/logger.dart';
import 'package:uniceps/features/Auth/data/repo_impl/repo_impl.dart';
import 'package:uniceps/features/Auth/data/sources/local_source.dart';
import 'package:uniceps/features/Auth/data/sources/remote_source.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';
// import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Profile/data/repo/repo_impl.dart';
import 'package:uniceps/features/Profile/data/sources/local_source.dart';
import 'package:uniceps/features/Profile/data/sources/remote_source.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Training/data/repos_impl/repo_imple.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
// import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  final userBox = await Hive.openBox<Map<dynamic, dynamic>>("User");
  // final tokenBox = await Hive.openBox<String>("Token");
  // print("---------------U S E R   B O X------------------");
  // print("${userBox.keys.first.runtimeType}");
  // await userBox.put("userKey", {"1": 1});
  // print("${userBox.get("userKey")}");
  // print("---------------U S E R   B O X------------------");

  final profileBox = await Hive.openBox<Map<dynamic, dynamic>>("Profile");
  final trainBox = await Hive.openBox<Map<dynamic, dynamic>>("Training");
  final lastWeightBox = await Hive.openBox<double>("LastWeight");
  final gymsBox = await Hive.openBox<Map<dynamic, dynamic>>("Gyms");
  final subsBox = await Hive.openBox<List<dynamic>>("Subs");
  final measureBox = await Hive.openBox<Map<dynamic, dynamic>>("Metrics");
  final handshakesBox = await Hive.openBox<Map<dynamic, dynamic>>("HandShakes");
  final attendenceBox = await Hive.openBox<List<dynamic>>("Attendence");
  final imagesBox = await Hive.openBox<Uint8List>("Images");
  // final avatarBox = await Hive.openBox<List<Map<dynamic, dynamic>>>("Avatar");

  // await userBox.clear();
  // await profileBox.clear();
  // await trainBox.clear();
  // await imagesBox.clear();
  // await lastWeightBox.clear();
  // await gymsBox.clear();
  // await subsBox.clear();
  // await measureBox.clear();
  // await handshakesBox.clear();
  // await attendenceBox.clear();

  sl.registerLazySingleton(
    () => ImageCacheManager(
      imagesCache: imagesBox,
      checker: sl(),
      client: sl(),
    ),
  );

  ///////                             ///
  //////                             ////
  /////   D A T A   S O U R C E S   /////
  ////                             //////
  ///                             ///////

  sl.registerLazySingleton<LocalTrainingSource>(
    () => LocalTrainingSourceImpl(
      trainBox: trainBox,
      lastWBox: lastWeightBox,
      handshakesBox: handshakesBox,
      cacheManager: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteTrainingSource>(
    () => RemoteTrainingSourceImpl(
      client: sl(),
      cacheManager: sl(),
      userBox: userBox,
      playerBox: profileBox,
    ),
  );
  sl.registerLazySingleton<LocalProfileSource>(
    () => LocalProfileSourceImpl(
      gymsBox: gymsBox,
      measurBox: measureBox,
      playerBox: profileBox,
      subsBox: subsBox,
      handshakesBox: handshakesBox,
      attendBox: attendenceBox,
    ),
  );
  sl.registerLazySingleton<RemoteProfileSource>(
    () => RemoteProfileSourceImpl(
      client: sl(),
      userBox: userBox,
      playerBox: profileBox,
      handshakesBox: handshakesBox,
    ),
  );
  sl.registerLazySingleton<LocalAuthSource>(
    () => LocalAuthSourceImple(userBox: userBox, playerBox: profileBox),
  );
  sl.registerLazySingleton<RemoteAuthSource>(
    () => RemoteAuthSourceImpl(client: sl(), userBox: userBox),
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

  // sl.registerFactory<AuthBloc>(() => AuthBloc(usecases: sl()));
  // sl.registerFactory<GymsBloc>(() => GymsBloc(usecases: sl()));
  // sl.registerFactory<SubsBloc>(() => SubsBloc(usecases: sl()));
  // sl.registerFactory<ProfileBloc>(() => ProfileBloc(usecases: sl()));
  // sl.registerFactory<TrainingBloc>(() => TrainingBloc(usecases: sl()));
  // sl.registerFactory<MeasurmentBloc>(() => MeasurmentBloc(usecases: sl()));

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
