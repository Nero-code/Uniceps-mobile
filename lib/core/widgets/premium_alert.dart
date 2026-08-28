import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PremiumAlert extends StatelessWidget {
  const PremiumAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final unauthenticated = context.watch<AccountCubit>().state.maybeWhen(orElse: () => true, hasAccount: (_) => false);
    return AlertDialog(
      title: Center(
        child: Image(
          image: const AssetImage(IMG_PREMIUM),
          color: Colors.amber,
          width: MediaQuery.sizeOf(context).width * .2,
          height: MediaQuery.sizeOf(context).width * .2,
        ),
      ),
      content: Text(locale.upgradeAlert, textAlign: TextAlign.center),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.white),
            onPressed: () {
              if (unauthenticated) {
                Navigator.pushReplacementNamed(context, AppRoutes.auth);
                return;
              }
              Navigator.pushReplacementNamed(context, AppRoutes.plans);
            },
            child: Text(locale.upgrade),
          ),
        ),
      ],
    );
  }
}
