import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // Navigator.pushReplacementNamed(
    //   context,
    //   ROUTE_AUTH,
    // );
    Navigator.pushReplacementNamed(
      context,
      ROUTE_HOME,
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
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
  }
}
