import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/auth_box.dart';
import 'package:uniceps/features/Auth/views/widgets/code_box.dart';
import 'package:uniceps/features/Auth/views/widgets/back_painter.dart';
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

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with RestorationMixin, TickerProviderStateMixin {
  RestorableBool isLogin = RestorableBool(false);

  RestorableString email = RestorableString(''),
      pass = RestorableString(''),
      code = RestorableString('');

  RestorableInt currentPage = RestorableInt(0);

  final duration = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutExpo;

  bool isAnimActive = true;

  late PageController _pageController;
  late AnimationController _controller, _fadeController;

  late final Animation<int> _animation;
  late final Animation<double> _slideAnimation, _opacityAnimation;

  // void navOnRestore() async {
  //   await Future.delayed(const Duration(seconds: 0));
  //   _pageController.animateToPage(currentPage.value,
  //       duration: duration, curve: curve);
  // }

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
      duration: const Duration(milliseconds: 2500),
    );
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = IntTween(begin: 0, end: 255).animate(
      CurvedAnimation(parent: _controller, curve: curve)
        ..addListener(() {
          setState(() {});
        })
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            isAnimActive = false;
            setState(() {});
          }
        }),
    );
    _slideAnimation = Tween<double>(begin: .44, end: .22)
        .animate(CurvedAnimation(parent: _controller, curve: curve))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isAnimActive = false;
          setState(() {});
          _fadeController.forward();
        }
      });

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    _fadeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, lang) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     isAnimActive = true;
          //     _fadeController.reset();
          //     _controller.reset();
          //     _controller.forward();
          //   },
          // ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    // print(state.runtimeType);

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
                      // print("Auth State: ${state.runtimeType}");

                      // print("state.hasData: ${state.hasData}");
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

                        // print("check: if Condition state: $res");

                        if (res != null && !res) {
                          // print("check: inside if statement");

                          if (Platform.isAndroid) {
                            // Exit Application (for Android)
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            // For IOS
                            exit(0);
                          }
                        }
                      }

                      // ignore: use_build_context_synchronously
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
                    } else if (state is AuthWrongCodeState) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(local.codeError),
                          backgroundColor: Colors.red.shade300,
                        ),
                      );
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
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height,
                        //   child: CustomPaint(
                        //     painter: TriPainter(
                        //       mainColor:
                        //           Theme.of(context).colorScheme.secondary,
                        //       secondary:
                        //           Theme.of(context).colorScheme.secondary,
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: (1 - _animation.value / 255) *
                              -MediaQuery.sizeOf(context).height *
                              0.3,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          child: CustomPaint(
                            painter: AuthBackPainter(),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              alignment: Alignment.lerp(Alignment.bottomCenter,
                                  Alignment.topCenter, 0.7),
                              child: Text(local.welcome,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.grey.shade300,
                                          fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.sizeOf(context).height * 0.18,
                          // top: MediaQuery.sizeOf(context).height * 0.15,
                          width: MediaQuery.sizeOf(context).width,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).width * 0.75,
                              // height: MediaQuery.sizeOf(context).width * 0.4,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Column(
                              children: [
                                ///   U N I C E P S   L O G O
                                SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.17),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    color: isAnimActive
                                        ? Colors.transparent
                                        : null,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    image: const AssetImage(
                                      'images/logo/Logo.png',
                                    ),
                                  ),
                                ),

                                ///   M I D D L E   C A R D
                                Expanded(
                                  child: Opacity(
                                    opacity: _opacityAnimation.value,
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
                                                      email: e
                                                          .trim()
                                                          .toLowerCase()),
                                                );
                                            await context
                                                .read<AuthBloc>()
                                                .stream
                                                .skip(1)
                                                .first;

                                            // BlocProvider.of<AuthBloc>(context).add(
                                            //   EmailSigninRequestEvent(email: e),
                                            // );
                                            email.value =
                                                e.trim().toLowerCase();
                                            // currentPage.value = 1;
                                            // _pageController.animateToPage(1,
                                            //     duration: duration, curve: curve);
                                          },
                                          onForgot: () =>
                                              Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPasswordScreen(),
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
                                ),

                                Image(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 17,
                                  image: const AssetImage(
                                      "images/logo/Logo_Trio.png"),
                                ),
                                const SizedBox(height: 5.0),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.language,
                              color: Colors.grey.shade300,
                              size: 30,
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (c) => AlertDialog(
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .chooseLang),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            for (var i in Lang.values)
                                              RadioListTile(
                                                  title: Text(i == Lang.en
                                                      ? "English"
                                                      : "العربية"),
                                                  value: lang.locale
                                                          .languageCode ==
                                                      i.name,
                                                  groupValue: true,
                                                  onChanged: (newVal) {
                                                    BlocProvider.of<
                                                                LocaleCubit>(
                                                            context)
                                                        .changeLanguage(
                                                            i.name == "en"
                                                                ? "en"
                                                                : "ar");
                                                    Navigator.pop(context);
                                                  }),
                                          ],
                                        ),
                                      ).build(context));
                            },
                          ),
                        ),

                        if (state is AuthLoadingState)
                          ColoredBox(
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

                        // if (isAnimActive)
                        //   Positioned(
                        //     top: 0.0,
                        //     left: 0.0,
                        //     width: MediaQuery.sizeOf(context).width,
                        //     height: MediaQuery.sizeOf(context).height,
                        //     child: Container(
                        //       color: Colors.white
                        //           .withAlpha(255 - _animation.value),
                        //     ),
                        //   ),

                        //   C E N T E R   L O G O   A N I M A T I O N
                        if (isAnimActive)
                          Positioned(
                            top: (_slideAnimation.value) *
                                MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Container(
                              alignment: Alignment.center,
                              child: Image(
                                image: const AssetImage('images/logo/Logo.png'),
                                width: MediaQuery.sizeOf(context).width * 0.28,
                                height: MediaQuery.sizeOf(context).width * 0.28,
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
