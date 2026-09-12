import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_create_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_delete_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_import_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_import_progress_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_options_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_set_current_dialog.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_days_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_grid_item.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_with_heat.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/account_limit_alert.dart';
import 'package:uniceps/core/widgets/empty_page.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/widgets/premium_alert.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutinesHeatScreen extends StatefulWidget {
  const RoutinesHeatScreen({super.key});

  @override
  State<RoutinesHeatScreen> createState() => _RoutineHeatScreenState();
}

class _RoutineHeatScreenState extends State<RoutinesHeatScreen> {
  final gridSpacing = 6.0;

  bool isGridView = false;
  int routinesLength = 0;

  void _onRoutineMenu(BuildContext context, dynamic e, AppLocalizations locale) async {
    final canDelete = context.read<SessionBloc>().state.maybeWhen(orElse: () => false, noActiveSession: (_, _) => true);

    final res = await showDialog<Option>(
      context: context,
      builder: (context) => RoutineOptionsDialog(routineName: e.routine.name),
    );

    if (res == null || !context.mounted) return;

    final bloc = context.read<RoutinesWithHeatBloc>();

    switch (res) {
      case Option.edit:
        showDialog(
          context: context,
          builder: (_) => RoutineNameDialog(
            isCreate: false,
            initialName: e.routine.name,
            onSubmit: (name) {
              if (name == e.routine.name) return;
              bloc.add(RoutinesWithHeatEvent.update(e.routine.copyWith(name: name)));
            },
          ),
        );
        break;

      case Option.delete:
        if (canDelete) {
          showDialog(
            context: context,
            builder: (_) => RoutineDeleteDialog(
              routineName: e.routine.name,
              onConfirm: () => bloc.add(RoutinesWithHeatEvent.delete(e.routine)),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(locale.errOpenSessionDelete)));
        }
        break;

      case Option.export:
        showDialog(
          context: context,
          builder: (_) => RoutineImportExportDialog(
            title: locale.exportRoutine,
            content: '${locale.exportRoutineAlertContent} ${e.routine.name}',
            isIn: false,
            onConfirm: () => bloc.add(RoutinesWithHeatEvent.export(e.routine.id!)),
          ),
        );
        break;

      case Option.setCurrent:
        showDialog(
          context: context,
          builder: (_) => RoutineSetCurrentDialog(
            routineName: e.routine.name,
            onConfirm: () async {
              bloc.add(RoutinesWithHeatEvent.setCurrent(e.routine));
              await bloc.stream.skip(1).first;
              if (context.mounted) {
                context.read<CurrentRoutineCubit>().getCurrentRoutine();
              }
            },
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      lazy: false,
      create: (context) => RoutinesWithHeatBloc(sl())..add(const RoutinesWithHeatEvent.getRoutines()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.scrTitleMyRoutines),
          actions: [
            IconButton(
              onPressed: () => setState(() => isGridView = !isGridView),
              icon: Icon(isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded),
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: BlocConsumer<RoutinesWithHeatBloc, RoutinesWithHeatState>(
            listenWhen: (previous, current) =>
                previous.maybeWhen(loaded: (_) => true, orElse: () => false) &&
                current.maybeWhen(importing: (_) => true, exported: (_) => true, orElse: () => false),
            listener: (context, state) {
              state.maybeWhen(
                importing: (_) => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => BlocProvider.value(
                    value: context.read<RoutinesWithHeatBloc>(),
                    child: const RoutineImportProgressDialog(),
                  ),
                ),
                exported: (isDone) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(isDone ? locale.exportRoutineDone : locale.errExportRoutine)));
                },
                orElse: () => null,
              );
            },
            buildWhen: (p, c) => c.maybeWhen(importing: (_) => false, exported: (_) => false, orElse: () => true),
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const SizedBox(),
                loading: (_) => const LoadingIndicator(),
                error: (state) => ReloadScreenWidget(
                  f: state.f,
                  callBack: () =>
                      BlocProvider.of<RoutinesWithHeatBloc>(context).add(const RoutinesWithHeatEvent.getRoutines()),
                ),
                loaded: (state) {
                  routinesLength = state.routines.length + 1;
                  return Column(
                    children: [
                      Expanded(
                        child: state.routines.isNotEmpty
                            ? isGridView
                                  ? GridView.builder(
                                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.85,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                      ),
                                      itemCount: state.routines.length,
                                      itemBuilder: (context, index) {
                                        final e = state.routines[index];
                                        return RoutineGridItem(
                                          routine: e.routine,
                                          heat: e.heat,
                                          onMenu: () => _onRoutineMenu(context, e, locale),
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RoutineEditScreen(
                                                routineId: e.routine.id!,
                                                routineName: e.routine.name,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.only(bottom: 120.0),
                                      itemCount: state.routines.length,
                                      itemBuilder: (context, index) {
                                        final e = state.routines[index];
                                        return RoutineWithHeat(
                                          routine: e.routine,
                                          heat: e.heat,
                                          onMenu: () => _onRoutineMenu(context, e, locale),
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RoutineEditScreen(
                                                routineId: e.routine.id!,
                                                routineName: e.routine.name,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                            : EmptyPage(
                                imageName: CaptainImages.emptyRoutines,
                                message: locale.emptyRoutines,
                                imageSize: Size(
                                  MediaQuery.sizeOf(context).width * .5,
                                  MediaQuery.sizeOf(context).width * .5,
                                ),
                              ),
                      ),
                      Builder(
                        builder: (context) {
                          final acc = context.watch<AccountCubit>();
                          final mem = context.watch<MembershipBloc>();

                          final canCreate = acc.state.when(
                            initial: () => false,
                            unauthenticated: () => state.routines.isEmpty,
                            hasAccount: (s) =>
                                mem.state.maybeWhen(orElse: () => state.routines.isEmpty, loaded: (_) => true),
                          );
                          final canImport = acc.state.maybeWhen(hasAccount: (_) => true, orElse: () => true);

                          final onAddTap = acc.state.maybeWhen(
                            orElse: () => state.routines.isEmpty
                                ? () => showDialog(
                                    context: context,
                                    builder: (_) => RoutineNameDialog(
                                      isCreate: true,
                                      initialName: "${locale.newRoutine} $routinesLength",
                                      onSubmit: (name) =>
                                          context.read<RoutinesWithHeatBloc>().add(RoutinesWithHeatEvent.create(name)),
                                    ),
                                  )
                                : () => showDialog(
                                    context: context,
                                    builder: (_) => AccountLimitAlert(content: locale.routineLimitAlert),
                                  ),
                            hasAccount: (_) => mem.state.maybeWhen(
                              orElse: () =>
                                  () => state.routines.isEmpty
                                  ? showDialog(
                                      context: context,
                                      builder: (_) => RoutineNameDialog(
                                        isCreate: true,
                                        initialName: "${locale.newRoutine} $routinesLength",
                                        onSubmit: (name) => context.read<RoutinesWithHeatBloc>().add(
                                          RoutinesWithHeatEvent.create(name),
                                        ),
                                      ),
                                    )
                                  : showDialog(context: context, builder: (_) => const PremiumAlert()),
                              loaded: (m) =>
                                  () => showDialog(
                                    context: context,
                                    builder: (_) => RoutineNameDialog(
                                      isCreate: true,
                                      initialName: "${locale.newRoutine} $routinesLength",
                                      onSubmit: (name) =>
                                          context.read<RoutinesWithHeatBloc>().add(RoutinesWithHeatEvent.create(name)),
                                    ),
                                  ),
                            ),
                          );

                          return Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, MediaQuery.paddingOf(context).bottom + 16),
                            child: Row(
                              children: [
                                Container(
                                  height: 54,
                                  width: 54,
                                  decoration: BoxDecoration(
                                    color: canImport
                                        ? Theme.of(context).colorScheme.secondaryContainer
                                        : Theme.of(context).disabledColor.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: IconButton(
                                    onPressed: canImport
                                        ? () {
                                            final bloc = context.read<RoutinesWithHeatBloc>();
                                            showDialog(
                                              context: context,
                                              builder: (_) => BlocProvider.value(
                                                value: bloc,
                                                child: RoutineImportExportDialog(
                                                  title: locale.importRoutine,
                                                  content: locale.importRoutineAlertContent,
                                                  isIn: true,
                                                  onConfirm: () => bloc.add(const RoutinesWithHeatEvent.import()),
                                                ),
                                              ),
                                            );
                                          }
                                        : null,
                                    icon: Icon(
                                      Icons.download_rounded,
                                      color: canImport
                                          ? Theme.of(context).colorScheme.surface
                                          : Theme.of(context).disabledColor,
                                    ),
                                    tooltip: locale.importRoutine,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Theme.of(context).colorScheme.primary,
                                          Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: onAddTap,
                                        borderRadius: BorderRadius.circular(16),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              canCreate
                                                  ? const Icon(Icons.add_rounded, color: Colors.white)
                                                  : const Image(
                                                      image: AssetImage(IMG_PREMIUM),
                                                      color: Colors.amber,
                                                      width: 20,
                                                      height: 20,
                                                    ),
                                              const SizedBox(width: 10),
                                              Text(
                                                locale.addRoutine,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
