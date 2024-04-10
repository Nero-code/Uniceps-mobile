import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final PageController controller;

  final duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Center(
                    child: Text("Change Password"),
                  ),
                ),
                BackgroundCard(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("please enter your email:"),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.animateToPage(
                      1,
                      duration: duration,
                      curve: Curves.easeOutExpo,
                    );
                  },
                  child: Text("Next"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Center(
                    child: Text("Verify Email"),
                  ),
                ),
                BackgroundCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Enter the code sent to your email:"),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Verification Code"),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.animateToPage(2,
                        duration: duration, curve: Curves.easeOutExpo);
                  },
                  child: Text("Next"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Center(
                    child: Text("Change Password"),
                  ),
                ),
                BackgroundCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Enter New Password:"),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("New Pass"),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Confirm New Password:"),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Confirm Pass"),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.animateToPage(0,
                        duration: duration, curve: Curves.easeOutExpo);
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
