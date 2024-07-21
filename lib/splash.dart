import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';

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
        print(state.runtimeType);
        if (state is AuthErrorState) {
          Navigator.of(context).pushReplacementNamed(ROUTE_AUTH);
        } else {
          Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
        }
      },
      builder: (context, state) {
        return Scaffold(
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
        );
      },
    );
  }
}
