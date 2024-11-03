import 'package:flutter/material.dart';

class TrainingGroup extends StatelessWidget {
  const TrainingGroup({
    super.key,
    this.isSelected = false,
    this.isToday = false,
    required this.onPressed,
    // required this.image,
    required this.name,
  });

  final VoidCallback onPressed;
  final String name;
  final bool isSelected;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.3,
      width: 100,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.white,
        // border: Border.all(
        //   width: 2,
        //   color: isSelected
        //       ? Theme.of(context).colorScheme.primary
        //       : Theme.of(context).colorScheme.background,
        // ),
        elevation: 1.5,
        color:
            isSelected ? Theme.of(context).colorScheme.primary : Colors.white,

        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black54),
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
}
