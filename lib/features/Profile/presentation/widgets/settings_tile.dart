import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isRtl,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        elevation: 3,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
