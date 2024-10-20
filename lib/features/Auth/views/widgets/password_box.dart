import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';

class PasswordBox extends StatefulWidget {
  const PasswordBox({super.key, required this.onConfirm});

  final void Function(String) onConfirm;

  @override
  State<PasswordBox> createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  // final controller = PageController();
  final duration = const Duration(milliseconds: 500);
  final curve = Curves.easeInOutExpo;

  final _formKey = GlobalKey<FormState>();

  final passCtrl = TextEditingController();
  final secondCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BackgroundCard(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text("Enter New Password:"),
                TextFormField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    label: Text("New Password"),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please fill out this field";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: secondCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_reset_sharp),
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    label: Text("Confirm Password"),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please fill out this field";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (passCtrl.text == secondCtrl.text) {
                widget.onConfirm(passCtrl.text);
                // Navigator.pop(context);
                return;
              }
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         actions: [
              //           TextButton(
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //             child: Text("OK"),
              //           ),
              //         ],
              //         title: Text("Error..."),
              //         content: Text("Passwords do not match!"),
              //       ).build(context);
              //     });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Passwords do not match!"),
                ),
              );
            }
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
