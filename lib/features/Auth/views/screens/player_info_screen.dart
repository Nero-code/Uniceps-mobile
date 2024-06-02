import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Auth/views/widgets/gender_selection_widget.dart';

////////////////////////////////////////////////////////////////////////////////
///
///   This Page Either presents player info as text after he chosed the gym,
///   OR, Displays TextInputFields for the player to write his/her info...
///
////////////////////////////////////////////////////////////////////////////////

class PlayerInfoScreen extends StatelessWidget {
  const PlayerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).colorScheme.background,
          statusBarIconBrightness: Brightness.dark),
    );
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final isEdit = args['isEdit'] ?? true;
    return Scaffold(
      body: isEdit
          ? const InputTypePlayerInfoScreen()
          : PLayerInfoDisplay(
              player: args['data'] as Player,
            ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///
///   The following 2 Widgets are just a little refactoring for the page.
///
///   First: INPUT.
///
////////////////////////////////////////////////////////////////////////////////

class InputTypePlayerInfoScreen extends StatefulWidget {
  const InputTypePlayerInfoScreen({super.key});

  @override
  State<InputTypePlayerInfoScreen> createState() =>
      _InputTypePlayerInfoScreenState();
}

class _InputTypePlayerInfoScreenState extends State<InputTypePlayerInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final birthCtl = TextEditingController();

  bool? male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///   A P P   L O G O
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Image(
                          image: AssetImage("images/logo/Logo-dark.png")),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ///  N A M E
                        TextFormField(
                          controller: nameCtl,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),

                        ///  P H O N E   N U M B E R
                        TextFormField(
                          controller: phoneCtl,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            isDense: true,
                          ),
                          maxLength: 10,
                          onChanged: (val) {
                            if (val.contains(RegExp(r"[^0-9]"))) {
                              phoneCtl.text = val.substring(0, val.length - 1);
                            }
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 10) {
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        ///  G E N D E R   A N D   B I R T H D A T E
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GenderSelectBox(
                              onSelect: (selected) => male = selected,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                controller: birthCtl,
                                decoration: InputDecoration(
                                  label: Text("Birth Year"),
                                  isDense: true,
                                ),
                                maxLength: 4,
                                keyboardType: TextInputType.phone,
                                onChanged: (val) {
                                  if (val.contains(RegExp(r"[^0-9]"))) {
                                    birthCtl.text =
                                        val.substring(0, val.length - 1);
                                  }
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 4) {
                                    return "Please enter a valid year";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),

                        ///  H E I G H T
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: "Height (cm)",
                        //     isDense: true,
                        //   ),
                        //   maxLength: 3,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return "please put a valid height";
                        //     }
                        //     return null;
                        //   },
                        // ),

                        ///  W E I G H T
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: "Weight (Kg)",
                        //     isDense: true,
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return "please put a valid Weight";
                        //     }
                        //     return null;
                        //   },
                        // ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (male == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Please select a Gender")));
                            return;
                          }
                          Navigator.pushReplacementNamed(context, ROUTE_HOME);
                        }
                      },
                      child: Text("Save"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("TrioVerse"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///
///   SECOND: Data Display.
///
///   This Screen is supposed to reveal the Player's data to him/her that was
///   provided by the subscribed-to gym...
///
////////////////////////////////////////////////////////////////////////////////

class PLayerInfoDisplay extends StatelessWidget {
  const PLayerInfoDisplay({super.key, required this.player});
  final Player player;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Full Name:  + ${player.name}"),
          Text("Phone No: ${player.phoneNum}"),
          Text("Gender: ${player.gender == Gender.male ? "male" : "female"}"),
          Text("BirthDate: ${player.birthDate}"),
        ],
      ),
    );
  }
}
