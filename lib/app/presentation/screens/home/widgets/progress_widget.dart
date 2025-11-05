import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Stack(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: percent / 100,
                      strokeAlign: -1.0,
                      strokeWidth: 7.0,
                      strokeCap: StrokeCap.round,
                      color: secondaryBlue,
                    ),
                  ),
                  Center(
                    child: Text(
                      "$percent%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(local.gettingRoutine),
          ],
        ),
      ),
    );
  }
}
