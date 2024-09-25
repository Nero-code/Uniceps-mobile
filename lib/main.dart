import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/email_and_pass_screen.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/about.dart';
import 'package:uniceps/features/Profile/presentation/screens/gym_list_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/measurement_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/profile_screen.dart';
import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/Screens/gym_handshake_screen.dart';
import 'package:uniceps/features/Training/views/Screens/home_screen.dart';
// import 'package:uniceps/features/Profile/presentation/screens/presence_screen.dart';
import 'package:uniceps/features/Training/views/Screens/qr_scanner_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/subs_screen.dart';
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
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            print(
                "------------------------AuthBloc Created!--------------------------");
            return AuthBloc(usecases: di.sl())..add(AuthCheckEvent());
          },
        ),
        BlocProvider<TrainingBloc>(
          create: (context) {
            print(
                "------------------------TrainingBLoc Created!----------------------");
            return TrainingBloc(usecases: di.sl())
              ..add(const GetProgramEvent());
          },
        ),
        BlocProvider<ExercisesBloc>(
          create: (context) {
            print(
                "------------------------ExercisesBLoc Created!----------------------");
            return ExercisesBloc(usecases: di.sl());
          },
        ),
        BlocProvider<ProfileBloc>(
          create: (context) {
            print(
                "------------------------ProfileBloc Created!--------------------------");
            return ProfileBloc(usecases: di.sl());
          },
        ),
        BlocProvider<SubsBloc>(
          create: (context) {
            print(
                "------------------------SubsBloc Created!--------------------------");
            return SubsBloc(usecases: di.sl());
          },
        ),
        BlocProvider<HandshakeBloc>(create: (context) {
          print(
              "------------------------HandshakesBloc Created!--------------------------");
          return HandshakeBloc(usecases: di.sl())..add(GetAllHandShakeEvent());
        }),
        BlocProvider<MeasurmentBloc>(create: (context) {
          print(
              "------------------------MeasurmentsBloc Created!--------------------------");
          return MeasurmentBloc(usecases: di.sl())..add(GetMeasurementsEvent());
        }),
        BlocProvider<GymsBloc>(create: (context) {
          print(
              "------------------------GymsBloc Created!--------------------------");
          return GymsBloc(usecases: di.sl())..add(const GetSubscribedToGym());
        }),
        BlocProvider<AttendenceBloc>(create: (context) {
          print(
              "------------------------AttendenceBloc Created!--------------------------");
          return AttendenceBloc(di.sl());
        }),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
        ),
        BlocProvider<TrainingSectionCubit>(
          create: (context) => TrainingSectionCubit()..getSection(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangedLangState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).colorScheme.background,
            ),
          );
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            restorationScopeId: "root",
            title: 'Uniceps',
            theme: lightTheme,
            // darkTheme: ThemeData(
            //     colorScheme: ColorScheme.fromSeed(
            //         seedColor: Colors.blue, brightness: Brightness.dark)),

            initialRoute: ROUTE_SPLASH,
            routes: {
              ROUTE_SPLASH: (context) => const SplashScreen(),

              //  AUTH
              ROUTE_AUTH: (context) => const EmailAuthScreen(),
              ROUTE_FORGOT_PASSWORD: (context) => const ForgotPasswordScreen(),
              // ROUTE_PLAYER_INFO: (context) =>
              //     const PlayerInfoScreen(), // NON REACHABLE FROM HERE

              //  MAIN
              ROUTE_HOME: (context) => HomeScreen(trainingUsecases: di.sl()),
              ROUTE_HANDSHAKE: (context) => const GymHandShakeScreen(),
              ROUTE_EXERCISE: (context) => ExercisesPage(),
              ROUTE_QR_SCANNER: (context) => QRScannerScreen(),
              // ROUTE_PRESENCE: (context) => const PresenceScreen(),
              ROUTE_GYMS_LIST: (context) => const GymListScreen(),

              //  AUX
              ROUTE_MEASUREMENTS: (context) => const MeasurementScreen(),
              ROUTE_SUBSCRIPTIONS: (context) => const SubScriptionScreen(),
              ROUTE_PROFILE: (context) => const ProfileScreen(),
              ROUTE_ABOUT: (context) => const AboutScreen(),
            },
          );
        },
      ),
    );
  }
}
