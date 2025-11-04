import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/routine_management/routine_management_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_create_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_delete_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_options_dialog.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_set_current_dialog.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_days_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_list_tile.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineManagementScreen extends StatefulWidget {
  const RoutineManagementScreen({super.key});

  @override
  State<RoutineManagementScreen> createState() =>
      _RoutineManagementScreenState();
}

class _RoutineManagementScreenState extends State<RoutineManagementScreen> {
  final gridSpacing = 6.0;

  bool isGridView = false;
  int routinesLength = 0;

  void _createRoutine(
      String initial, void Function(String name) onCreate) async {
    showDialog(
      context: context,
      builder: (_) => RoutineNameDialog(
          title: "Create Routine", initialName: initial, onSubmit: onCreate),
    );
  }

  void _renameRoutine(
      String initial, void Function(String name) onCreate) async {
    showDialog(
      context: context,
      builder: (_) => RoutineNameDialog(
          title: "Rename Routine", initialName: initial, onSubmit: onCreate),
    );
  }

  void _deleteRoutine(void Function() onConfirm) async {
    showDialog(
      context: context,
      builder: (_) => RoutineDeleteDialog(onConfirm: onConfirm),
    );
  }

  void _setCurrentRoutine(void Function() onConfirm) async {
    showDialog(
        context: context,
        builder: (_) => RoutineSetCurrentDialog(onConfirm: onConfirm));
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      lazy: false,
      create: (context) =>
          RoutineManagementBloc(routineManagementUsecases: sl())
            ..add(GetRoutinesEvent()),
      child: Scaffold(
          appBar: AppBar(title: Text(locale.scrTitleMyRoutines)),
          body: BlocBuilder<RoutineManagementBloc, RoutineManagementState>(
            builder: (context, state) {
              if (state is RoutineManagementLoadedState) {
                routinesLength = state.routines.length + 1;

                return Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      children: state.routines.map(
                        (e) {
                          return RoutineListTile(
                            routine: e,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoutineEditScreen(
                                    routineId: e.id!, routineName: e.name),
                              ),
                            ),
                            onLongPress: () async {
                              final canDelete = context
                                  .read<SessionBloc>()
                                  .state
                                  .maybeWhen(
                                      orElse: () => false,
                                      noActiveSession: () => true);

                              final res = await showDialog<Option>(
                                  context: context,
                                  builder: (context) => RoutineOptionsDialog(
                                      routineName: e.name));

                              // print("selected option: $res");
                              switch (res) {
                                case Option.edit:
                                  _renameRoutine(e.name, (name) {
                                    if (name == e.name) return;
                                    BlocProvider.of<RoutineManagementBloc>(
                                            context)
                                        .add(UpdateRoutineEvent(
                                            routineToUpdate:
                                                e.copyWith(name: name)));
                                  });
                                  break;

                                case Option.delete:
                                  if (canDelete) {
                                    _deleteRoutine(() =>
                                        BlocProvider.of<RoutineManagementBloc>(
                                                context)
                                            .add(DeleteRoutineEvent(
                                                routineToDelete: e)));
                                  } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              "you can't delete with an open session!"),
                                        ),
                                      );
                                    }
                                  }
                                  break;

                                case Option.setCurrent:
                                  _setCurrentRoutine(() async {
                                    final rBloc = BlocProvider.of<
                                        RoutineManagementBloc>(context)
                                      ..add(SetCurrentRoutineEvent(
                                          routine: e, version: state.version));
                                    await rBloc.stream.skip(1).first;
                                    if (context.mounted) {
                                      BlocProvider.of<CurrentRoutineCubit>(
                                              context)
                                          .getCurrentRoutine();
                                    }
                                  });
                                  break;
                                default:
                              }
                            },
                          );
                        },
                      ).toList(),
                    ),
                    Positioned(
                        bottom: 0.0,
                        width: MediaQuery.sizeOf(context).width,
                        child: Builder(builder: (context) {
                          final accountCubit = context.watch<AccountCubit>();
                          final membershipBloc =
                              context.watch<MembershipBloc>();
                          final canCreate = accountCubit.state.when(
                              initial: () => false,
                              unauthenticated: () => state.routines.isEmpty,
                              hasAccount: (s) => membershipBloc.state.maybeWhen(
                                  orElse: () => state.routines.isEmpty,
                                  loaded: (m) => true));

                          return Material(
                            color: canCreate
                                ? const Color.fromARGB(255, 59, 146, 146)
                                : Colors.grey.shade400,
                            child: InkWell(
                              onTap: canCreate
                                  ? () => _createRoutine(
                                        "routine $routinesLength",
                                        (name) async => BlocProvider.of<
                                                RoutineManagementBloc>(context)
                                            .add(
                                                CreateRoutineEvent(name: name)),
                                      )
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add, color: Colors.white),
                                    Text(
                                      locale.add,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
                  ],
                );
              } else if (state is RoutineManagementErrorState) {
                return ReloadScreenWidget(
                    f: state.failure,
                    callBack: () =>
                        BlocProvider.of<RoutineManagementBloc>(context)
                            .add(GetRoutinesEvent()));
              }
              return const LoadingPage();
            },
          )),
    );
  }
}
