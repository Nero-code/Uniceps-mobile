import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/screens/auth_page/auth/widgets/background_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CodeBox extends StatefulWidget {
  const CodeBox({super.key, required this.onPressed});

  final void Function(String) onPressed;

  @override
  State<CodeBox> createState() => _CodeBoxState();
}

class _CodeBoxState extends State<CodeBox> {
  final codeCtrl = TextEditingController();

  final _codeFormKey = GlobalKey<FormState>();

  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Column(
      children: [
        BackgroundCard(
          child: Column(children: [
            Text(AppLocalizations.of(context)!.verify),
            //
            //   C O D E
            //
            const SizedBox(height: 10),
            Form(
              key: _codeFormKey,
              child: TextFormField(
                controller: codeCtrl,
                focusNode: node,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onFieldSubmitted: (value) {
                  if (value.isEmpty) return;
                  widget.onPressed(value);
                },
                onChanged: (value) {
                  if (value.contains(RegExp(r"[^0-9]"))) {
                    codeCtrl.text = codeCtrl.value.text
                        .substring(0, codeCtrl.value.text.length - 1);
                  }
                },
                onTapOutside: (event) => node.unfocus(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers_rounded),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: const OutlineInputBorder(),
                  label: Text(local.code),
                  hintText: 'xxx xxx',
                ),
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_codeFormKey.currentState!.validate()) {
                widget.onPressed(codeCtrl.text.trim());
              }
            },
            child: Text(local.verifyCode),
          ),
        ),
      ],
    );
  }
}
