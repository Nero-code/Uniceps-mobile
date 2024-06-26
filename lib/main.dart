import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/email_and_pass_screen.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/measurement_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/profile_screen.dart';
import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/Screens/home_screen.dart';
import 'package:uniceps/features/Training/views/Screens/presence_screen.dart';
import 'package:uniceps/features/Training/views/Screens/qr_scanner_screen.dart';
import 'package:uniceps/features/Profile/presentation/screens/subs_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/firebase_options.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
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
          create: (context) =>
              AuthBloc(usecases: di.sl())..add(AuthCheckEvent()),
        ),
        BlocProvider<TrainingBloc>(
          create: (context) =>
              TrainingBloc(usecases: di.sl())..add(const GetProgramEvent()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) =>
              ProfileBloc(usecases: di.sl())..add(const GetProfileDataEvent()),
        ),
        BlocProvider<SubsBloc>(
          create: (context) => SubsBloc(usecases: di.sl()),
        ),
        BlocProvider<MeasurmentBloc>(
          create: (context) => MeasurmentBloc(usecases: di.sl()),
        ),
        BlocProvider<GymsBloc>(
          create: (context) =>
              GymsBloc(usecases: di.sl())..add(const GetAllGymsEvent()),
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
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
              ROUTE_AUTH: (context) => EmailAuthScreen(),
              ROUTE_FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),
              ROUTE_PLAYER_INFO: (context) =>
                  const PlayerInfoScreen(), // NON REACHABLE FROM HERE

              //  MAIN
              ROUTE_HOME: (context) => HomeScreen(trainingUsecases: di.sl()),
              ROUTE_EXERCISE: (context) => ExercisesPage(),
              ROUTE_QR_SCANNER: (context) => QRScannerScreen(),
              ROUTE_PRESENCE: (context) => const PresenceScreen(),

              //  AUX
              ROUTE_MEASUREMENTS: (context) => MeasurementScreen(),
              ROUTE_SUBSCRIPTIONS: (context) => const SubScriptionScreen(),
              ROUTE_PROFILE: (context) => const ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}
