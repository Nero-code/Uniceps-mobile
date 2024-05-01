import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

class GymCodeBox extends StatefulWidget {
  const GymCodeBox({super.key, required this.onPressed, required this.onSkip});

  final void Function(String) onPressed;
  final VoidCallback onSkip;

  @override
  State<GymCodeBox> createState() => _GymCodeBoxState();
}

class _GymCodeBoxState extends State<GymCodeBox> {
  final codeCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackgroundCard(
          child: Column(
            children: [
              Text("Please type in the code the Gym Gave you:"),
              SizedBox(height: 10),

              ///   G Y M   C O D E
              Form(
                key: formKey,
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
                      return 'Please enter the code the Gym gave you';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Code"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.onPressed(codeCtrl.text);
              }
            },
            child: Text("OK"),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: widget.onSkip,
              child: Text("SKIP >"),
            ),
          ),
        ),
      ],
    );
  }
}
