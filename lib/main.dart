import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/screens/Email_and_pass_screen.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Training/views/Screens/HomeScreen.dart';
import 'package:uniceps/features/Training/views/Screens/Measurements_and_profile_page.dart';
import 'package:uniceps/features/Training/views/bloc/training_bloc.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/main_bloc/main_bloc.dart';
import 'package:uniceps/splash.dart';

void main() async {
  di.init();
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
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Uniceps',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            // darkTheme: ThemeData(
            //     colorScheme: ColorScheme.fromSeed(
            //         seedColor: Colors.blue, brightness: Brightness.dark)),
            themeMode: state is ActiveState ? state.themeMode : ThemeMode.light,

            initialRoute: '/',
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
