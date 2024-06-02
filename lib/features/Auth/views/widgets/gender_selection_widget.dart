import 'package:flutter/material.dart';

///   A Color-Changeing Widget to represent selection
class GenderSelectBox extends StatefulWidget {
  const GenderSelectBox({super.key, required this.onSelect});

  final void Function(bool? selected) onSelect;

  @override
  State<GenderSelectBox> createState() => _GenderSelectBoxState();
}

class _GenderSelectBoxState extends State<GenderSelectBox> {
  bool? isMale;
  final background = Color.fromARGB(255, 235, 235, 235);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          Text("Gender"),
          SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: isMale ?? false ? 3 : 0,
                borderRadius: BorderRadius.circular(10),
                color: isMale ?? false
                    ? Theme.of(context).colorScheme.primary
                    : background,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (isMale != null && isMale == true) return;
                    isMale = !(isMale ?? false);
                    setState(() {
                      widget.onSelect(isMale);
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: Center(
                        child: Icon(
                      Icons.male_rounded,
                      color: isMale ?? false ? Colors.white : Colors.black,
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Material(
                elevation: isMale ?? true ? 0 : 3,
                borderRadius: BorderRadius.circular(10),
                color: isMale ?? true ? background : Colors.pink,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (isMale != null && isMale == false) return;
                    isMale = !(isMale ?? true);
                    setState(() {
                      widget.onSelect(isMale);
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: Center(
                        child: Icon(
                      Icons.female_rounded,
                      color: isMale ?? true ? Colors.black : Colors.white,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
