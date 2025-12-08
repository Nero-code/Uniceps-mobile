import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';

class RoutineImportProgressDialog extends StatelessWidget {
  const RoutineImportProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocBuilder<RoutinesWithHeatBloc, RoutinesWithHeatState>(
      builder: (context, state) {
        return state.maybeWhen(
            importing: (result) => AlertDialog(
                  icon: const Icon(
                    Icons.download,
                    size: 50,
                  ),
                  title: Text(locale.importRoutine),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProgressWidget(
                        percent: result.progress,
                        backgroundColor: result.stage == Stage.error ? Colors.red.shade200 : Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(sectionContentOf(result.stage, locale)),
                      if (result.stage == Stage.error)
                        Text(
                          result.error!.when(
                            fOffline: () => locale.errNoInternet,
                            noFileSelected: () => locale.noFileSelected,
                            unsupportedVersion: () => locale.unsupportedVersion,
                            parserMismatch: () => locale.parserMismatch,
                            corruptedFile: () => locale.corruptedFile,
                          ),
                          style: const TextStyle(color: Colors.red, fontSize: 11),
                        ),
                    ],
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    if (result.stage == Stage.error)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade300, foregroundColor: Colors.white),
                        onPressed: () {
                          context.read<RoutinesWithHeatBloc>().add(const RoutinesWithHeatEvent.getRoutines());
                          Navigator.pop(context);
                        },
                        child: Text(locale.cancel),
                      ),
                    if (result.stage == Stage.done)
                      ElevatedButton(
                        onPressed: () {
                          context.read<RoutinesWithHeatBloc>().add(const RoutinesWithHeatEvent.getRoutines());
                          Navigator.pop(context);
                        },
                        child: Text(locale.ok),
                      ),
                  ],
                ),
            orElse: () => const SizedBox());
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
