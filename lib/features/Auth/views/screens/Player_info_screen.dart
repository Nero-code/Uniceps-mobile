import 'package:flutter/material.dart';
import 'package:uniceps/features/Auth/views/widgets/background_card.dart';
import 'package:uniceps/features/Auth/views/widgets/gender_selection_widget.dart';
import 'package:uniceps/features/Training/views/Screens/home_screen.dart';

////////////////////////////////////////////////////////////////////////////////
///
///   This Page Either presents player info as text after he chosed the gym,
///   OR, Displays TextInputFields for the player to write his/her info...
///
////////////////////////////////////////////////////////////////////////////////

class PlayerInfoScreen extends StatelessWidget {
  const PlayerInfoScreen({super.key, required this.isEdit});

  final bool isEdit; // the switch between edit and display modes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isEdit ? InputTypePlayerInfoScreen() : PLayerInfoDisplay(),
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                        // gradient: RadialGradient(
                        //   colors: [
                        //     Color.fromARGB(0, 140, 0, 255),
                        //     Color.fromARGB(82, 38, 0, 87),
                        //     Colors.purple,
                        //   ],
                        //   stops: [0.6, 0.8, 0.9],
                        //   radius: 1.5,
                        //   center: Alignment.lerp(
                        //           Alignment.center, Alignment.bottomRight, 0.7)
                        //       as Alignment,
                        // ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  BackgroundCard(
                    child: Column(
                      children: [
                        ///  N A M E
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name...";
                            }
                            return null;
                          },
                        ),

                        ///  P H O N E   N U M B E R
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "error";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),

                        ///  G E N D E R   A N D   B I R T H D A T E
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GenderSelectBox(
                              onSelect: (selected) => male = selected,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: Text("Birth Year"),
                                  isDense: true,
                                ),
                                maxLength: 4,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please put a valid year";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),

                        ///  H E I G H T
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Height",
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please put a valid year";
                            }
                            return null;
                          },
                        ),

                        ///  W E I G H T
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Weight",
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please put a valid year";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }
                      },
                      child: Text("Save"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("TrioVerse"),
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
  const PLayerInfoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Full Name: Flan al 3lani"),
          Text("Phone No: 0987654321"),
          Text("Gender: M/F"),
          Text("BirthDate: 1990"),
          Text("Height: 180 cm"),
          Text("Weight: 90 Kg"),
        ],
      ),
    );
  }
}
