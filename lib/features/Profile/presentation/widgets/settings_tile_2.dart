import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTile2 extends StatelessWidget {
  const SettingsTile2({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconsColor,
    this.backColor = Colors.white54,
    required this.onPressed,
  });

  final IconData icon;
  final String title, subtitle;
  final Color iconsColor, backColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        // elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.white,
            // color: Theme.of(context).colorScheme.secondary.withAlpha(10),
            border: Border.all(
              color: Color(0xFFCCCCCC),
            ),
          ),
          padding: const EdgeInsets.all(1.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // color:
                      // Theme.of(context).colorScheme.secondary.withAlpha(30),
                      // color: iconsColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      // color: iconsColor,
                      color: Theme.of(context).colorScheme.primary,
                      icon,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  // Text(
                  //   subtitle,
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 10,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
