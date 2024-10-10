import 'package:flutter/material.dart';

import 'package:uniceps/features/Auth/views/widgets/code_box.dart';
import 'package:uniceps/features/Auth/views/widgets/background_decoration.dart';
import 'package:uniceps/features/Auth/views/widgets/password_box.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final PageController controller;

  final emailCtl = TextEditingController();
  final codeCtl = TextEditingController();
  final passCtl = TextEditingController();
  final confirmCtl = TextEditingController();

  final duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(),
            child: CustomPaint(
              painter: TriPainter(
                  mainColor: Theme.of(context).colorScheme.secondary,
                  secondary: Theme.of(context).colorScheme.secondary),
            ),
          ),
          SafeArea(
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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Please enter your email:",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: emailCtl,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey.shade700,
                                      ),
                                      contentPadding: const EdgeInsets.all(10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      border: const OutlineInputBorder(),
                                      label: const Text("Email"),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                                foregroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Colors.grey.shade700,
                                ),
                              ),
                              onPressed: () {
                                if (emailCtl.text.isNotEmpty) {
                                  controller.animateToPage(
                                    1,
                                    duration: duration,
                                    curve: Curves.easeOutExpo,
                                  );
                                }
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                        // Column(
                        //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     const BackgroundCard(
                        //       child: Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Text("Enter the code sent to your email:"),
                        //           TextField(
                        //             decoration: InputDecoration(
                        //               border: OutlineInputBorder(),
                        //               label: Text("Verification Code"),
                        //             ),
                        //           ),
                        //           SizedBox(height: 20),
                        //         ],
                        //       ),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         controller.animateToPage(2,
                        //             duration: duration,
                        //             curve: Curves.easeOutExpo);
                        //       },
                        //       child: Text("Verify"),
                        //     ),
                        //   ],
                        // ),
                        CodeBox(onPressed: (code) {
                          controller.animateToPage(
                            2,
                            duration: duration,
                            curve: Curves.easeOutExpo,
                          );
                        }),
                        PasswordBox(onConfirm: (password) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
