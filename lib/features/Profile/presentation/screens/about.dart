import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final headingStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.secondary,
    );
    const normalStyle = TextStyle(color: Colors.black);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Image(
                        image: const AssetImage("images/logo/Logo.png"),
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      APP_NAME,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  const Divider(),
                  //
                  //   V E R S I O N
                  //
                  Text(
                    local.version,
                    style: headingStyle,
                  ),
                  const Text(
                    APP_VERSION,
                    style: normalStyle,
                  ),
                  const Text(
                    APP_RELEASE_DATE,
                    style: normalStyle,
                  ),
                  const SizedBox(height: 15),
                  //
                  //   D E V E L O P E R S
                  //
                  Text(
                    local.developers,
                    style: headingStyle,
                  ),
                  Text(
                    "TrioVerse",
                    style: normalStyle,
                  ),
                  const SizedBox(height: 15),
                  //
                  //   S U P P O R T
                  //

                  // Text(
                  //   local.support,
                  //   style: headingStyle,
                  // ),

                  // Text(
                  //   local.supportPage,
                  //   style: normalStyle,
                  // ),
                  // Text(
                  //   local.faqs,
                  //   style: normalStyle,
                  // ),
                  const SizedBox(height: 15),
                  //
                  //   P R I V A C Y
                  //
                  Text(
                    local.privacy,
                    style: headingStyle,
                  ),
                  Text(
                    local.privacyPolicy,
                    style: normalStyle,
                  ),
                  Text(
                    local.userAgreement,
                    style: normalStyle,
                  ),
                  Text(
                    local.termsOfUse,
                    style: normalStyle,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      openUrl(context, "https://trio-verse.com");
                    },
                    icon: const Icon(
                      Icons.language,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: .0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openUrl(BuildContext context, String url) async {
    final local = AppLocalizations.of(context)!;
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(local.error),
          ),
        );
      }
    }
  }
}
