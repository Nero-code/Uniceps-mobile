import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class LangAlertDialog extends StatelessWidget {
  const LangAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final languageCode = context.read<AppConfigCubit>().state.config.appLanguage.languageCode;

    return AlertDialog(
      title: Text(locale.chooseLang),
      content: RadioGroup(
        groupValue: languageCode,
        onChanged: (newVal) {
          context.read<AppConfigCubit>().changeAppLanguageTo(newVal!);
          Navigator.pop(context);
        },

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [for (var i in Lang.values) RadioListTile(title: Text(i.name), value: i.code)],
        ),
      ),
    ).build(context);
  }
}
