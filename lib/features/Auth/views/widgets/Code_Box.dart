import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

////////////////////////////////////////////////////////////////////////////////
///   This box is used to put the gym code so the player can subscribe to it.
///   it is given from the gym
/// ////////////////////////////////////////////////////////////////////////////

class CodeBox extends StatefulWidget {
  const CodeBox({super.key, required this.onPressed});

  final void Function(String) onPressed;

  @override
  State<CodeBox> createState() => _CodeBoxState();
}

class _CodeBoxState extends State<CodeBox> {
  final codeCtrl = TextEditingController();

  final _codeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackgroundCard(
          child: Column(children: [
            Text("Please type in the code we sent to your Email:"),

            ///   C O D E
            const SizedBox(height: 10),
            Form(
              key: _codeFormKey,
              child: TextFormField(
                controller: codeCtrl,
                maxLength: 6,
                onChanged: (value) {
                  print(value);
                  if (value.contains(RegExp(r"[^0-9]"))) {
                    codeCtrl.text = codeCtrl.value.text
                        .substring(0, codeCtrl.value.text.length - 1);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid Code!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers_rounded),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(),
                  label: Text("Code"),
                  hintText: '001122',
                ),
              ),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_codeFormKey.currentState!.validate()) {
                widget.onPressed(codeCtrl.text);
              }
            },
            child: Text("Verify"),
          ),
        ),
      ],
    );
  }
}
