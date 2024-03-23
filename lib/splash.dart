import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/screens/Email_and_pass_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => EmailAuthScreen()));
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
