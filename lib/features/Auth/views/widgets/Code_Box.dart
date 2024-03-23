import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/screens/Player_info_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

////////////////////////////////////////////////////////////////////////////////
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
        BackgroundCard(
          child: Column(children: [
            Text("Please type in the code we sent to your address"),

            ///   G Y M   C O D E
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: CodeBox._codeFormKey,
                child: TextFormField(
                  controller: codeCtrl,
                  maxLength: 6,
                  onChanged: (value) {
                    print(value);
                    if (value.contains(RegExp(r"[^$0-9.]"))) {
                      codeCtrl.text = codeCtrl.value.text
                          .substring(0, codeCtrl.value.text.length - 1);
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Code"),
                  ),
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
      ],
    );
  }
}
