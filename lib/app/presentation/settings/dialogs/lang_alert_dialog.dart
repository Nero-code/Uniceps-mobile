import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangAlertDialog extends StatelessWidget {
  const LangAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final languageCode = context.read<LocaleCubit>().state.locale.languageCode;
    return AlertDialog(
      title: Text(locale.chooseLang),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i in Lang.values)
            RadioListTile(
                title: Text(i == Lang.en ? "English" : "العربية"),
                value: languageCode == i.name,
                groupValue: true,
                onChanged: (newVal) {
                  context.read<LocaleCubit>().changeLanguage(i.name == "en" ? "en" : "ar");
                  Navigator.pop(context);
                }),
        ],
      ),
    ).build(context);
  }
}
