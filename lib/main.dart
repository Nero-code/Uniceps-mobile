import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/auth_screen_2.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/player_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/about_2.dart';
import 'package:uniceps/features/Training/views/bloc/current_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
// import 'package:uniceps/features/Profile/presentation/screens/about.dart';
import 'package:uniceps/features/Profile/presentation/screens/gym_list_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/measurement_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/profile_screen.dart';
// import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
// import 'package:uniceps/features/Training/views/Screens/gym_handshake_screen.dart';
import 'package:uniceps/features/Training/views/Screens/home_screen.dart';
// import 'package:uniceps/features/Training/views/Screens/qr_scanner_screen.dart';
// import 'package:uniceps/features/Profile/presentation/screens/subs_screen.dart';
import 'package:uniceps/features/Training/views/bloc/exercises_bloc.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/firebase_options.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/main_cubit/training_section_cubit.dart';
import 'package:uniceps/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

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

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (event) {
      if (NavigatorKey.navigatorKey.currentState != null &&
          NavigatorKey.navigatorKey.currentState!.mounted) {
        ScaffoldMessenger.of(NavigatorKey.navigatorKey.currentState!.context);
      }
    },
  );

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: false,
  );

  // print(await FirebaseMessaging.instance.getToken());

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
            print("------------------AuthBloc Created!-----------------------");
            return AuthBloc(usecases: di.sl())..add(AuthCheckEvent());
          },
        ),
        BlocProvider<TrainingBloc>(
          create: (context) {
            print("------------------TrainingBLoc Created!-------------------");
            return TrainingBloc(usecases: di.sl())
              ..add(const GetProgramEvent());
          },
        ),
        BlocProvider<ExercisesBloc>(
          create: (context) {
            print("------------------ExercisesBLoc Created!------------------");
            return ExercisesBloc(usecases: di.sl());
          },
        ),
        BlocProvider<ProfileBloc>(
          create: (context) {
            print("------------------ProfileBloc Created!--------------------");
            return ProfileBloc(usecases: di.sl());
          },
        ),
        BlocProvider<SubsBloc>(
          create: (context) {
            print("------------------SubsBloc Created!-----------------------");
            return SubsBloc(usecases: di.sl());
          },
        ),
        BlocProvider<HandshakeBloc>(
          create: (context) {
            print("------------------HandshakesBloc Created!-----------------");
            return HandshakeBloc(usecases: di.sl())
              ..add(GetAllHandShakeEvent());
          },
        ),
        BlocProvider<MeasurmentBloc>(
          create: (context) {
            print("------------------MeasurmentsBloc Created!----------------");
            return MeasurmentBloc(usecases: di.sl())
              ..add(GetMeasurementsEvent());
          },
        ),
        BlocProvider<GymsBloc>(
          create: (context) {
            print("------------------GymsBloc Created!-----------------------");
            return GymsBloc(usecases: di.sl())
              ..add(const GetAllAvailableGymsEvent());
          },
        ),
        BlocProvider(
          create: (context) {
            print("------------------Current GymsBloc Created!---------------");
            return CurrentGymBloc(usecases: di.sl())
              ..add(const GetSubscribedToGymEvent());
          },
        ),
        BlocProvider(
          create: (context) {
            print("------------------Player-Gym Bloc Created!----------------");
            return PlayerGymBloc(usecases: di.sl());
          },
        ),
        BlocProvider<AttendenceBloc>(
          create: (context) {
            print("------------------AttendenceBloc Created!-----------------");
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
            initialRoute: ROUTE_SPLASH,
            routes: {
              ROUTE_SPLASH: (context) => const SplashScreen(),

              //  AUTH
              // ROUTE_AUTH: (context) => const EmailAuthScreen(),
              ROUTE_AUTH: (context) => const AuthScreen(),
              ROUTE_FORGOT_PASSWORD: (context) => const ForgotPasswordScreen(),
              // ROUTE_PLAYER_INFO: (context) =>
              //     const PlayerInfoScreen(), // NOT REACHABLE FROM HERE

              //  MAIN
              ROUTE_HOME: (context) => HomeScreen(
                    trainingUsecases: di.sl(),
                    service: di.sl(),
                  ),
              // ROUTE_HANDSHAKE: (context) => const GymHandShakeScreen(),
              // ROUTE_EXERCISE: (context) => ExercisesPage(),
              // ROUTE_QR_SCANNER: (context) => QRScannerScreen(),
              // ROUTE_PRESENCE: (context) => const PresenceScreen(), //  NOT REACHABLE FROM HERE
              // ROUTE_SUBSCRIPTIONS: (context) => const SubScriptionScreen(),

              //  AUX
              ROUTE_MEASUREMENTS: (context) => const MeasurementScreen(),
              ROUTE_GYMS_LIST: (context) => const GymListScreen(),
              ROUTE_PROFILE: (context) => const ProfileScreen(),
              // ROUTE_ABOUT: (context) => const AboutScreen(),
              ROUTE_ABOUT: (context) => const AboutScreen2(),
            },
          );
        },
      ),
    );
  }
}
