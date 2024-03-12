import 'package:flutter/material.dart';
import 'package:uniceps/Auth/views/Player_info_screen.dart';

////////////////////////////////////////////////////////////////////////////////
///   Animated switcher's second card...
///   This box is used to put the gym code so the player can subscribe to it.
///   it is given from the gym
/// ////////////////////////////////////////////////////////////////////////////

class CodeBox extends StatefulWidget {
  CodeBox({super.key, this.onPressed});

  final VoidCallback? onPressed;
  static final _codeFormKey = GlobalKey<FormState>();

  @override
  State<CodeBox> createState() => _CodeBoxState();
}

class _CodeBoxState extends State<CodeBox> {
  final codeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 226, 226, 226),
          ),
          child: Column(children: [
            Text(
                "Please enter the code your gym gave you in order to sign in..."),

            ///   G Y M   C O D E
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: CodeBox._codeFormKey,
                child: TextFormField(
                  controller: codeCtrl,
                  decoration: InputDecoration(label: Text("Gym Code")),
                ),
              ),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            child: Text("Verify"),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlayerInfoScreen(isEdit: true),
                  ),
                );
              },
              child: Text("SKIP >"),
            ),
          ),
        )
      ],
    );
  }
}
