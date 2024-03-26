import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/Email_and_pass_screen.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Training/views/Screens/HomeScreen.dart';
import 'package:uniceps/features/Training/views/Screens/Measurements_and_profile_page.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:uniceps/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
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
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            title: 'Uniceps',
            theme: lightTheme,
            // darkTheme: ThemeData(
            //     colorScheme: ColorScheme.fromSeed(
            //         seedColor: Colors.blue, brightness: Brightness.dark)),

            initialRoute: ROUTE_HOME,
            routes: {
              ROUTE_SPLASH: (_) => const SplashScreen(),
              ROUTE_HOME: (_) => HomeScreen(),
              ROUTE_MEASUREMENTS: (_) => MeasurementAndProfilePage(),
              ROUTE_AUTH: (_) => EmailAuthScreen(),
              ROUTE_QR_SCANNER: (_) => Container(),
            },
          );
        },
      ),
    );
  }
}
