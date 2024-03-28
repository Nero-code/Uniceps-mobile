import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/widgets/Auth_Box.dart';
import 'package:uniceps/features/Auth/views/widgets/Code_Box.dart';
import 'package:uniceps/features/Auth/views/widgets/gym_code_box.dart';

////////////////////////////////////////////////////////////////////////////////
///
///   This is the email authentication screen for which the user will sign in
///   to the system.
///
///   StatefulWidget is not neccessary because the state-manegement (BLOC) will
///   handle the changes in UI...
///
////////////////////////////////////////////////////////////////////////////////

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  bool flag = true;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///   U N I C E P S   L O G O

                      Container(
                        width: MediaQuery.of(context).size.height * 0.3,
                        height: MediaQuery.of(context).size.height * 0.32,
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade600,
                            // gradient: RadialGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 140, 0, 255),
                            //     Color.fromARGB(82, 38, 0, 87),
                            //     Colors.purple,
                            //   ],
                            //   stops: [0.6, 0.8, 0.9],
                            //   radius: 1.5,
                            //   center: Alignment.lerp(
                            //           Alignment.center, Alignment.bottomRight, 0.7)
                            //       as Alignment,
                            // ),
                          ),
                        ),
                      ),

                      ///   M I D D L E   C A R D

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          children: [
                            AuthBox(
                              onPressed: () async =>
                                  _pageController.animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOutExpo),
                            ),
                            CodeBox(
                              onPressed: () async =>
                                  _pageController.animateToPage(2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOutExpo),
                            ),
                            GymCodeBox(
                                onPressed: () => _pageController.animateToPage(
                                    0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeOutExpo)),
                          ],
                        ),
                      ),
                      Center(
                        child: Text("TrioVerse"),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is AuthLoadingState)
                Stack(
                  children: [
                    Container(
                      color: const Color.fromARGB(108, 0, 0, 0),
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }
}
