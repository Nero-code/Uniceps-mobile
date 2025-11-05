import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class PracticeDayItem extends StatelessWidget {
  const PracticeDayItem({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onSelect,
  });

  final RoutineDay day;
  final bool isSelected;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
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
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onSelect,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day.name,
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
