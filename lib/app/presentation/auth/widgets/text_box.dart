import 'package:flutter/material.dart';

enum InputType {
  email,
  phone,
  text,
}

class TextBox extends StatelessWidget {
  const TextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
