import 'package:flutter/material.dart';

class DayTabWidget extends StatelessWidget {
  const DayTabWidget({
    required this.globalKey,
    required this.tab,
    required this.onTap,
    required this.onLongPress,
    required this.isSelected,
  }) : super(key: globalKey);

  final String tab;
  final void Function() onTap;
  final void Function(GlobalKey widgetKey) onLongPress;
  final bool isSelected;

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: onTap,
          onLongPress: () => onLongPress(globalKey),
          child: AnimatedContainer(
            // alignment: Alignment.center,
            duration: Durations.medium4,
            padding: const EdgeInsets.all(8.0),
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isSelected ? Colors.blue.shade50 : null,
            ),
            child: Text(
              tab,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ),
      ),
    );
  }
}
