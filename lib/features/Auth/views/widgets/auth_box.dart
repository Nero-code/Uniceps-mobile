import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

////////////////////////////////////////////////////////////////////////////////
///   Animated Switcher's First card.
///   This box is simply for the email and password to Authenticate the player
////////////////////////////////////////////////////////////////////////////////

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.background,
                Color.fromARGB(255, 92, 168, 209),
              ],
            ),
          ),
          // child: Text("Welcome",
          //     style: Theme.of(context)
          //         .textTheme
          //         .headlineSmall
          //         ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          child: Center(
            child: Icon(
              Icons.mail_lock_rounded,
              size: 90,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),

        ///   B A C K G R O U N D   C A R D
        BackgroundCard(
          // back: Color.fromARGB(87, 255, 255, 255),
          child: Form(
            key: _authFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///   T E X T F I E L D   E M A I L
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    hintText: "john.doe@gmail.com",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your E-mail Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                ///   T E X T F I E L D   P A S S W O R D
                if (widget.isLogin)
                  TextFormField(
                    controller: passwCtrl,
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "123456789",
                      suffixIcon: IconButton(
                        iconSize: 25,
                        splashRadius: 10,
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    obscureText: obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),

                ///   F O R G O T   P A S S W O R D
                if (widget.isLogin)
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTapUp: (_) {
                          Navigator.of(context)
                              .pushNamed(ROUTE_FORGOT_PASSWORD);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),

        ///    S I G N I N   B U T T O N
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ElevatedButton(
            onPressed: () {
              if (_authFormkey.currentState!.validate()) {
                if (widget.isLogin) {
                  widget.login(emailCtrl.text, passwCtrl.text);
                } else {
                  widget.signin(emailCtrl.text);
                }
              }
            },
            child: Text(widget.isLogin ? "Login" : "Sign in"),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.amber,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            SizedBox(
              child: Material(
                color: const Color.fromARGB(78, 158, 158, 158),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: widget.onChangeType,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text(
                      widget.isLogin
                          ? "don't have an account?"
                          : "already have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextButton(
            onPressed: () {
              if (_authFormkey.currentState!.validate()) {
                if (widget.isLogin) {
                  widget.login(emailCtrl.text, passwCtrl.text);
                } else {
                  widget.signin(emailCtrl.text);
                }
              }
            },
            child: Text(widget.isLogin ? "SignIn" : "Login"),
          ),
        ),
      ],
    );
  }
}
