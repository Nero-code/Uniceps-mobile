import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
///   Animated Switcher's First card.
///   This box is simply for the email and password to Authenticate the player
////////////////////////////////////////////////////////////////////////////////

class AuthBox extends StatefulWidget {
  const AuthBox({super.key, this.onPressed});

  final VoidCallback? onPressed;

  static final _authFormkey = GlobalKey<FormState>();

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  final emailCtrl = TextEditingController();
  final passwCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///   B A C K G R O U N D   C A R D
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 238, 238, 238),
          ),
          child: Form(
            key: AuthBox._authFormkey,
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
                    return "Error!";
                  },
                ),

                ///   T E X T F I E L D   P A S S W O R D
                TextFormField(
                  controller: passwCtrl,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "123456789",
                  ),
                  validator: (value) => "Error!",
                ),

                ///   F O R G O T   P A S S W O R D
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTapUp: (_) {},
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
            onPressed: widget.onPressed,
            child: const Text("Sign in"),
          ),
        ),
      ],
    );
  }
}
