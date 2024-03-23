import 'package:get_it/get_it.dart' as di;
import 'package:uniceps/features/Auth/data/repo_impl/repo_impl.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Training/data/repos_impl/repo_imple.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';

final sl = di.GetIt.instance;

Future<void> init() async {
  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   D A T A - B A S E
  ///
  //////////////////////////////////////////////////////////////////////////////

  // await sl.registerLazySingleton(() => Hive)

  ///////
  //////
  /////   D A T A   S O U R C E S
  ////
  ///

  sl.registerLazySingleton<LocalDataSource>(() => LocalSourceImpl());
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteSourceImpl());

  ///
  ///
  ///   R E P O S I T O R I E S
  ///
  ///

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      local: sl(),
      reomte: sl(),
    ),
  );
  sl.registerLazySingleton<TrainingRepo>(
    () => TrainingRepoImple(local: sl(), remote: sl()),
  );

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   U S E C A S E S
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<AuthUsecases>(() => AuthUsecases(repo: sl()));
  sl.registerLazySingleton<TrainingUsecases>(
      () => TrainingUsecases(repo: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   B L O C S
  ///
  //////////////////////////////////////////////////////////////////////////////

  sl.registerFactory<AuthBloc>(() => AuthBloc(usecases: sl()));
  sl.registerFactory<TrainingBloc>(() => TrainingBloc(usecases: sl()));

  //////////////////////////////////////////////////////////////////////////////
  ///
  ///   O T H E R
  ///
  //////////////////////////////////////////////////////////////////////////////
}
