import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        print("inside Splash: " + state.runtimeType.toString());
        if (state is AuthErrorState) {
          print("Splash check 1");
          Navigator.of(context).pushReplacementNamed(ROUTE_AUTH);
        } else if (state is AuthAuthenticatedState) {
          print("Splash check 2");

          BlocProvider.of<ProfileBloc>(context)
              .add(const GetProfileDataEvent());
          print("Splash check 5");
        }
      },
      child: BlocConsumer<ProfileBloc, ProfileState>(
        // listenWhen: (previous, current) =>
        //     state is AuthAuthenticatedState,
        listener: (context, profileState) async {
          // print("Splash: --> Auth State:    ${authState.runtimeType}");
          print("Splash: --> Profile State: ${profileState.runtimeType}");
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
              Navigator.pushReplacementNamed(context, ROUTE_HOME);
            }
          }
        },
        buildWhen: (_, __) => false,
        builder: (_, __) => const Scaffold(
          body: Center(
            child: Image(
                image: AssetImage('images/logo/Logo.png'),
                height: 150,
                width: 150),
          ),
        ),
      ),
      // },
    );

    // return MultiBlocListener(
    //   listeners: [
    //     BlocListener<AuthBloc, AuthState>(
    //       listener: (context, state) async {
    //         if (state is AuthErrorState) {
    //           Navigator.pushReplacementNamed(context, ROUTE_AUTH);
    //         }
    //       },
    //     ),
    //     BlocListener<ProfileBloc, ProfileState>(
    //       listener: (context, state) async {
    //         if (state is ProfileErrorState) {
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => PlayerInfoScreen(),
    //             ),
    //           );
    //         }
    //         Navigator.pushReplacementNamed(context, ROUTE_HOME);
    //       },
    //     ),
    //   ],
    //   child: Scaffold(
    //     body: Container(
    //       // decoration: BoxDecoration(
    //       //   gradient: LinearGradient(
    //       //     colors: [
    //       //       mainBlueDark,
    //       //       mainBlueLight,
    //       //     ],
    //       //     begin: Alignment.topLeft,
    //       //     end: Alignment.bottomRight,
    //       //   ),
    //       // ),
    //       child: const Center(
    //         child: Image(
    //             image: AssetImage('images/logo/Logo.png'),
    //             height: 150,
    //             width: 150),
    //       ),
    //     ),
    //   ),
    // );
  }
}
