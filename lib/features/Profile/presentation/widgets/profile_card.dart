import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.profile});

  final Player profile;

  final style = const TextStyle(color: Colors.white);
  // final style2 = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Container(
      // margin: const EdgeInsets.all(15),
      // padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     // Color.fromARGB(255, 170, 29, 76),
        //     // Color.fromARGB(255, 139, 34, 158),

        //     // Theme.of(context).colorScheme.primary,

        //     Theme.of(context).colorScheme.onBackground,

        //     Theme.of(context).colorScheme.onBackground,
        //     // Theme.of(context).colorScheme.secondary,
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   // stops: [
        //   //   0.5,
        //   //   0.5,
        //   // ],
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     // color: Theme.of(context).colorScheme.onBackground,
        //     color: const Color.fromARGB(146, 0, 0, 0),
        //     offset: Offset(
        //       0,
        //       2,
        //     ),
        //     blurRadius: 3,
        //   ),
        // ],
        borderRadius: BorderRadius.circular(15),
      ),
      // child: Row(
      //   // mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     DefaultTextStyle(
      //       style: style,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(local!.pName),
      //           Text(local.birthDate),
      //           Text(local.phoneNum),
      //           Text(local.gender),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(width: 20),
      //     DefaultTextStyle(
      //       style: style,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(profile.name),
      //           Text(profile.birthDate),
      //           Text(profile.phoneNum),
      //           Text(profile.gender == Gender.male ? local.male : local.female),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromARGB(255, 170, 29, 76),
                  // Color.fromARGB(255, 139, 34, 158),

                  Theme.of(context).colorScheme.primary,

                  // Theme.of(context).colorScheme.onBackground,

                  // Theme.of(context).colorScheme.onBackground,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [
                //   0.5,
                //   0.5,
                // ],
              ),
              // boxShadow: [
              //   BoxShadow(
              //     // color: Theme.of(context).colorScheme.onBackground,
              //     color: const Color.fromARGB(146, 0, 0, 0),
              //     offset: Offset(
              //       0,
              //       2,
              //     ),
              //     blurRadius: 3,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: DefaultTextStyle(
              style: style,
              child: Table(
                children: [
                  TableRow(
                    children: [Text(local!.pName), Text(profile.name)],
                  ),
                  TableRow(
                    children: [Text(local.birthDate), Text(profile.birthDate)],
                  ),
                  TableRow(
                    children: [Text(local.phoneNum), Text(profile.phoneNum)],
                  ),
                  TableRow(
                    children: [
                      Text(local.gender),
                      Text(profile.gender == Gender.male
                          ? local.male
                          : local.female)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
