import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///    Animated Switcher's First card.
///
///    This box is simply for the email and password to Authenticate the player
///
///

class AuthBox extends StatefulWidget {
  const AuthBox(
      {super.key,
      required this.login,
      required this.signin,
      required this.onForgot,
      required this.onChangeType,
      required this.isLogin});

  final void Function(String email, String pass) login;
  final void Function(String email) signin;
  final VoidCallback onForgot, onChangeType;
  final bool isLogin;

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  final emailCtrl = TextEditingController();
  final passwCtrl = TextEditingController();

  final _authFormkey = GlobalKey<FormState>();

  bool obscureText = true;

  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///   B A C K G R O U N D   C A R D
        BackgroundCard(
          back: Colors.transparent,
          child: Form(
            key: _authFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///   T E X T F I E L D   E M A I L
                TextFormField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  focusNode: node,
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    prefixIcon:
                        Icon(Icons.email_rounded, color: Colors.grey.shade600),
                    // isDense: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    labelText: local.email,
                    hintText: "john.doe@gmail.com",
                  ),
                  onTapOutside: (event) => node.unfocus(),
                  onFieldSubmitted: (value) {
                    if (!_authFormkey.currentState!.validate()) return;
                    widget.signin(emailCtrl.text.trim());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return local.emailError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // ///   T E X T F I E L D   P A S S W O R D
                // if (widget.isLogin)
                //   TextFormField(
                //     controller: passwCtrl,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey.shade400),
                //       ),
                //       contentPadding: EdgeInsets.all(10),
                //       prefixIcon: Icon(Icons.lock, color: Colors.grey.shade600),
                //       // isDense: true,
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.blue,
                //         ),
                //       ),
                //       labelText: "Password",
                //       hintText: "123456789",
                //       suffixIcon: IconButton(
                //         iconSize: 25,
                //         splashRadius: 10,
                //         onPressed: () {
                //           setState(() {
                //             obscureText = !obscureText;
                //           });
                //         },
                //         icon: Icon(obscureText
                //             ? Icons.visibility_off
                //             : Icons.visibility),
                //       ),
                //     ),
                //     obscureText: obscureText,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter a password";
                //       }
                //       return null;
                //     },
                //   ),
                // ///   F O R G O T   P A S S W O R D
                // if (widget.isLogin)
                //   Material(
                //     color: Colors.transparent,
                //     child: Padding(
                //       padding: const EdgeInsets.only(top: 8.0),
                //       child: InkWell(
                //         splashColor: Colors.grey.shade400,
                //         borderRadius: BorderRadius.circular(15),
                //         onTapUp: (_) {
                //           Navigator.of(context)
                //               .pushNamed(ROUTE_FORGOT_PASSWORD);
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(5.0),
                //           child: Text(
                //             "Forgot password?",
                //             style: TextStyle(
                //               color: Colors.blue,
                //               fontSize: 10,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ),

        ///    S I G N I N   B U T T O N
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            style: ButtonStyle(
              // shape: MaterialStatePropertyAll<OutlinedBorder>(
              //     BeveledRectangleBorder()),
              backgroundColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              foregroundColor:
                  MaterialStatePropertyAll<Color>(Colors.grey.shade300),
            ),
            onLongPress: null,
            onPressed: () {
              if (_authFormkey.currentState!.validate()) {
                if (widget.isLogin) {
                  widget.login(emailCtrl.text, passwCtrl.text);
                } else {
                  widget.signin(emailCtrl.text.trim());
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              // child: Text(widget.isLogin ? "Login" : "Sign in"),
              child: Text(
                local.signin,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       color: Colors.grey,
        //       height: 1,
        //       width: MediaQuery.of(context).size.width * 0.2,
        //     ),
        //     SizedBox(
        //       child: Material(
        //         color: const Color.fromARGB(78, 158, 158, 158),
        //         borderRadius: BorderRadius.circular(10),
        //         child: InkWell(
        //           borderRadius: BorderRadius.circular(10),
        //           onTap: widget.onChangeType,
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 8.0, vertical: 3.0),
        //             child: Text(
        //               widget.isLogin
        //                   ? "don't have an account?"
        //                   : "already have an account?",
        //               style: TextStyle(color: Colors.black, fontSize: 10),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       color: Colors.grey,
        //       height: 1,
        //       width: MediaQuery.of(context).size.width * 0.2,
        //     ),
        //   ],
        // ),
        // Container(
        //   width: double.infinity,
        //   margin: const EdgeInsets.only(top: 10),
        //   padding: const EdgeInsets.symmetric(horizontal: 15),
        //   child: TextButton(
        //     onPressed: () {
        //       if (_authFormkey.currentState!.validate()) {
        //         if (widget.isLogin) {
        //           widget.login(emailCtrl.text, passwCtrl.text);
        //         } else {
        //           widget.signin(emailCtrl.text);
        //         }
        //       }
        //     },
        //     child: Text(widget.isLogin ? "SignIn" : "Login"),
        //   ),
        // ),
      ],
    );
  }
}
