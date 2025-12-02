import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/presentation/auth/screens/email_auth_screen.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/daily_quote/daily_quote_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/screens/cap_about_screen.dart';
import 'package:uniceps/app/presentation/measurement/screens/measurement_screen.dart';
import 'package:uniceps/app/presentation/performance/screens/measurement_tool_screen.dart';
import 'package:uniceps/app/presentation/performance/screens/performance_screen.dart';
import 'package:uniceps/app/presentation/plans/screens/plans_screen.dart';
import 'package:uniceps/app/presentation/profile/screens/profile_initial_screen.dart';
import 'package:uniceps/app/presentation/routine/screens/routines_heat_screen.dart';
import 'package:uniceps/app/presentation/settings/screens/profile_screen.dart';
import 'package:uniceps/app/presentation/settings/screens/settings_screen.dart';
import 'package:uniceps/app/services/notification_service.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/app/presentation/screens/about_screen.dart';
import 'package:uniceps/firebase_options.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/home/screens/home_screen.dart';
import 'package:uniceps/splash.dart';
import 'core/constants/app_routes.dart';

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

  await NotificationService.init();

  debugPrint('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FlutterDownloader.initialize(
    debug: false,
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
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
        ),
        BlocProvider<AccountCubit>(
          create: (context) => AccountCubit(di.sl(), di.sl())..getUserAccount(),
        ),
        BlocProvider(
          create: (context) => MembershipBloc(di.sl())..add(const MembershipEvent.getCurrentPlan()),
        ),
        BlocProvider(
          create: (context) => CurrentRoutineCubit(commands: di.sl())..getCurrentRoutine(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SessionBloc(commands: di.sl())..add(const SessionEvent.getLastActiveSession()),
        ),
        BlocProvider(
          create: (context) => DailyQuoteCubit(di.sl())..getQuote(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangedLangState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorKey.navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            restorationScopeId: "root",
            title: 'Uniceps',
            theme: lightTheme,
            initialRoute: AppRoutes.splash,
            routes: {
              //  MAIN
              AppRoutes.splash: (_) => const SplashScreen(),
              AppRoutes.profileInitial: (_) => const ProfileInitialScreen(),
              AppRoutes.profile: (_) => const ProfileScreen(),
              AppRoutes.home: (_) => const HomeScreen(),

              // ROUTINE
              // AppRoutes.routineManager: (_) =>
              //     const RoutineManagementScreen(),
              AppRoutes.routineManager: (_) => const RoutinesHeatScreen(),

              //  AUTH
              AppRoutes.auth: (_) => const EmailAuthScreen(),

              // SETTINGS
              AppRoutes.settings: (_) => const SettingsScreen(),
              AppRoutes.measurements: (_) => const MeasurementScreen(),
              AppRoutes.measurementTool: (_) => MeasurementToolScreen(commands: di.sl()),
              AppRoutes.performance: (_) => PerformanceScreen(routineCommnds: di.sl(), performanceCommands: di.sl()),
              AppRoutes.plans: (_) => const PlansScreen(),

              //  AUX
              AppRoutes.about: (_) => const AboutScreen(),
              AppRoutes.capAbout: (_) => const CapAboutScreen(),
            },
          );
        },
      ),
    );
  }
}
