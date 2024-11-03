import 'dart:typed_data';

import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/app/Auth/data/repo_impl/repo_impl.dart';
import 'package:uniceps/app/Auth/data/sources/local_source.dart';
import 'package:uniceps/app/Auth/data/sources/remote_source.dart';
import 'package:uniceps/app/Auth/services/repo/repo.dart';
import 'package:uniceps/app/Auth/services/usecases/usecases.dart';
import 'package:uniceps/app/Profile/data/repo/repo_impl.dart';
import 'package:uniceps/app/Profile/data/sources/local_source.dart';
import 'package:uniceps/app/Profile/data/sources/remote_source.dart';
import 'package:uniceps/app/Profile/domain/repo.dart';
import 'package:uniceps/app/Profile/domain/commands/usecases.dart';
import 'package:uniceps/app/Training/data/repos_impl/repo_imple.dart';
import 'package:uniceps/app/Training/data/sources/local_data_source.dart';
import 'package:uniceps/app/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/app/Training/services/repos/repository.dart';
import 'package:uniceps/app/Training/services/commands/usecases.dart';
import 'package:uniceps/core/helpers/update_service.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  final userBox = await Hive.openBox<Map<dynamic, dynamic>>("User");
  final profileBox = await Hive.openBox<Map<dynamic, dynamic>>("Profile");
  final trainBox = await Hive.openBox<Map<dynamic, dynamic>>("Training");
  final lastWeightBox = await Hive.openBox<double>("LastWeight");
  final gymsBox = await Hive.openBox<Map<dynamic, dynamic>>("Gyms");
  final myGyms = await Hive.openBox<Map<dynamic, dynamic>>("MyGyms");
  final subsBox = await Hive.openBox<List<dynamic>>("Subs");
  final measureBox = await Hive.openBox<Map<dynamic, dynamic>>("Metrics");
  final handshakesBox = await Hive.openBox<Map<dynamic, dynamic>>("HandShakes");
  final attendenceBox = await Hive.openBox<List<dynamic>>("Attendence");
  final imagesBox = await Hive.openBox<Uint8List>("Images");
  final selectedGym = await Hive.openBox<bool>("SelectedGym");
  final playerInGymBox =
      await Hive.openBox<Map<dynamic, dynamic>>("PlayerInGym");

  // await userBox.clear();
  // await profileBox.clear();
  // await trainBox.clear();
  // await lastWeightBox.clear();
  // await gymsBox.clear();
  // await myGyms.clear();
  // await subsBox.clear();
  // await measureBox.clear();
  // await handshakesBox.clear();
  // await attendenceBox.clear();
  // // await imagesBox.clear();
  // await selectedGym.clear();
  // await playerInGymBox.clear();

  Future<void> clear() async {
    await userBox.clear();
    await profileBox.clear();
    await trainBox.clear();
    await lastWeightBox.clear();
    await gymsBox.clear();
    await myGyms.clear();
    await subsBox.clear();
    await measureBox.clear();
    await handshakesBox.clear();
    await attendenceBox.clear();
    await imagesBox.clear();
    await selectedGym.clear();
    await playerInGymBox.clear();
  }

  sl.registerLazySingleton<ImageCacheManager>(
    () => ImageCacheManager(
      imagesCache: imagesBox,
      checker: sl(),
      client: sl(),
      logger: sl(),
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
      myGyms: myGyms,
      cacheManager: sl(),
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteTrainingSource>(
    () => RemoteTrainingSourceImpl(
      client: sl(),
      cacheManager: sl(),
      userBox: userBox,
      playerBox: profileBox,
      trainBox: trainBox,
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<LocalProfileSource>(
    () => LocalProfileSourceImpl(
      gymsBox: gymsBox,
      myGyms: myGyms,
      playerProfilesBox: playerInGymBox,
      selectedGym: selectedGym,
      measurBox: measureBox,
      playerBox: profileBox,
      subsBox: subsBox,
      handshakesBox: handshakesBox,
      attendBox: attendenceBox,
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteProfileSource>(
    () => RemoteProfileSourceImpl(
      client: sl(),
      userBox: userBox,
      playerBox: profileBox,
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<LocalAuthSource>(
    () => LocalAuthSourceImple(
      userBox: userBox,
      playerBox: profileBox,
      resetBottun: clear,
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteAuthSource>(
    () => RemoteAuthSourceImpl(
      client: sl(),
      userBox: userBox,
      logger: sl(),
    ),
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
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<TrainingRepo>(
    () => TrainingRepoImple(
      local: sl(),
      remote: sl(),
      connection: sl(),
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      local: sl(),
      remote: sl(),
      checker: sl(),
      logger: sl(),
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
  // final c = io.HttpClient()..connectionTimeout = const Duration(seconds: 30);
  sl.registerLazySingleton<http.Client>(() => client);

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<Logger>(
    () => Logger(
      level: Level.all,
      printer: PrettyPrinter(
        dateTimeFormat: DateTimeFormat.dateAndTime,
        // printEmojis: false,
        // noBoxingByDefault: true,
        colors: true,
        levelColors: {
          // https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
          Level.trace: const AnsiColor.fg(120),
          Level.debug: const AnsiColor.fg(51),
          // Level.error: AnsiColor.fg(126),
          Level.fatal: const AnsiColor.fg(196),
          Level.info: const AnsiColor.fg(214),
          // Level.warning: AnsiColor.fg(90),
        },
      ),
    ),
  );

  sl.registerLazySingleton<UpdateService>(
    () => UpdateService(
      connectionChecker: sl(),
      client: sl(),
    ),
  );
}
