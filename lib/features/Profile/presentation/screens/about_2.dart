import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen2 extends StatelessWidget {
  const AboutScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  APP_NAME,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  APP_VERSION,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Image(
                  width: 150,
                  height: 150,
                  image: AssetImage("images/logo/Logo.png"),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(URL))) {
                      launchUrl(Uri.parse(URL));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.language),
                      const SizedBox(width: 5.0),
                      Text(AppLocalizations.of(context)!.supportPage),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
