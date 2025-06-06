import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/local/dal_auth/account_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_gyms/attendence_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_gyms/gyms_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_gyms/my_gyms_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_gyms/subscriptions_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_sets_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_training/training_local_source.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/data/sources/services/no_token_http_client.dart';
import 'package:uniceps/app/data/stores/practice/practice_repo.dart';
import 'package:uniceps/app/data/stores/routine/exercises_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_days_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_items_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_management_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_sets_repo.dart';
import 'package:uniceps/app/domain/commands/auth_usecases/guest_mode_login.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_days_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_items_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_sets_commands.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_exercises_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_days_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_items_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_sets_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_management_contract.dart';
import 'package:uniceps/app/services/image_cache_manager.dart';
import 'package:uniceps/app/data/auth_repo_impl.dart';
import 'package:uniceps/app/data/sources/local/auth_local_source.dart';
import 'package:uniceps/app/data/sources/remote/auth_remote_source.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';
import 'package:uniceps/app/domain/commands/auth_usecases/auth_usecases.dart';
import 'package:uniceps/app/data/profile_repo_impl.dart';
import 'package:uniceps/app/data/sources/local/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/profile_remote_source.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/commands/profile_usecases/profile_usecases.dart';
import 'package:uniceps/app/data/training_repo_imple.dart';
import 'package:uniceps/app/data/sources/local/training_local_data_source.dart';
import 'package:uniceps/app/data/sources/remote/training_remote_data_source.dart';
import 'package:uniceps/app/domain/contracts/training_repository.dart';
import 'package:uniceps/app/domain/commands/training_usecases/training_usecases.dart';
import 'package:uniceps/app/services/update_service.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  //////////////////////////////////////////////////////////////////////////////
  ///   D A T A B A S E S
  //////////////////////////////////////////////////////////////////////////////

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

  ///  V2   R E Q U I R E D
  final imagesCache = await Hive.openBox<Uint8List>("ExerciseImages");

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

  final appDataBase = AppDatabase();

  sl.registerLazySingleton<AppDatabase>(() => appDataBase);

  sl.registerLazySingleton<ImageCacheManager>(
    () => ImageCacheManager(
      imagesCache: imagesBox,
      checker: sl(),
      client: sl(),
      logger: sl(),
    ),
  );

  /////////
  ////////
  ///////
  //////      A U T H   S O U R C E S
  /////
  ////
  ///
  //

  sl.registerLazySingleton<AccountLocalSourceImpl>(() => AccountLocalSourceImpl(
        userBox: userBox,
        // playerBox: profileBox,
        resetBottun: clear,
        logger: sl(),
        firebaseMessaging: FirebaseMessaging.instance,
      ));

  sl.registerLazySingleton<IAttendenceLocalSource>(
      () => AttendenceLocalService(attendBox: attendenceBox));

  sl.registerLazySingleton<IGymsLocalSource>(
      () => GymsDBService(gymsBox: gymsBox));

  sl.registerLazySingleton<IMyGymsLocalSource>(() => MyGymsDBService(
      myGyms: myGyms, playerProfilesBox: profileBox, logger: sl()));

  sl.registerLazySingleton<ISubscriptionsLocalSource>(
      () => SubscriptionsDBService(subsBox: subsBox, logger: sl()));

  sl.registerLazySingleton<IMeasurementsLocalSource>(
      () => MeasurementsDBService(measureBox: measureBox, logger: sl()));

  sl.registerLazySingleton<ITrainingLocalSource>(() => TrainingDBService(
      trainBox: trainBox,
      lastWBox: lastWeightBox,
      cacheManager: sl(),
      logger: sl()));

  /////////
  ////////
  ///////
  //////      R O U T I N E   S O U R C E S
  /////
  ////
  ///
  //

  //////////////////////////////////////////////////////////////////////////////
  ///   L O C A L   S O U R C E S
  //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<ITSessionLocalSourceContract>(
      () => TSessionLocalSource(database: sl(), imagesCache: imagesCache));

  sl.registerLazySingleton<IRoutineManagementLocalSourceContract>(
      () => RoutineManagementLocalSourceImpl(database: sl()));

  sl.registerLazySingleton<IRoutineDaysLocalSourceContract>(
      () => RoutineDaysLocalSourceImpl(dataBase: sl()));

  sl.registerLazySingleton<IRoutineItemsLocalSourceContract>(
      () => RoutineItemsLocalSourceImpl(
            database: sl(),
            imagesCache: imagesCache,
          ));

  sl.registerLazySingleton<IRoutineSetsLocalSourceContract>(
      () => RoutineSetsLocalSourceImpl(database: sl()));

  sl.registerLazySingleton<IExercisesLocalSourceContract>(
      () => ExercisesLocalSource(database: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///   R E M O T E   S O U R C E S
  //////////////////////////////////////////////////////////////////////////////

  // sl.registerLazySingleton<IRoutineManagementRemoteSourceContract>(
  //     () => RoutineManagementRemoteSourceImpl());

  ///
  ///
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
      measureBox: measureBox,
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

  sl.registerLazySingleton<IExercisesRemoteSourceContract>(
      () => ExercisesRemoteSourceImpl(clientHelper: sl()));

  /////////
  ////////
  ///////
  //////      R E P O S I T O R I E S  -  V 2
  /////
  ////
  ///
  //

  sl.registerLazySingleton<IPracticeContract>(
      () => PracticeRepo(localSource: sl()));

  sl.registerLazySingleton<IRoutineManagementContract>(
      () => RoutineManagementRepo(
            localSource: sl(),
            // remoteSource: sl(),
            internet: sl(),
            clientHelper: sl(),
          ));

  sl.registerLazySingleton<IRoutineDaysContract>(
      () => RoutineDaysRepo(localSource: sl()));
  sl.registerLazySingleton<IRoutineItemsContract>(
      () => RoutineItemsRepo(localSource: sl(), mediaHelper: sl()));
  sl.registerLazySingleton<IRoutineSetsContract>(
      () => RoutineSetsRepo(localSource: sl()));

  sl.registerLazySingleton<IExercisesContract>(() =>
      ExercisesRepo(internet: sl(), remoteSource: sl(), localSource: sl()));

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
  ///   U S E C A S E S  -  V 2
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<PracticeCommands>(
      () => PracticeCommands(repo: sl()));

  sl.registerLazySingleton<RoutineManagementCommands>(
      () => RoutineManagementCommands(repo: sl()));

  sl.registerLazySingleton<RoutineDaysCommands>(
      () => RoutineDaysCommands(repo: sl()));
  sl.registerLazySingleton<RoutineItemsCommands>(
      () => RoutineItemsCommands(repo: sl()));
  sl.registerLazySingleton<RoutineSetsCommands>(
      () => RoutineSetsCommands(repo: sl()));

  sl.registerLazySingleton<ExercisesCommands>(
      () => ExercisesCommands(repo: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   U S E C A S E S
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(repo: sl()),
  );
  sl.registerLazySingleton<TrainingUsecases>(
    () => TrainingUsecases(repo: sl()),
  );
  sl.registerLazySingleton<ProfileUsecases>(
    () => ProfileUsecases(repo: sl()),
  );

  sl.registerLazySingleton<GuestModeUsecase>(
    () => GuestModeUsecase(authRepo: sl()),
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
  sl.registerLazySingleton(() => client);

  sl.registerLazySingleton<ClientHelper>(
      () => NoTokenHttpClientHelper(client: sl()));

  sl.registerLazySingleton<MediaHelper>(() => ImageMediaHelper(
      imagesCache: imagesCache, checker: sl(), client: client));
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
