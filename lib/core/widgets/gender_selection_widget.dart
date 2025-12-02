import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///   A Color-Changeing Widget to represent selection
class GenderSelectBox extends StatefulWidget {
  const GenderSelectBox({super.key, required this.onSelect, this.initialValue});

  final void Function(bool selected) onSelect;
  final bool? initialValue;

  @override
  State<GenderSelectBox> createState() =>
      // ignore: no_logic_in_create_state
      _GenderSelectBoxState(initialValue);
}

class _GenderSelectBoxState extends State<GenderSelectBox> {
  bool? isMale;
  final background = const Color.fromARGB(255, 235, 235, 235);

  _GenderSelectBoxState(this.isMale);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.gender),
          const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: isMale ?? false ? 3 : 0,
                borderRadius: BorderRadius.circular(10),
                color: isMale ?? false ? Theme.of(context).colorScheme.primary : background,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (isMale != null && isMale == true) return;
                    isMale = !(isMale ?? false);
                    setState(() {
                      widget.onSelect(isMale!);
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
                      widget.onSelect(isMale!);
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
