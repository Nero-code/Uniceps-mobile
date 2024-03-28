import 'package:flutter/material.dart';

///   A Color-Changeing Widget to represent selection
class GenderSelectBox extends StatefulWidget {
  const GenderSelectBox({super.key, required this.onSelect});

  final void Function(bool selected) onSelect;

  @override
  State<GenderSelectBox> createState() => _GenderSelectBoxState();
}

class _GenderSelectBoxState extends State<GenderSelectBox> {
  bool? isMale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: isMale ?? false ? 3 : 0,
            borderRadius: BorderRadius.circular(10),
            color: isMale ?? false
                ? Colors.purple
                : Color.fromARGB(255, 226, 226, 226),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (isMale != null && isMale == true) return;
                isMale = !(isMale ?? false);
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
            elevation: isMale ?? true ? 0 : 3,
            borderRadius: BorderRadius.circular(10),
            color: isMale ?? true
                ? const Color.fromARGB(255, 226, 226, 226)
                : Colors.purple,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (isMale != null && isMale == false) return;
                isMale = !(isMale ?? true);
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
