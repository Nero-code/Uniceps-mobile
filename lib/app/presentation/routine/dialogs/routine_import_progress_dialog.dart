import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/l10n/app_localizations.dart';

import '../../../../core/errors/failure.dart';

class RoutineImportProgressDialog extends StatelessWidget {
  const RoutineImportProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<RoutinesWithHeatBloc, RoutinesWithHeatState>(
      builder: (context, state) {
        return state.maybeWhen(
          importing: (result) => Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            backgroundColor: colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: (result.stage == Stage.error ? Colors.red : colorScheme.primary).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      result.stage == Stage.error ? Icons.error_outline_rounded : Icons.downloading_rounded,
                      color: result.stage == Stage.error ? Colors.red : colorScheme.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(locale.importRoutine, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  ProgressWidget(
                    title: Text(
                      sectionContentOf(result.stage, locale),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    percent: result.progress,
                    progressBackground: result.stage == Stage.error
                        ? Colors.red.withValues(alpha: 0.2)
                        : colorScheme.surfaceContainerHighest,
                  ),
                  if (result.stage == Stage.error && result.error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      result.error!.when(
                        fOffline: () => locale.errNoInternet,
                        noFileSelected: () => locale.noFileSelected,
                        unsupportedVersion: () => locale.unsupportedVersion,
                        parserMismatch: () => locale.parserMismatch,
                        corruptedFile: () => locale.corruptedFile,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                  const SizedBox(height: 32),
                  if (result.stage == Stage.error || result.stage == Stage.done)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: result.stage == Stage.error ? Colors.red : colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          context.read<RoutinesWithHeatBloc>().add(const RoutinesWithHeatEvent.getRoutines());
                          Navigator.pop(context);
                        },
                        child: Text(result.stage == Stage.error ? locale.cancel : locale.ok),
                      ),
                    ),
                ],
              ),
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  String sectionContentOf(Stage stage, AppLocalizations locale) {
    switch (stage) {
      case Stage.start:
        return locale.startingImport;
      case Stage.images:
        return locale.gettingImagesImport;
      case Stage.days:
        return locale.addingDaysImport;
      case Stage.items:
        return locale.addingItemsImport;
      case Stage.sets:
        return locale.addingSetsImport;
      case Stage.done:
        return locale.done;
      case Stage.error:
        return locale.error;
      default:
        return '...';
    }
  }
}
