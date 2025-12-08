import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(locale.logoutAlert),
      content: Text(locale.logoutAlertContents),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(locale.cancel),
        ),
        TextButton(
          onPressed: () {
            context.read<AccountCubit>().logout();
            Navigator.pop(context);
          },
          child: Text(
            locale.ok,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    ).build(context);
  }
}
