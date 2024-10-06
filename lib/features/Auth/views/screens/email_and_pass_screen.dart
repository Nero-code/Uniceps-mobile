import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/auth_box.dart';
import 'package:uniceps/features/Auth/views/widgets/Code_Box.dart';
import 'package:uniceps/features/Auth/views/widgets/background_decoration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

// /////////////////////////////////////////////////////////////////////////////
//
//    This is the email authentication screen for which the user will sign in
//    to the system.
//
//    StatefulWidget is not neccessary because the state-manegement (BLOC) will
//    handle the changes in UI...
//
// /////////////////////////////////////////////////////////////////////////////

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen>
    with RestorationMixin, SingleTickerProviderStateMixin {
  RestorableBool isLogin = RestorableBool(false);

  RestorableString email = RestorableString(''),
      pass = RestorableString(''),
      code = RestorableString('');

  RestorableInt currentPage = RestorableInt(0);

  final duration = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutExpo;

  bool isAnimActive = true;

  late PageController _pageController;
  late AnimationController _controller;

  late final Animation<int> _animation;
  late final Animation<Offset> _slideAnimation;

  void navOnRestore() async {
    await Future.delayed(const Duration(seconds: 0));
    print("currentPage: ${currentPage.value}");
    _pageController.animateToPage(currentPage.value,
        duration: duration, curve: curve);
  }

  // void endAnimation() async {
  //   if (isAnimActive) {
  //     await Future.delayed(duration);
  //     isAnimActive = false;
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    _pageController = PageController();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _animation = Tween<int>(begin: 0, end: 255).animate(
      CurvedAnimation(parent: _controller, curve: curve),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(.2, .5), end: const Offset(.2, .01))
            .animate(CurvedAnimation(parent: _controller, curve: curve));
    _controller.addListener(() {
      if (_controller.isCompleted) {
        isAnimActive = false;
        setState(() {});
      }
      setState(() {});
    });
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navOnRestore();
    // endAnimation();
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    // gradient: RadialGradient(
                    //   colors: [
                    //     mainBlueDark,
                    //     mainBlueLight,
                    //   ],
                    //   center: Alignment.topLeft,
                    //   radius: 2.2,
                    //   stops: [
                    //     0.5,
                    //     0.5,
                    //   ],
                    // ),
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
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    print(state.runtimeType);

                    // AuthCodeSent
                    // AuthNewPass
                    // AuthDone
                    if (state is AuthCodeSentState) {
                      //
                      //  Jump to Code input
                      //
                      currentPage.value = 1;
                      _pageController.animateToPage(1,
                          duration: duration, curve: curve);
                    } else if (state is AuthDoneState) {
                      print("Auth State: ${state.runtimeType}");

                      print("state.hasData: ${state.hasData}");
                      if (!state.hasData) {
                        final res = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PlayerInfoScreen(player: null),
                          ),
                          // ROUTE_PLAYER_INFO,
                          // arguments: PlayerArguments(
                          //     hasData: state.hasData, data: state.player),
                        );

                        print("check: if Condition state: $res");

                        if (res != null && !res) {
                          print("check: inside if statement");

                          // TODO: Exit Application (for Android)
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            // For IOS
                            exit(0);
                          }
                        }
                      }

                      Navigator.pushReplacementNamed(context, ROUTE_HOME);
                      //
                      //  Jump to Gym handshake
                      //

                      // state.player;
                      // Navigator.of(context).pushReplacementNamed(
                      //   ROUTE_PLAYER_INFO,
                      //   arguments: {
                      //     "isEdit": false,
                      //     "data": const Player(
                      //         name: "name",
                      //         phoneNum: "phoneNum",
                      //         birthDate: "birthDate",
                      //         gender: Gender.male),
                      //   },
                      // );
                      // currentPage.value = 2;
                      // _pageController.animateToPage(2,
                      //     duration: duration, curve: curve);
                    }
                    //  else if (state is GymVerifiedState) {
                    //   Navigator.pushReplacementNamed(
                    //       context, ROUTE_PLAYER_INFO);
                    // }
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        //   B A C K G R O U N D   P A I N T   T R I A N G L E S
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: CustomPaint(
                            painter: TriPainter(
                              mainColor:
                                  Theme.of(context).colorScheme.secondary,
                              secondary:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ///   U N I C E P S   L O G O
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  padding: const EdgeInsets.all(25),
                                  alignment: Alignment.center,
                                  child: isAnimActive
                                      ? null
                                      : const Image(
                                          image: AssetImage(
                                              'images/logo/Logo.png'),
                                        ),
                                ),

                                ///   M I D D L E   C A R D
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: PageView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _pageController,
                                    children: [
                                      //
                                      //    E M A I L - I N P U T   S T E P  # 0
                                      //
                                      AuthBox(
                                        isLogin: isLogin.value,
                                        onChangeType: () {
                                          setState(() {
                                            isLogin.value = !isLogin.value;
                                          });
                                        },
                                        login: (e, p) async {
                                          context.read<AuthBloc>().add(
                                                LoginWithEmailAndPassEvent(
                                                    email: e, pass: p),
                                              );
                                          await context
                                              .read<AuthBloc>()
                                              .stream
                                              .skip(1)
                                              .first;

                                          // BlocProvider.of<AuthBloc>(context).add(
                                          //   LoginWithEmailAndPassEvent(
                                          //       email: e, pass: p),
                                          // );
                                          email.value = e;
                                          pass.value = p;
                                          // currentPage.value = 3;

                                          // _pageController.animateToPage(3,
                                          //     duration: duration,
                                          //     curve: Curves.easeOutExpo);
                                        },
                                        signin: (e) async {
                                          context.read<AuthBloc>().add(
                                                EmailSigninRequestEvent(
                                                    email:
                                                        e.trim().toLowerCase()),
                                              );
                                          await context
                                              .read<AuthBloc>()
                                              .stream
                                              .skip(1)
                                              .first;

                                          // BlocProvider.of<AuthBloc>(context).add(
                                          //   EmailSigninRequestEvent(email: e),
                                          // );
                                          email.value = e.trim().toLowerCase();
                                          // currentPage.value = 1;
                                          // _pageController.animateToPage(1,
                                          //     duration: duration, curve: curve);
                                        },
                                        onForgot: () =>
                                            Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordScreen(),
                                          ),
                                        ),
                                      ),

                                      //
                                      //  C O D E   I N P U T   S T E P   # 1
                                      //
                                      Opacity(
                                        opacity: !isLogin.value ? 1 : 0,
                                        child: CodeBox(
                                          onPressed: (code) async {
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(AuthEmailCodeVerifyEvent(
                                                    code: code,
                                                    email: email.value));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "TrioVerse",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700,
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
                                      padding: const EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const CircularProgressIndicator()),
                                ),
                              ),
                            ],
                          ),

                        if (isAnimActive)
                          Positioned(
                            top: 0.0,
                            left: 0.0,
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            child: Container(
                              color: Colors.white
                                  .withAlpha(255 - _animation.value),
                            ),
                          ),
                        //   C E N T E R   L O G O   A N I M A T I O N

                        AnimatedPositioned(
                          duration: duration,
                          top: MediaQuery.sizeOf(context).height *
                                  0.5 *
                                  (1 - _animation.value / 255) +
                              (isAnimActive ? 0.0 : 20.0),
                          width: MediaQuery.sizeOf(context).width,
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.25,
                            height: MediaQuery.of(context).size.height * 0.25,
                            padding: const EdgeInsets.all(25),
                            alignment: Alignment.center,
                            child: const Image(
                              image: AssetImage('images/logo/Logo.png'),
                            ),
                          ),
                        ),

                        // Transform.translate(
                        //   offset: _slideAnimation.value,
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.height * 0.25,
                        //     height: MediaQuery.of(context).size.height * 0.25,
                        //     padding: const EdgeInsets.all(25),
                        //     alignment: Alignment.center,
                        //     child: const Image(
                        //       image: AssetImage('images/logo/Logo.png'),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.language,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context)!.chooseLang),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (var i in Lang.values)
                                    RadioListTile(
                                        title: Text(i == Lang.en
                                            ? "English"
                                            : "العربية"),
                                        value:
                                            state.locale.languageCode == i.name,
                                        groupValue: true,
                                        onChanged: (newVal) {
                                          BlocProvider.of<LocaleCubit>(context)
                                              .changeLanguage(
                                                  i.name == "en" ? "en" : "ar");
                                          Navigator.pop(context);
                                        }),
                                ],
                              ),
                            ).build(context));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  String? get restorationId => "signin_page";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(currentPage, 'currentPage');
    registerForRestoration(isLogin, 'isLogin');
    registerForRestoration(email, 'email');
    registerForRestoration(pass, 'pass');
    registerForRestoration(code, 'code');
  }
}
