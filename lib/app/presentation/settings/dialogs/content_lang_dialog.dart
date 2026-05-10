import 'package:flutter/material.dart';
import 'package:uniceps/app/services/language_cache_helper.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ContentLangDialog extends StatelessWidget {
  const ContentLangDialog({super.key, required this.onLangChanged});

  final void Function(String code) onLangChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final contentLanguage = sl<LanguageCacheHelper>().getExercisesLibContentLanguage();
    return AlertDialog(
      title: const Text('Changing Content Language'),
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
