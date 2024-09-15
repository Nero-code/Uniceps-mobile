import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
// import 'package:uniceps/core/helpers/player_screen_arguments.dart';
// import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/forgot_pass_screen.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/auth_box.dart';
import 'package:uniceps/features/Auth/views/widgets/Code_Box.dart';
import 'package:uniceps/features/Auth/views/widgets/background_decoration.dart';
// import 'package:uniceps/features/Auth/views/widgets/gym_code_box.dart';
// import 'package:uniceps/features/Auth/views/widgets/password_box.dart';
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
    with RestorationMixin {
  RestorableBool isLogin = RestorableBool(false);

  RestorableString email = RestorableString(''),
      pass = RestorableString(''),
      code = RestorableString('');

  RestorableInt currentPage = RestorableInt(0);

  final duration = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutExpo;

  late PageController _pageController;

  void navOnRestore() async {
    await Future.delayed(const Duration(seconds: 0));
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
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        // statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    navOnRestore();
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.home),
            // onPressed: () =>
            //     Navigator.pushReplacementNamed(context, ROUTE_HOME),
            onPressed: () {
              // print("email: ${email.value}");
              BlocProvider.of<AuthBloc>(context).add(AuthCheckEvent());
            },
          ),
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
                          // while (Navigator.canPop(context)) {
                          //   print("check: inside while statement");
                          //   Navigator.pop(context);
                          // }
                          // return;

                          // TODO: Exit Application (for Android)
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            exit(0);
                          }
                          // For IOS
                          // exit(0);
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
                        ///   B A C K G R O U N D   P A I N T   T R I A N G L E S
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
                                      MediaQuery.of(context).size.height * 0.32,
                                  padding: const EdgeInsets.all(25),
                                  alignment: Alignment.center,
                                  child: const Image(
                                    image: AssetImage('images/logo/Logo.png'),
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
                                            // currentPage.value = 2;
                                            // _pageController.animateToPage(2,
                                            //     duration: duration, curve: curve);
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(AuthEmailCodeVerifyEvent(
                                                    code: code,
                                                    email: email.value));
                                          },
                                        ),
                                      ),
                                      //
                                      //    P A S S W O R D   S T E P
                                      //
                                      // Opacity(
                                      //   opacity: !isLogin.value ? 1 : 0,
                                      //   child: PasswordBox(
                                      //     onConfirm: (pass) {
                                      //       BlocProvider.of<AuthBloc>(context).add(
                                      //         AuthAddNewPasswordEvent(
                                      //             email: email.value, pass: pass),
                                      //       );
                                      //       currentPage.value = 3;
                                      //       _pageController.animateToPage(3,
                                      //           duration: duration, curve: curve);
                                      //     },
                                      //   ),
                                      // ),

                                      //
                                      //    G Y M - H A N D S H A K E   S T E P
                                      //

                                      // GymCodeBox(
                                      //   onPressed: (gymCode) {
                                      //     BlocProvider.of<AuthBloc>(context)
                                      //         .add(
                                      //       GymCodeVerifyEvent(
                                      //           gymCode: gymCode),
                                      //     );
                                      //   },
                                      //   onSkip: () {
                                      //     Navigator.of(context).pushNamed(
                                      //         ROUTE_PLAYER_INFO,
                                      //         arguments: PlayerArguments(
                                      //             hasData: false));
                                      //   },
                                      // ),
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
                        // Positioned(
                        //   top: 5,
                        //   right: 5,
                        //   child: DropdownButton(
                        //     items: [
                        //       DropdownMenuItem(
                        //         child: Text("English"),
                        //       ),
                        //       DropdownMenuItem(
                        //         child: Text("عربي"),
                        //       ),
                        //     ],
                        //     onChanged: (a) {},
                        //   ),
                        // ),
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
                          ),
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
