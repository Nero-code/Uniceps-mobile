import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/exercise_lib_cubit.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/lib_sync_cubit.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/media_downloader_cubit.dart';
import 'package:uniceps/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = sl<Logger>();
    final l10n = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExerciseLibCubit(sl())..checkExercises()),
        BlocProvider(create: (context) => ProfileCubit(sl())),
        BlocProvider(create: (context) => MediaDownloaderCubit(sl())),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ExerciseLibCubit, ExerciseLibState>(
            listener: (context, state) {
              state.maybeWhen(
                statusGood: () {
                  logger.i('ExerciseLibCubit: statusGood');
                  context.read<LibSyncCubit>().syncLibrary();
                  context.read<ProfileCubit>().getProfile();
                },
                needsUpdate: () {
                  logger.i('ExerciseLibCubit: needsUpdate');
                  context.read<MediaDownloaderCubit>().startLibDownload();
                },
                orElse: () => logger.i('ExerciseLibCubit: orElse'),
              );
            },
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) => state.when(
              initial: () => logger.i('ProfileCubit: initial'),
              notFound: () {
                logger.i('ProfileCubit: notFound');
                return Navigator.pushReplacementNamed(context, AppRoutes.profileInitial);
              },
              found: () {
                logger.i('ProfileCubit: found');
                return Navigator.pushReplacementNamed(context, AppRoutes.home);
              },
            ),
          ),
        ],
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Image(
                    image: const AssetImage('images/logo/Logo.png'),
                    height: MediaQuery.sizeOf(context).width * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  width: MediaQuery.sizeOf(context).width,
                  child: BlocBuilder<MediaDownloaderCubit, MediaDownloaderState>(
                    builder: (context, state) {
                      if (state.status == .success) {
                        context.read<ExerciseLibCubit>().checkExercises();
                      }
                      return Column(
                        mainAxisSize: .min,
                        children: [
                          Text(
                            state.status == .downloading
                                ? '${(state.progress * 100).toInt()}%'
                                : state.status == .success
                                ? '100%'
                                : '',
                            style: TextStyle(fontSize: 12, fontWeight: .bold),
                          ),
                          LinearProgressIndicator(
                            value: state.status == .initial ? null : state.progress,
                            minHeight: 5,

                            borderRadius: .circular(15),
                            backgroundColor: Colors.grey.shade100,
                          ),
                          if (state.status == .failure)
                            Row(
                              mainAxisAlignment: .center,
                              spacing: 5,
                              children: [
                                Icon(Icons.wifi_off, size: 20, color: Colors.grey.shade700),
                                Text(l10n.errNoInternet, style: TextStyle(fontSize: 12)),
                                IconButton(
                                  onPressed: () => context.read<MediaDownloaderCubit>().startLibDownload(),
                                  icon: Icon(Icons.refresh),
                                  iconSize: 20,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ABS-CORE-BODYWEIGHT-BODY-EX004
