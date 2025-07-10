import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/app/presentation/blocs/authentication/auth_bloc.dart';
import 'package:uniceps/app/presentation/auth(old)/screens/auth_screen.dart';
import 'package:uniceps/app/presentation/auth(old)/screens/player_info_screen.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  // Future<void> navigate(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   // Navigator.pushReplacementNamed(
  //   //   context,
  //   //   ROUTE_AUTH,
  //   // );
  //   Navigator.pushReplacementNamed(
  //     context,
  //     ROUTE_HOME,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // navigate(context);
    // print("------------------------inside Splash-----------------------------");
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        // await Future.delayed(const Duration(seconds: 2));
        // print("inside Splash: ${state.runtimeType}");
        if (state is AuthErrorState) {
          // print("Splash check 1");
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AuthScreen(),
            ),
          );
        } else if (state is AuthAuthenticatedState) {
          // print("Splash check 2");

          BlocProvider.of<ProfileBloc>(context)
              .add(const GetProfileDataEvent());
          // print("Splash check 5");
        }
      },
      child: BlocConsumer<ProfileBloc, ProfileState>(
        // listenWhen: (previous, current) =>
        //     state is AuthAuthenticatedState,
        listener: (context, profileState) async {
          // print("Splash: --> Auth State:    ${authState.runtimeType}");
          // print("Splash: --> Profile State: ${profileState.runtimeType}");
          if (profileState is ProfileLoadedState) {
            Navigator.pushReplacementNamed(context, ROUTE_HOME);
          } else if (profileState is ProfileErrorState) {
            final res = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlayerInfoScreen()),
            );
            if (res != null && !res) {
              // Navigator.pop(context);
              SystemNavigator.pop();
            } else {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, ROUTE_HOME);
            }
          }
        },
        buildWhen: (_, __) => false,
        builder: (_, __) => Scaffold(
          body: Center(
            child: Image(
                image: const AssetImage('images/logo/Logo.png'),
                height: MediaQuery.sizeOf(context).width * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.3),
          ),
        ),
      ),
    );
  }
}
