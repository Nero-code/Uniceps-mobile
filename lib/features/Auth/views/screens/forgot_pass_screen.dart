import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackgroundCard(
              child: TextField(
                decoration: InputDecoration(
                  label: Text("ASda"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
