import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ContentLangDialog extends StatelessWidget {
  const ContentLangDialog({super.key, required this.onLangChanged});

  final void Function(String code) onLangChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // final contentLanguage = sl<LanguageCacheHelper>().getExercisesLibContentLanguage();
    final contentLanguage = context.read<AppConfigCubit>().state.config.exerciseLibLanguage.languageCode;

    return AlertDialog(
      title: Text(l10n.changeExercisesLang),
      content: RadioGroup(
        groupValue: contentLanguage,
        onChanged: (value) async {
          // final hasChanged = await context.read<ExerciseLibCubit>().changeLibLanguage(value!);
          // sl<LanguageCacheHelper>().saveExercisesLibContentLanguage(value);
          Navigator.pop(context);
          onLangChanged(value!);
        },
        child: Column(
          mainAxisSize: .min,
          children: [for (var i in Lang.values) RadioListTile(value: i.code, title: Text(i.name))],
        ),
      ),
    );
  }
}
