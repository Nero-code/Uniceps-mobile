import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/auth/bloc/auth_bloc.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final radius = 50.0;

  final codeSent = false;

  String email = '';

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => AuthBloc(di.sl()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(locale.signin),
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) =>
              state.whenOrNull(authenticated: () => Navigator.pop(context)),
          builder: (context, state) => Directionality(
            textDirection: TextDirection.ltr,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: screen.height * 0.25,
                    // child: const Opacity(
                    //   opacity: 0.3,
                    //   child: Image(
                    //     image: AssetImage(APP_LOGO_DARK),
                    //     width: 70,
                    //     height: 70,
                    //   ),
                    // ),
                  ),
                  TextFormField(
                    controller: emailController,
                    textDirection: TextDirection.ltr,
                    // readOnly: true,
                    enabled: state.maybeWhen(
                        initial: () => true,
                        error: (f) => f.when(
                            offline: () => true,
                            invalidCodeFailure: () => false,
                            unautherizedFailure: () => false),
                        orElse: () => false),

                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      hintText: "john.doe@gmail.com",
                      label: const Text("Email"),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    onTapOutside: unfocus,

                    onFieldSubmitted: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: codeController,
                    textDirection: TextDirection.ltr,
                    readOnly: false,
                    enabled: state.when(
                      initial: () => false,
                      codeSent: () => true,
                      authenticated: () => false,
                      error: (f) => f.when(
                          offline: () => true,
                          invalidCodeFailure: () => true,
                          unautherizedFailure: () => false),
                      loading: () => false,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofillHints: const [AutofillHints.oneTimeCode],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      label: const Text("Code"),
                      prefixIcon: const Icon(Icons.lock_rounded),
                    ),
                    maxLength: 6,
                    onTapOutside: unfocus,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screen.width,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white),
                      onPressed: state.when(
                        initial: () => () => context.read<AuthBloc>().add(
                            AuthEvent.requestEmailAuth(
                                emailController.text.trim().toLowerCase())),
                        codeSent: () => (() => context.read<AuthBloc>().add(
                            AuthEvent.verifyCode(
                                emailController.text.trim().toLowerCase(),
                                codeController.text))),
                        error: (f) => f.when(
                          offline: () => () => (codeController.text.isEmpty)
                              ? AuthEvent.requestEmailAuth(
                                  emailController.text.trim().toLowerCase(),
                                )
                              : context.read<AuthBloc>().add(
                                  AuthEvent.verifyCode(
                                      emailController.text.trim().toLowerCase(),
                                      codeController.text)),
                          invalidCodeFailure: () => () => context
                              .read<AuthBloc>()
                              .add(AuthEvent.verifyCode(
                                  emailController.text.trim().toLowerCase(),
                                  codeController.text)),
                          unautherizedFailure: () => null,
                        ),
                        authenticated: () => null,
                        loading: () => null,
                      ),
                      icon: SizedBox.square(
                        dimension: 15,
                        child: state.maybeWhen(
                            loading: () => const CircularProgressIndicator(
                                strokeWidth: 2.0),
                            orElse: () => null),
                      ),
                      label: Text(
                        locale.signin,
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
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

  void unfocus(PointerDownEvent event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}
