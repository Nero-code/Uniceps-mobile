import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final radius = 50.0;

  final codeSent = false;

  String email = '';

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Account"),
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screen.height * 0.25),
                TextFormField(
                  textDirection: TextDirection.ltr,
                  // readOnly: true,
                  enabled: false,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    hintText: "john.doe@gmail.com",
                    label: const Text("Email"),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  onTapOutside: unfocus,
                  validator: (value) {
                    if (value != null) {
                      if (value.contains("@") && value.contains(".com")) {
                        return null;
                      }
                    }
                    return "Please enter a valid email!";
                  },
                  onFieldSubmitted: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 10),
                if (true) // BlocBuilder --> state is CodeSentState
                  TextField(
                    textDirection: TextDirection.ltr,
                    readOnly: false,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofillHints: const [AutofillHints.oneTimeCode],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      label: const Text("Code"),
                      prefixIcon: const Icon(Icons.lock_rounded),
                    ),
                    maxLength: 6,
                    onTapOutside: unfocus,
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screen.width,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white),
                    onPressed: codeSent ? () {} : null,
                    icon: SizedBox.square(
                        dimension: 15,
                        child: !codeSent
                            ? const CircularProgressIndicator(
                                strokeWidth: 2.0,
                              )
                            : null),
                    label: const Text(
                      "Register",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void unfocus(PointerDownEvent event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}
