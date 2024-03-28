import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(
      context,
      ROUTE_HOME,
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
