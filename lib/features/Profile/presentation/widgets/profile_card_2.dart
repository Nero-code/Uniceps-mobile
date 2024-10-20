import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileCard2 extends StatelessWidget {
  const ProfileCard2({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Icon(
            Icons.account_circle,
            size: MediaQuery.of(context).size.width * 0.3,
            color: Colors.grey.shade400,
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(player.name),
              Text(player.birthDate),
              Text(player.phoneNum),
              Text(player.gender == Gender.male ? local.male : local.female),
            ],
          ),
        ),
      ],
    );
  }
}
