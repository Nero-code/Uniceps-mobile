import 'package:flutter/material.dart';
import 'package:uniceps/Training/views/HomeScreen.dart';

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

class InputTypePlayerInfoScreen extends StatelessWidget {
  InputTypePlayerInfoScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  bool male = true;

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

                  ///  N A M E
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      isDense: true,
                    ),
                  ),

                  ///  P H O N E   N U M B E R
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 10),

                  ///  G E N D E R   A N D   B I R T H D A T E
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderSelectBox(
                        onSelect: (selected) {},
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text("BirthDate"),
                            isDense: true,
                          ),
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
                  ),

                  ///  W E I G H T
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Weight",
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
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

///   A Color-Changeing Widget to represent selection
class GenderSelectBox extends StatefulWidget {
  GenderSelectBox({super.key, this.isMale, required this.onSelect});

  bool? isMale;
  void Function(bool selected) onSelect;

  @override
  State<GenderSelectBox> createState() => _GenderSelectBoxState();
}

class _GenderSelectBoxState extends State<GenderSelectBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: widget.isMale ?? false ? 3 : 0,
            borderRadius: BorderRadius.circular(10),
            color: widget.isMale ?? false
                ? Colors.purple
                : Color.fromARGB(255, 226, 226, 226),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (widget.isMale != null && widget.isMale == true) return;
                widget.isMale = !(widget.isMale ?? false);
                setState(() {});
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Center(child: Text("M")),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Material(
            elevation: widget.isMale ?? true ? 0 : 3,
            borderRadius: BorderRadius.circular(10),
            color: widget.isMale ?? true
                ? const Color.fromARGB(255, 226, 226, 226)
                : Colors.purple,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (widget.isMale != null && widget.isMale == false) return;
                widget.isMale = !(widget.isMale ?? true);
                setState(() {});
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Center(child: Text("F")),
              ),
            ),
          ),
        ],
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
