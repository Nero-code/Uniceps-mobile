import 'package:flutter/material.dart';
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        print("inside Splash: " + state.runtimeType.toString());
        if (state is AuthErrorState) {
          print("check 1");
          Navigator.of(context).pushReplacementNamed(ROUTE_AUTH);
        } else if (state is AuthAuthenticatedState) {
          print("check 2");
          // BlocListener<ProfileBloc, ProfileState>(
          //   bloc: BlocProvider.of<ProfileBloc>(context),
          //   listener: (context, state) async {
          //     print("Profile Listener");
          //     if (state is ProfileInitial) {
          //       print("check 3");
          //       BlocProvider.of<ProfileBloc>(context)
          //           .add(const GetProfileDataEvent());
          //     } else if (state is ProfileErrorState) {
          //       print("check 4 Error");
          //       final res = await Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => PlayerInfoScreen()),
          //       );
          //       if (res != null && !res) {
          //         Navigator.pop(context);
          //       }
          //     } else if (state is ProfileLoadingState) {
          //       return;
          //     } else {
          //       Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
          //       return;
          //     }
          //   },
          // );

          BlocProvider.of<ProfileBloc>(context)
              .add(const GetProfileDataEvent());
          print("check 5");
        }
      },
      builder: (context, state) {
        return BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) => state is AuthAuthenticatedState,
          listener: (context, state) async {
            if (state is ProfileLoadedState) {
              Navigator.pushReplacementNamed(context, ROUTE_HOME);
            } else if (state is ProfileErrorState) {
              final res = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerInfoScreen()),
              );
              if (res != null && !res) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(context, ROUTE_HOME);
              }
            }
          },
          buildWhen: (_, __) => false,
          builder: (_, __) => Scaffold(
            body: Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [
              //       mainBlueDark,
              //       mainBlueLight,
              //     ],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //   ),
              // ),
              child: const Center(
                child: Image(
                    image: AssetImage('images/logo/Logo.png'),
                    height: 150,
                    width: 150),
              ),
            ),
          ),
        );
      },
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
