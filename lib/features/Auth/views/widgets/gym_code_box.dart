import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/screens/Player_info_screen.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

class GymCodeBox extends StatelessWidget {
  GymCodeBox({super.key, required this.onPressed});

  final codeCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BackgroundCard(
        child: Column(children: [
          Text("Please type in the code we sent to your address"),

          ///   G Y M   C O D E
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the code the Gym gave you';
                  }
                  return null;
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
          onPressed: onPressed,
          child: Text("OK"),
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => PlayerInfoScreen(isEdit: true),
                ),
              );
            },
            child: Text("SKIP >"),
          ),
        ),
      ),
    ]);
  }
}
