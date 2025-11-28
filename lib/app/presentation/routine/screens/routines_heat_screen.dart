import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_import_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_import_progress_dialog.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_with_heat.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/empty_page.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_create_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_delete_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_options_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_set_current_dialog.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_days_screen.dart';
import 'package:uniceps/core/widgets/premium_alert.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutinesHeatScreen extends StatefulWidget {
  const RoutinesHeatScreen({super.key});

  @override
  State<RoutinesHeatScreen> createState() => _RoutineHeatScreenState();
}

class _RoutineHeatScreenState extends State<RoutinesHeatScreen> {
  final gridSpacing = 6.0;

  bool isGridView = false;
  int routinesLength = 0;

  void _createRoutine(String initial, void Function(String name) onCreate) async {
    showDialog(
      context: context,
      builder: (_) => RoutineNameDialog(isCreate: true, initialName: initial, onSubmit: onCreate),
    );
  }

  void _renameRoutine(String initial, void Function(String name) onCreate) async {
    showDialog(
      context: context,
      builder: (_) => RoutineNameDialog(isCreate: false, initialName: initial, onSubmit: onCreate),
    );
  }

  void _deleteRoutine(String name, void Function() onConfirm) async {
    showDialog(
      context: context,
      builder: (_) => RoutineDeleteDialog(routineName: name, onConfirm: onConfirm),
    );
  }

  void _setCurrentRoutine(void Function() onConfirm, String name) async {
    showDialog(context: context, builder: (_) => RoutineSetCurrentDialog(routineName: name, onConfirm: onConfirm));
  }

  void _importRoutineAlert(RoutinesWithHeatBloc bloc) async {
    showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
              value: bloc,
              child: RoutineImportDialog(onConfirm: () => bloc.add(const RoutinesWithHeatEvent.import())),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      lazy: false,
      create: (context) => RoutinesWithHeatBloc(sl())..add(const RoutinesWithHeatEvent.getRoutines()),
      child: Scaffold(
          appBar: AppBar(title: Text(locale.scrTitleMyRoutines)),
          body: BlocConsumer<RoutinesWithHeatBloc, RoutinesWithHeatState>(
            listenWhen: (previous, current) =>
                previous.maybeWhen(loaded: (_) => true, orElse: () => false) &&
                current.maybeWhen(importing: (_) => true, orElse: () => false),
            listener: (context, state) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => BlocProvider.value(
                        value: context.read<RoutinesWithHeatBloc>(),
                        child: const RoutineImportProgressDialog(),
                      ));
            },
            buildWhen: (p, c) => c.maybeWhen(importing: (_) => false, orElse: () => true),
            builder: (context, state) {
              return state.map(
                initial: (_) => const SizedBox(),
                importing: (_) => const SizedBox(),
                loading: (_) => const LoadingIndicator(),
                error: (state) => ReloadScreenWidget(
                    f: state.f,
                    callBack: () =>
                        BlocProvider.of<RoutinesWithHeatBloc>(context).add(const RoutinesWithHeatEvent.getRoutines())),
                loaded: (state) {
                  routinesLength = state.routines.length + 1;
                  return Column(
                    children: [
                      Expanded(
                        child: state.routines.isNotEmpty
                            ? ListView(
                                padding: const EdgeInsets.only(bottom: 50.0),
                                children: state.routines
                                    .map(
                                      (e) => RoutineWithHeat(
                                        routine: e.routine,
                                        heat: e.heat,
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RoutineEditScreen(
                                                routineId: e.routine.id!, routineName: e.routine.name),
                                          ),
                                        ),
                                        onMenu: () async {
                                          final canDelete = context
                                              .read<SessionBloc>()
                                              .state
                                              .maybeWhen(orElse: () => false, noActiveSession: () => true);

                                          final res = await showDialog<Option>(
                                              context: context,
                                              builder: (context) => RoutineOptionsDialog(routineName: e.routine.name));

                                          // print("selected option: $res");
                                          switch (res) {
                                            case Option.edit:
                                              _renameRoutine(e.routine.name, (name) {
                                                if (name == e.routine.name) return;
                                                BlocProvider.of<RoutinesWithHeatBloc>(context)
                                                    .add(RoutinesWithHeatEvent.update(e.routine.copyWith(name: name)));
                                              });
                                              break;

                                            case Option.delete:
                                              if (canDelete) {
                                                _deleteRoutine(e.routine.name, () {
                                                  BlocProvider.of<RoutinesWithHeatBloc>(context)
                                                      .add(RoutinesWithHeatEvent.delete(e.routine));
                                                });
                                              } else {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      backgroundColor: Colors.red,
                                                      content: Text(locale.errOpenSessionDelete),
                                                    ),
                                                  );
                                                }
                                              }
                                              break;

                                            case Option.setCurrent:
                                              _setCurrentRoutine(
                                                () async {
                                                  final rBloc = BlocProvider.of<RoutinesWithHeatBloc>(context)
                                                    ..add(RoutinesWithHeatEvent.setCurrent(e.routine));
                                                  await rBloc.stream.skip(1).first;
                                                  if (context.mounted) {
                                                    BlocProvider.of<CurrentRoutineCubit>(context).getCurrentRoutine();
                                                  }
                                                },
                                                e.routine.name,
                                              );
                                              break;
                                            default:
                                          }
                                        },
                                      ),
                                    )
                                    .toList(),
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
                      Builder(builder: (context) {
                        final accountCubit = context.watch<AccountCubit>();
                        final membershipBloc = context.watch<MembershipBloc>();

                        final canCreate = accountCubit.state.when(
                          initial: () => false,
                          unauthenticated: () => state.maybeWhen(
                            orElse: () => false,
                            loaded: (routines) => routines.isEmpty,
                          ),
                          hasAccount: (s) => membershipBloc.state.maybeWhen(
                            orElse: () => state.maybeWhen(orElse: () => false, loaded: (routines) => routines.isEmpty),
                            loaded: (_) => true,
                          ),
                        );
                        final canImport = accountCubit.state.maybeWhen(hasAccount: (_) => true, orElse: () => true);

                        return Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Theme.of(context).colorScheme.primary,
                                child: InkWell(
                                  onTap: canCreate
                                      ? () => _createRoutine(
                                            "${locale.newRoutine} $routinesLength",
                                            (name) => context
                                                .read<RoutinesWithHeatBloc>()
                                                .add(RoutinesWithHeatEvent.create(name)),
                                          )
                                      : () => showDialog(context: context, builder: (_) => const PremiumAlert()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        canCreate
                                            ? const Icon(Icons.add, color: Colors.white)
                                            : const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Image(
                                                  image: AssetImage(IMG_PREMIUM),
                                                  color: Colors.amber,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                        Text(
                                          // canCreate ? locale.add : locale.upgrade,
                                          locale.addRoutine,
                                          style: const TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Ink(
                                color: canImport ? Theme.of(context).colorScheme.secondary : Colors.grey.shade300,
                                child: InkWell(
                                  onTap: canImport ? () => _importRoutineAlert(context.read()) : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.download, color: Colors.white),
                                        Text(
                                          // canCreate ? locale.add : locale.upgrade,
                                          locale.importRoutine,
                                          style: const TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
