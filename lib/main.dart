import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/email_and_pass_screen.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Profile/presentation/measurement_screen.dart';
import 'package:uniceps/features/Profile/presentation/profile_screen.dart';
import 'package:uniceps/features/Training/views/Screens/exercise_screen.dart';
import 'package:uniceps/features/Training/views/Screens/home_screen.dart';
import 'package:uniceps/features/Training/views/Screens/presence_screen.dart';
import 'package:uniceps/features/Training/views/Screens/qr_scanner_screen.dart';
import 'package:uniceps/features/Subscriptions/presentation/subs_screen.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/firebase_options.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            create: (context) => AuthBloc(usecases: di.sl())),
        BlocProvider<TrainingBloc>(
            create: (context) => TrainingBloc(usecases: di.sl())),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangedLangState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.white,
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
              ROUTE_SPLASH: (context) => SplashScreen(),

              //  AUTH
              ROUTE_AUTH: (context) => EmailAuthScreen(),
              ROUTE_FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),

              //  MAIN
              ROUTE_HOME: (context) => HomeScreen(logger: di.sl()),
              ROUTE_EXERCISE: (context) => ExercisesPage(),
              ROUTE_QR_SCANNER: (context) => QRScannerScreen(),
              ROUTE_PRESENCE: (context) => PresenceScreen(),

              //  AUX
              ROUTE_MEASUREMENTS: (context) => MeasurementScreen(),
              ROUTE_SUBSCRIPTIONS: (context) => SubScriptionScreen(),
              ROUTE_PROFILE: (context) => ProfileScreen(),
              ROUTE_PLAYER_INFO: (context) => PlayerInfoScreen(),
            },
          );
        },
      ),
    );
  }
}
