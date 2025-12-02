import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(5.0),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
            child: const Image(
              image: AssetImage(IMG_PREMIUM),
              width: 15,
              height: 15,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(locale.premiumAlertContent),
          )),
          SizedBox(
            height: 30,
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.plans),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                foregroundColor: Colors.amber.shade700,
                side: const BorderSide(color: Colors.amber, width: 1.0),
              ),
              child: Text(
                locale.upgrade,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
