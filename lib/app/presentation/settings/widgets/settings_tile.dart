import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconsColor,
    this.backColor = Colors.white54,
    this.onPressed,
  });

  final IconData icon;
  final String title, subtitle;
  final Color iconsColor, backColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        // elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.white,
            // color: Theme.of(context).colorScheme.secondary.withAlpha(10),
            border: Border.all(
              color: const Color(0xFFCCCCCC),
              width: 0.5,
            ),
          ),
          // padding: const EdgeInsets.all(1.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onPressed,
            child: Opacity(
              opacity: onPressed != null ? 1 : .25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey.shade600,
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
      ),
    );
  }
}
