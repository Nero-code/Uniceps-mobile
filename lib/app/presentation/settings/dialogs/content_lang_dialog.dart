import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class ContentLangDialog extends StatelessWidget {
  const ContentLangDialog({super.key, required this.onLangChanged, required this.title, required this.langCode});

  final String title, langCode;

  final void Function(String code) onLangChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: RadioGroup(
        groupValue: langCode,
        onChanged: (value) async {
          Navigator.pop(context);
          onLangChanged(value!);
        },
        child: Column(
          mainAxisSize: .min,
          children: [for (var i in Lang.values) RadioListTile(value: i.code, title: Text(i.name))],
        ),
      ),
    );
  }
}
