import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CapAboutScreen extends StatelessWidget {
  const CapAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: const AssetImage(CaptainImages.about),
                  width: screen.width * .75,
                ),
                const SizedBox(height: 40),
                Text(locale.captainUniAboutContent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
