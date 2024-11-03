import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthBox extends StatefulWidget {
  const AuthBox({
    super.key,
    required this.signin,
  });

  final void Function(String email) signin;

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  final emailCtrl = TextEditingController();
  final passwCtrl = TextEditingController();

  final _authFormkey = GlobalKey<FormState>();

  bool obscureText = true;

  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///   B A C K G R O U N D   C A R D
        BackgroundCard(
          back: Colors.transparent,
          child: Form(
            key: _authFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///   T E X T F I E L D   E M A I L
                TextFormField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  focusNode: node,
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    prefixIcon:
                        Icon(Icons.email_rounded, color: Colors.grey.shade600),
                    // isDense: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    labelText: local.email,
                    hintText: "john.doe@gmail.com",
                  ),
                  onTapOutside: (event) => node.unfocus(),
                  onFieldSubmitted: (value) {
                    if (!_authFormkey.currentState!.validate()) return;
                    widget.signin(emailCtrl.text.trim());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return local.emailError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),

        ///    S I G N I N   B U T T O N
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            style: ButtonStyle(
              // shape: MaterialStatePropertyAll<OutlinedBorder>(
              //     BeveledRectangleBorder()),
              backgroundColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              foregroundColor:
                  MaterialStatePropertyAll<Color>(Colors.grey.shade300),
            ),
            onLongPress: null,
            onPressed: () {
              if (_authFormkey.currentState!.validate()) {
                widget.signin(emailCtrl.text.trim());
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                local.signin,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
