import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.onBackground,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).colorScheme.secondary,
          ),
        );
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            // gradient: RadialGradient(
            //   colors: [
            //     mainBlueDark,
            //     mainBlueLight,
            //   ],
            //   center: Alignment.topLeft,
            //   radius: 2,
            //   stops: [
            //     0.5,
            //     0.5,
            //   ],
            // ),
            gradient: LinearGradient(
              colors: [
                secondaryBlue,
                mainBlueDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.5,
                0.5,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height * 0.3,
                    height: MediaQuery.of(context).size.height * 0.32,
                    padding: const EdgeInsets.all(25),
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('images/logo/Logo-dark.png'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const BackgroundCard(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Please enter your email:"),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
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
                              child: Text("OK"),
                            ),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const BackgroundCard(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Enter the code sent to your email:"),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                    duration: duration,
                                    curve: Curves.easeOutExpo);
                              },
                              child: Text("Verify"),
                            ),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const BackgroundCard(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Enter New Password:"),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("New Pass"),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text("Confirm New Password:"),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                    duration: duration,
                                    curve: Curves.easeOutExpo);
                              },
                              child: Text("Confirm"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
