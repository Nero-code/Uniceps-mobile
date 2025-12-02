import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_sets_local_source.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/data/sources/remote/dal_account/account_remote_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/email_auth_remote_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/data/sources/services/import/file_parse_service.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/services/internet_client/http_client_helper.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/data/sources/services/sync/sync_contract.dart';
import 'package:uniceps/app/data/sources/services/sync/t_session_sync_service.dart';
import 'package:uniceps/app/data/sources/services/token/token_service_simple.dart';
import 'package:uniceps/app/data/stores/account/account_repo.dart';
import 'package:uniceps/app/data/stores/auth/email_auth_repo.dart';
import 'package:uniceps/app/data/stores/performance/performance_repo.dart';
import 'package:uniceps/app/data/stores/practice/practice_repo.dart';
import 'package:uniceps/app/data/stores/profile/measurements_repo.dart';
import 'package:uniceps/app/data/stores/profile/profile_repo.dart';
import 'package:uniceps/app/data/stores/routine/exercises_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_days_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_items_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_management_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_sets_repo.dart';
import 'package:uniceps/app/data/stores/routine/routine_with_heat_repo.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';
import 'package:uniceps/app/domain/commands/auth_usecases/otp_usecases.dart';
import 'package:uniceps/app/domain/commands/measurement_usecases/measurement_commands.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/app/domain/commands/profile_usecases/profile_usecases.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_days_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_items_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_sets_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_with_heat_commands.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/app/domain/contracts/auth/i_auth_contracts.dart';
import 'package:uniceps/app/domain/contracts/performance/i_performance_contract.dart';
import 'package:uniceps/app/domain/contracts/practice/i_practice_contract.dart';
import 'package:uniceps/app/domain/contracts/profile/i_measurement_service.dart';
import 'package:uniceps/app/domain/contracts/profile/i_profile_service.dart';
import 'package:uniceps/app/domain/contracts/routine/i_exercises_contract.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_days_contract.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_items_contract.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_sets_contract.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_management_contract.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_with_heat_contract.dart';
import 'package:uniceps/app/services/captian_quotes_service.dart';
import 'package:uniceps/app/services/update_service.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   D A T A B A S E S
  ///
  //////////////////////////////////////////////////////////////////////////////

  final prefs = await SharedPreferences.getInstance();
  final appDataBase = AppDatabase();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<AppDatabase>(() => appDataBase);
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  ///  V2   R E Q U I R E D
  final imagesCache = await Hive.openBox<Uint8List>("ExerciseImages");

  sl.registerLazySingleton<MediaHelper>(
      () => ImageMediaHelper(imagesCache: imagesCache, checker: sl(), client: sl(), logger: sl()));

  /////////
  ////////
  ///////
  //////      L O C A L   S O U R C E S
  /////
  ////
  ///
  //

  sl.registerLazySingleton<IProfileLocalSource>(() => ProfileLocalSource(prefs: prefs, logger: sl()));

  sl.registerLazySingleton<ITSessionLocalSourceContract>(
      () => TSessionLocalSource(database: sl(), imagesCache: imagesCache, logger: sl()));

  //  R O U T I N E   S O U R C E S
  sl.registerLazySingleton<IRoutineManagementLocalSourceContract>(
      () => RoutineManagementLocalSourceImpl(database: sl(), logger: sl()));
  sl.registerLazySingleton<IRoutineDaysLocalSourceContract>(() => RoutineDaysLocalSourceImpl(dataBase: sl()));
  sl.registerLazySingleton<IRoutineItemsLocalSourceContract>(
      () => RoutineItemsLocalSourceImpl(database: sl(), imagesCache: imagesCache));
  sl.registerLazySingleton<IRoutineSetsLocalSourceContract>(() => RoutineSetsLocalSourceImpl(database: sl()));
  // sl.registerLazySingleton<IExercisesLocalSourceContract>(() => ExercisesLocalSource(database: sl()));

  //  A U T H   S O U R C E S
  sl.registerLazySingleton<IOTPAuthSource>(() => OTPAuthSource(client: sl(), logger: sl()));
  sl.registerLazySingleton<IAccountLocalSource>(() => AccountLocalSource(secureStorage: sl(), database: sl()));

  //  M E A S U R E M E N T S   S O U R C E S
  sl.registerLazySingleton<IMeasurementsLocalSource>(() => MeasurementsLocalSource(database: sl(), logger: sl()));

  /////////
  ////////
  ///////
  //////      R E M O T E   S O U R C E S
  /////
  ////
  ///
  //

  sl.registerLazySingleton<IAccountRemoteSource>(() => AccountRemoteSource(clientHelper: sl()));

  sl.registerLazySingleton<IExercisesRemoteSourceContract>(() => ExercisesRemoteSourceImpl(clientHelper: sl()));

  /////////
  ////////
  ///////
  //////      R E P O S I T O R I E S  -  V 2
  /////
  ////
  ///
  //

  sl.registerLazySingleton<IProfileService>(() => ProfileRepo(localSource: sl(), logger: sl()));

  sl.registerLazySingleton<IPracticeContract>(() => PracticeRepo(localSource: sl()));
  sl.registerLazySingleton<IRoutineManagementContract>(
      () => RoutineManagementRepo(localSource: sl(), internet: sl(), clientHelper: sl()));
  sl.registerLazySingleton<IRoutineWithHeatContract>(
      () => RoutineWithHeatRepo(localSource: sl(), mediaHelper: sl(), fileParseService: sl(), logger: sl()));
  sl.registerLazySingleton<IRoutineDaysContract>(() => RoutineDaysRepo(localSource: sl(), logger: sl()));
  sl.registerLazySingleton<IRoutineItemsContract>(() => RoutineItemsRepo(localSource: sl(), mediaHelper: sl()));
  sl.registerLazySingleton<IRoutineSetsContract>(() => RoutineSetsRepo(localSource: sl(), logger: sl()));
  sl.registerLazySingleton<IExercisesContract>(() => ExercisesRepo(internet: sl(), remoteSource: sl()));

  //  A U T H   R E P O
  sl.registerLazySingleton<IOTPAuthRepo>(() => EmailAuthRepo(
        otpAuthSource: sl(),
        tokenService: sl(),
        accountLocalSource: sl(),
        connection: sl(),
        logger: sl(),
      ));
  sl.registerLazySingleton<IAccountService>(() => AccountRepo(
        localSource: sl(),
        remoteSource: sl(),
        checker: sl(),
        logger: sl(),
      ));

  //  M E A S U R E M E N T S   R E P O
  sl.registerLazySingleton<IMeasurementContract>(() => MeasurementsRepo(
        localSource: sl(),
        logger: sl(),
      ));
  sl.registerLazySingleton<IPerformanceContract>(() => PerformanceRepo(
        profileLocalSource: sl(),
        routineLocalSource: sl(),
        tSessionsLocalSource: sl(),
        measurementsLocalSource: sl(),
      ));

  /////////
  ////////
  ///////
  //////      U S E C A S E S  -  V 2
  /////
  ////
  ///
  //
  sl.registerFactory(() => ProfileUsecases(repo: sl()));

  sl.registerFactory(() => AccountUsecases(repo: sl()));
  sl.registerFactory(() => PracticeCommands(repo: sl()));
  sl.registerFactory(() => RoutineManagementCommands(repo: sl()));
  sl.registerFactory(() => RoutineWithHeatCommands(repo: sl()));
  sl.registerFactory(() => RoutineDaysCommands(repo: sl()));
  sl.registerFactory(() => RoutineItemsCommands(repo: sl()));
  sl.registerFactory(() => RoutineSetsCommands(repo: sl()));
  sl.registerFactory(() => ExercisesCommands(repo: sl()));
  sl.registerFactory(() => OtpUsecases(repo: sl()));
  sl.registerFactory(() => MeasurementCommands(repo: sl()));

  sl.registerFactory(() => PerformanceCommands(repo: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   O T H E R
  ///
  //////////////////////////////////////////////////////////////////////////////

  final client = http.Client();
  // final c = io.HttpClient()..connectionTimeout = const Duration(seconds: 30);
  sl.registerLazySingleton(() => client);
  // sl.registerLazySingleton<ClientHelper>(
  //     () => NoTokenHttpClientHelper(client: sl()));
  sl.registerLazySingleton<ClientHelper>(() => HttpClientHelper(client: sl(), tokenService: sl()));

  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => SimpleTokenService());

  sl.registerLazySingleton<Logger>(
    () => Logger(
      level: kReleaseMode ? Level.error : Level.all,
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

  sl.registerLazySingleton(() => UniFileManager());

  sl.registerLazySingleton<UpdateService>(() => UpdateService(connectionChecker: sl(), client: sl()));

  sl.registerLazySingleton<TSessionSyncContract>(
      () => TSessionSyncService(database: sl(), client: sl(), connectionChecker: sl(), logger: sl()),
      dispose: (param) => param.dispose());

  sl.registerLazySingleton(() => CaptianQuotesService(prefs: sl()));

  // final notificationService =  NotificationService();
  // notificationService.ini
}
