import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/presentation/auth/screens/email_auth_screen.dart';
import 'package:uniceps/app/presentation/blocs/app_state/app_state_cubit.dart';
import 'package:uniceps/app/presentation/membership/screens/membership_screen.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/screens/about_screen.dart';
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
        // BlocProvider<AuthBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------AuthBloc Created!-----------------------");
        //     return AuthBloc(usecases: di.sl(), guestMode: di.sl())
        //       ..add(AuthCheckEvent());
        //   },
        // ),
        // BlocProvider<TrainingBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------TrainingBLoc Created!-------------------");
        //     return TrainingBloc(usecases: di.sl(), manager: di.sl())
        //       ..add(const GetProgramEvent());
        //   },
        // ),
        // BlocProvider<ExercisesBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------ExercisesBLoc Created!------------------");
        //     return ExercisesBloc(usecases: di.sl());
        //   },
        // ),
        // BlocProvider<ProfileBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------ProfileBloc Created!--------------------");
        //     return ProfileBloc(usecases: di.sl());
        //     // return di.sl()..add(event);
        //   },
        // ),
        // BlocProvider<SubsBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------SubsBloc Created!-----------------------");
        //     return SubsBloc(usecases: di.sl());
        //   },
        // ),
        // BlocProvider<MeasurmentBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------MeasurmentsBloc Created!----------------");
        //     return MeasurmentBloc(usecases: di.sl())
        //       ..add(GetMeasurementsEvent());
        //   },
        // ),
        // BlocProvider<GymsBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------GymsBloc Created!-----------------------");
        //     return GymsBloc(usecases: di.sl())
        //       ..add(const GetAllAvailableGymsEvent());
        //   },
        // ),
        // BlocProvider(
        //   create: (context) {
        //     debugPrint(
        //         "------------------Player-Gym Bloc Created!----------------");
        //     return PlayerGymBloc(usecases: di.sl());
        //   },
        // ),
        // BlocProvider<AttendenceBloc>(
        //   create: (context) {
        //     debugPrint(
        //         "------------------AttendenceBloc Created!-----------------");
        //     return AttendenceBloc(di.sl());
        //   },
        // ),

        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguageCode(),
        ),

        BlocProvider<AppStateCubit>(
          create: (context) => AppStateCubit(di.sl())..getUserAccount(),
        ),
        // BlocProvider(create: (context) => AccountBloc()),
        // BlocProvider(create: (context) => SubscriptionsBloc()),
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
            initialRoute: AppRoutes.splash,
            routes: {
              //  MAIN
              AppRoutes.splash: (context) => const SplashScreen(),
              AppRoutes.home: (context) => const HomeScreen(),

              //  AUTH
              AppRoutes.auth: (context) => const EmailAuthScreen(),
              // ROUTE_PROFILE: (context) => const ProfileScreen(),

              // //  AUX
              // ROUTE_GYMS_LIST: (context) => const GymListScreen(),
              AppRoutes.about: (context) => const AboutScreen(),
              AppRoutes.plans: (context) => const MembershipScreen(),
            },
          );
        },
      ),
    );
  }
}
