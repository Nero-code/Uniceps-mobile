import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/app/presentation/screens/auth/screens/auth_screen.dart';
import 'package:uniceps/app/presentation/blocs/authentication/auth_bloc.dart';
import 'package:uniceps/app/presentation/blocs/attendence/attendence_bloc.dart';
import 'package:uniceps/app/presentation/blocs/player_gym/player_gym_bloc.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/screens/about_screen.dart';
import 'package:uniceps/app/presentation/blocs/current_gym/current_gym_bloc.dart';
import 'package:uniceps/app/presentation/blocs/gyms/gyms_bloc.dart';
import 'package:uniceps/app/presentation/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_bloc.dart';
import 'package:uniceps/app/presentation/blocs/subscription/subs_bloc.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/screens/gym_list_screen.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/screens/profile_screen.dart';
import 'package:uniceps/app/presentation/screens/home/screens/home_screen.dart';
import 'package:uniceps/app/presentation/blocs/exercises/exercises_bloc.dart';
import 'package:uniceps/app/presentation/blocs/training/training_bloc.dart';
import 'package:uniceps/firebase_options.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/main_cubit/training_section_cubit.dart';
import 'package:uniceps/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/home/screens/temporary_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class NavigatorKey {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  debugPrint('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: false,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            debugPrint(
                "------------------AuthBloc Created!-----------------------");
            return AuthBloc(usecases: di.sl(), guestMode: di.sl())
              ..add(AuthCheckEvent());
          },
        ),
        BlocProvider<TrainingBloc>(
          create: (context) {
            debugPrint(
                "------------------TrainingBLoc Created!-------------------");
            return TrainingBloc(usecases: di.sl(), manager: di.sl())
              ..add(const GetProgramEvent());
          },
        ),
        BlocProvider<ExercisesBloc>(
          create: (context) {
            debugPrint(
                "------------------ExercisesBLoc Created!------------------");
            return ExercisesBloc(usecases: di.sl());
          },
        ),
        BlocProvider<ProfileBloc>(
          create: (context) {
            debugPrint(
                "------------------ProfileBloc Created!--------------------");
            return ProfileBloc(usecases: di.sl());
            // return di.sl()..add(event);
          },
        ),
        BlocProvider<SubsBloc>(
          create: (context) {
            debugPrint(
                "------------------SubsBloc Created!-----------------------");
            return SubsBloc(usecases: di.sl());
          },
        ),
        BlocProvider<MeasurmentBloc>(
          create: (context) {
            debugPrint(
                "------------------MeasurmentsBloc Created!----------------");
            return MeasurmentBloc(usecases: di.sl())
              ..add(GetMeasurementsEvent());
          },
        ),
        BlocProvider<GymsBloc>(
          create: (context) {
            debugPrint(
                "------------------GymsBloc Created!-----------------------");
            return GymsBloc(usecases: di.sl())
              ..add(const GetAllAvailableGymsEvent());
          },
        ),
        BlocProvider(
          create: (context) {
            debugPrint(
                "------------------Current GymsBloc Created!---------------");
            return CurrentGymBloc(usecases: di.sl())
              ..add(const GetSubscribedToGymEvent());
          },
        ),
        BlocProvider(
          create: (context) {
            debugPrint(
                "------------------Player-Gym Bloc Created!----------------");
            return PlayerGymBloc(usecases: di.sl());
          },
        ),
        BlocProvider<AttendenceBloc>(
          create: (context) {
            debugPrint(
                "------------------AttendenceBloc Created!-----------------");
            return AttendenceBloc(di.sl());
          },
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
        ),
        BlocProvider<TrainingSectionCubit>(
          create: (context) => TrainingSectionCubit()..getSection(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangedLangState>(
        builder: (context, state) {
          // SystemChrome.setSystemUIOverlayStyle(
          //   SystemUiOverlayStyle(
          //     statusBarColor: Colors.transparent,
          //     systemNavigationBarColor:
          //         Theme.of(context).colorScheme.background,
          //   ),
          // );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorKey.navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            restorationScopeId: "root",
            title: 'Uniceps',
            theme: lightTheme.copyWith(textTheme: GoogleFonts.cairoTextTheme()),
            // initialRoute: ROUTE_SPLASH,
            initialRoute: "/temp",
            routes: {
              "/temp": (context) => TemporaryScreen(),
              // ROUTE_SPLASH: (context) => const SplashScreen(),

              //  AUTH
              // ROUTE_AUTH: (context) => const AuthScreen(),
              // ROUTE_PROFILE: (context) => const ProfileScreen(),

              //  MAIN
              // ROUTE_HOME: (context) => HomeScreen(
              //       trainingUsecases: di.sl(),
              //       service: di.sl(),
              //       manager: di.sl(),
              //     ),

              // //  AUX
              // ROUTE_GYMS_LIST: (context) => const GymListScreen(),
              ROUTE_ABOUT: (context) => const AboutScreen(),
            },
          );
        },
      ),
    );
  }
}
