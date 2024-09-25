import 'package:flutter/material.dart';

class TrainingDayItem extends StatelessWidget {
  const TrainingDayItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  final String title;
  final bool isSelected;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    // return RadioListTile<bool>.adaptive(
    //   groupValue: true,
    //   value: isSelected,
    //   onChanged: (value) {
    //     if (value != null) {
    //       onChanged(value);
    //     }
    //   },
    //   title: Text(title),
    // );
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: InkWell(
        onTap: () => onChanged(true),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.center,
          color: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
          child: Text(title),
        ),
      ),
    );
  }
}
