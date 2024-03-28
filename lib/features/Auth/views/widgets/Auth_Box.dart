import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

////////////////////////////////////////////////////////////////////////////////
///   Animated Switcher's First card.
///   This box is simply for the email and password to Authenticate the player
////////////////////////////////////////////////////////////////////////////////

class AuthBox extends StatefulWidget {
  const AuthBox({super.key, this.onPressed});

  final VoidCallback? onPressed;

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
        ///   B A C K G R O U N D   C A R D
        BackgroundCard(
          child: Form(
            key: _authFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///   T E X T F I E L D   E M A I L
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
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

                ///   T E X T F I E L D   P A S S W O R D
                TextFormField(
                  controller: passwCtrl,
                  decoration: InputDecoration(
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
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTapUp: (_) {
                        Navigator.of(context).pushNamed(ROUTE_FORGOT_PASSWORD);
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ElevatedButton(
            onPressed: () {
              if (_authFormkey.currentState!.validate()) {
                widget.onPressed;
              }
            },
            child: const Text("Sign in"),
          ),
        ),
      ],
    );
  }
}
