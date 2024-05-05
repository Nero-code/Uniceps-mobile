import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/auth_box.dart';
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

class _EmailAuthScreenState extends State<EmailAuthScreen>
    with RestorationMixin {
  bool flag = true;

  RestorableString email = RestorableString(''),
      pass = RestorableString(''),
      code = RestorableString('');

  RestorableInt currentPage = RestorableInt(0);

  final duration = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutExpo;

  late PageController _pageController;

  void navOnRestore() async {
    await Future.delayed(Duration(seconds: 0));
    print("currentPage: ${currentPage.value}");
    _pageController.animateToPage(currentPage.value,
        duration: duration, curve: curve);
  }

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.secondary,
      ),
    );
    navOnRestore();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              mainBlueDark,
              mainBlueLight,
            ],
            center: Alignment.topLeft,
            radius: 2,
            stops: [
              0.5,
              0.5,
            ],
          ),
          // gradient: LinearGradient(
          //   colors: [
          //     mainBlueDark,
          //     secondaryBlue,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   stops: [
          //     0.5,
          //     0.5,
          //   ],
          // ),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
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
                          padding: EdgeInsets.all(25),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage('images/logo/Logo-light.png'),
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
                                onPressed: (e, p) async {
                                  email.value = e;
                                  pass.value = p;
                                  currentPage.value = 1;
                                  _pageController.animateToPage(1,
                                      duration: duration,
                                      curve: Curves.easeOutExpo);
                                },
                                onForgot: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen(),
                                  ),
                                ),
                              ),
                              CodeBox(
                                onPressed: (code) async {
                                  currentPage.value = 2;
                                  _pageController.animateToPage(2,
                                      duration: duration, curve: curve);
                                },
                              ),
                              GymCodeBox(
                                onPressed: (gymCode) {
                                  // TODO: API integration...
                                  // Navigator.of(context).pushReplacementNamed(
                                  //   ROUTE_PLAYER_INFO,
                                  //   arguments: {
                                  //     "isEdit": false,
                                  //     "data": "Player Data Goes Here",
                                  //   },
                                  // );
                                },
                                onSkip: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      ROUTE_PLAYER_INFO,
                                      arguments: {"isEdit": true});
                                },
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            "TrioVerse",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
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
      ),
    );
  }

  @override
  String? get restorationId => "signin_page";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(currentPage, 'currentPage');
    registerForRestoration(email, 'email');
    registerForRestoration(pass, 'pass');
    registerForRestoration(code, 'code');
  }
}
