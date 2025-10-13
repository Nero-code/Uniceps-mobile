import 'dart:typed_data';

import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_sets_local_source.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/email_auth.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/data/sources/services/no_token_http_client.dart';
import 'package:uniceps/app/data/stores/auth/email_auth_repo.dart';
import 'package:uniceps/app/data/stores/practice/practice_repo.dart';
import 'package:uniceps/app/data/stores/routine/exercises_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_days_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_items_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_management_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_sets_repo.dart';
import 'package:uniceps/app/domain/commands/auth_usecases/otp_usecases.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_days_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_items_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_sets_commands.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_exercises_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_days_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_items_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_sets_contract.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_management_contract.dart';
import 'package:uniceps/app/services/update_service.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  final client = http.Client();
  // final c = io.HttpClient()..connectionTimeout = const Duration(seconds: 30);
  sl.registerLazySingleton(() => client);
  sl.registerLazySingleton<ClientHelper>(
      () => NoTokenHttpClientHelper(client: sl()));
  // sl.registerLazySingleton<ClientHelper>(
  //     () => HttpClientHelper(client: sl(), tokenService: sl()));

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  //////////////////////////////////////////////////////////////////////////////
  ///   D A T A B A S E S
  //////////////////////////////////////////////////////////////////////////////

  final prefs = await SharedPreferences.getInstance();
  final appDataBase = AppDatabase();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<AppDatabase>(() => appDataBase);

  ///  V2   R E Q U I R E D
  final imagesCache = await Hive.openBox<Uint8List>("ExerciseImages");

  sl.registerLazySingleton<MediaHelper>(() =>
      ImageMediaHelper(imagesCache: imagesCache, checker: sl(), client: sl()));

  // D E P R I C A T E D
  // final userBox = await Hive.openBox<Map<dynamic, dynamic>>("User");
  // final profileBox = await Hive.openBox<Map<dynamic, dynamic>>("Profile");
  // final trainBox = await Hive.openBox<Map<dynamic, dynamic>>("Training");
  // final lastWeightBox = await Hive.openBox<double>("LastWeight");
  // final gymsBox = await Hive.openBox<Map<dynamic, dynamic>>("Gyms");
  // final myGyms = await Hive.openBox<Map<dynamic, dynamic>>("MyGyms");
  // final subsBox = await Hive.openBox<List<dynamic>>("Subs");
  // final measureBox = await Hive.openBox<Map<dynamic, dynamic>>("Metrics");
  // final handshakesBox = await Hive.openBox<Map<dynamic, dynamic>>("HandShakes");
  // final attendenceBox = await Hive.openBox<List<dynamic>>("Attendence");
  // final imagesBox = await Hive.openBox<Uint8List>("Images");
  // final selectedGym = await Hive.openBox<bool>("SelectedGym");
  // final playerInGymBox =
  //     await Hive.openBox<Map<dynamic, dynamic>>("PlayerInGym");
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
  // Future<void> clear() async {
  //   await userBox.clear();
  //   await profileBox.clear();
  //   await trainBox.clear();
  //   await lastWeightBox.clear();
  //   await gymsBox.clear();
  //   await myGyms.clear();
  //   await subsBox.clear();
  //   await measureBox.clear();
  //   await handshakesBox.clear();
  //   await attendenceBox.clear();
  //   await imagesBox.clear();
  //   await selectedGym.clear();
  //   await playerInGymBox.clear();
  // }
  // sl.registerLazySingleton<ImageCacheManager>(
  //   () => ImageCacheManager(
  //     imagesCache: imagesBox,
  //     checker: sl(),
  //     client: sl(),
  //     logger: sl(),
  //   ),
  // );

  /////////
  ////////
  ///////
  //////      R O U T I N E   S O U R C E S
  /////
  ////
  ///
  //

  sl.registerLazySingleton<ITSessionLocalSourceContract>(
      () => TSessionLocalSource(database: sl(), imagesCache: imagesCache));

  sl.registerLazySingleton<IRoutineManagementLocalSourceContract>(
      () => RoutineManagementLocalSourceImpl(database: sl()));

  sl.registerLazySingleton<IRoutineDaysLocalSourceContract>(
      () => RoutineDaysLocalSourceImpl(dataBase: sl()));

  sl.registerLazySingleton<IRoutineItemsLocalSourceContract>(() =>
      RoutineItemsLocalSourceImpl(database: sl(), imagesCache: imagesCache));

  sl.registerLazySingleton<IRoutineSetsLocalSourceContract>(
      () => RoutineSetsLocalSourceImpl(database: sl()));

  sl.registerLazySingleton<IExercisesLocalSourceContract>(
      () => ExercisesLocalSource(database: sl()));

  sl.registerLazySingleton<IOTPAuthSource>(
      () => OTPAuthSource(client: sl(), logger: sl()));

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
  sl.registerLazySingleton<IRoutineManagementContract>(() =>
      RoutineManagementRepo(
          localSource: sl(), internet: sl(), clientHelper: sl()));
  sl.registerLazySingleton<IRoutineDaysContract>(
      () => RoutineDaysRepo(localSource: sl()));
  sl.registerLazySingleton<IRoutineItemsContract>(
      () => RoutineItemsRepo(localSource: sl(), mediaHelper: sl()));
  sl.registerLazySingleton<IRoutineSetsContract>(
      () => RoutineSetsRepo(localSource: sl()));
  sl.registerLazySingleton<IExercisesContract>(() =>
      ExercisesRepo(internet: sl(), remoteSource: sl(), localSource: sl()));
  sl.registerLazySingleton<IOTPAuthRepo>(() => EmailAuthRepo(
      otpAuthSource: sl(),
      tokenService: sl(),
      accountLocalSource: sl(),
      connection: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   U S E C A S E S  -  V 2
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerFactory(() => PracticeCommands(repo: sl()));
  sl.registerFactory(() => RoutineManagementCommands(repo: sl()));
  sl.registerFactory(() => RoutineDaysCommands(repo: sl()));
  sl.registerFactory(() => RoutineItemsCommands(repo: sl()));
  sl.registerFactory(() => RoutineSetsCommands(repo: sl()));
  sl.registerFactory(() => ExercisesCommands(repo: sl()));
  sl.registerFactory(() => OtpUsecases(repo: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   O T H E R
  ///
  //////////////////////////////////////////////////////////////////////////////

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
