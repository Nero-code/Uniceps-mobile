import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnicepsPremium extends StatelessWidget {
  const UnicepsPremium({super.key, required this.membership});

  final Membership membership;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
          ),
          border: Border.all(
            width: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.grey.shade300,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        width: screenSize.width,
        height: screenSize.width * .4,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(IMG_PREMIUM),
                  // color: Colors.amber.shade700,
                  color: Colors.white,
                  width: 35,
                ),
                Image(
                  image: const AssetImage(APP_LOGO_LIGHT),
                  color: Colors.white,
                  width: screenSize.width * .22,
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Premium',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${intl.NumberFormat.decimalPattern().format(membership.price)}',
                        style: const TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '/ ${membership.daysLeft} ${locale.day}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    intl.DateFormat('d/M/y').format(membership.startDate),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 15),
                  Text(
                    intl.DateFormat('d/M/y').format(membership.endDate),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      membership.endDate.difference(DateTime.now()).inDays.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(5),
                    color: membership.aboutToEnd ? Colors.grey.shade200 : Colors.white30,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: membership.aboutToEnd ? () {} : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          membership.aboutToEnd ? locale.buyNow : locale.active,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: membership.aboutToEnd ? Colors.black : Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
