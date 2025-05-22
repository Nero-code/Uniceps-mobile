import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/blocs/routine_management/routine_management_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_create_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_delete_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_options_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_set_current_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_edit_days_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_grid_tile.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_list_tile.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Routines"),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _createRoutine(
        //     "routine $routinesLength",
        //     (name) async => BlocProvider.of<RoutineManagementBloc>(context)
        //         .add(CreateRoutineEvent(name: name)),
        //   ),
        //   child: const Icon(Icons.add),
        // ),
        body: BlocBuilder<RoutineManagementBloc, RoutineManagementState>(
          builder: (context, state) {
            if (state is RoutineManagementLoadedState) {
              routinesLength = state.routines.length + 1;

              return Stack(
                children: [
                  isGridView
                      ? GridView(
                          // padding: EdgeInsets.all(gridSpacing),
                          padding: const EdgeInsets.only(bottom: 50.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.3,
                            crossAxisCount: 2,
                            mainAxisSpacing: gridSpacing,
                            crossAxisSpacing: gridSpacing,
                          ),
                          children: state.routines.map(
                            (e) {
                              return RoutineGridTile(
                                routine: e,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoutineEditScreen(
                                      routineId: e.id!,
                                      routineName: e.name,
                                    ),
                                  ),
                                ),
                                onLongPress: () {},
                              );
                            },
                          ).toList(),
                        )
                      : ListView(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          children: state.routines
                              .map(
                                (e) => RoutineListTile(
                                    routine: e,
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RoutineEditScreen(
                                              routineId: e.id!,
                                              routineName: e.name,
                                            ),
                                          ),
                                        ),
                                    onLongPress: () async {
                                      final res = await showDialog<Option>(
                                          context: context,
                                          builder: (context) =>
                                              RoutineOptionsDialog(
                                                  routineName: e.name));

                                      // print("selected option: $res");
                                      switch (res) {
                                        case Option.edit:
                                          _renameRoutine(e.name, (name) {
                                            if (name == e.name) return;
                                            BlocProvider.of<
                                                        RoutineManagementBloc>(
                                                    context)
                                                .add(UpdateRoutineEvent(
                                                    routineToUpdate: e.copyWith(
                                                        name: name)));
                                          });
                                          break;

                                        case Option.delete:
                                          _deleteRoutine(() => BlocProvider.of<
                                                      RoutineManagementBloc>(
                                                  context)
                                              .add(DeleteRoutineEvent(
                                                  routineToDelete: e)));
                                          break;

                                        case Option.setCurrent:
                                          _setCurrentRoutine(() => BlocProvider
                                                  .of<RoutineManagementBloc>(
                                                      context)
                                              .add(SetCurrentRoutineEvent(
                                                  routine: e,
                                                  version: state.version)));
                                          break;
                                        default:
                                      }
                                    }),
                              )
                              .toList(),
                        ),
                  Positioned(
                      bottom: 0.0,
                      width: MediaQuery.sizeOf(context).width,
                      child: Material(
                        color: const Color.fromARGB(255, 59, 146, 146),
                        // color: Theme.of(context).colorScheme.secondary,
                        child: InkWell(
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                Text(
                                  "Add Routine",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => _createRoutine(
                            "routine $routinesLength",
                            (name) async =>
                                BlocProvider.of<RoutineManagementBloc>(context)
                                    .add(CreateRoutineEvent(name: name)),
                          ),
                        ),
                      ))
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
        ));
  }
}
