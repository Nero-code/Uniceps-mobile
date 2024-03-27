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
            PageView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: Center(
                        child: Text("Change Password"),
                      ),
                    ),
                    BackgroundCard(
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("Email"),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Next"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Center(
                        child: Text("Change Password"),
                      ),
                    ),
                    BackgroundCard(
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("Verification Code"),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
