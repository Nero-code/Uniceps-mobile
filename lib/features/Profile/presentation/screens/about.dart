import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/constants/constants.dart';

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
    final normalStyle = TextStyle();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Image(
                    image: const AssetImage("images/logo/Logo.png"),
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  APP_NAME,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              Text(
                local.versionInfo,
                style: normalStyle,
              ),
              Text(
                local.versionDate,
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
                "Devs",
                style: normalStyle,
              ),
              const SizedBox(height: 15),
              //
              //   S U P P O R T
              //
              Text(
                local.support,
                style: headingStyle,
              ),
              Text(
                local.supportPage,
                style: normalStyle,
              ),
              Text(
                local.faqs,
                style: normalStyle,
              ),
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
      ),
    );
  }
}
