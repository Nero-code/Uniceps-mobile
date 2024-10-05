import 'package:flutter/material.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

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
      padding: const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isSelected
                  ? secondaryBlue.withAlpha(150)
                  : Colors.grey.shade300,
              // color: Color(0xFFCCCCCC),
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: [
              // BoxShadow(
              //   offset: const Offset(0.0, 2.0),
              //   color: Colors.grey.shade400,
              //   blurRadius: 5,
              //   spreadRadius: 0.5,
              // ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => onChanged(true),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
