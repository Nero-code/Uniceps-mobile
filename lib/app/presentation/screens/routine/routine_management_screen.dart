import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/routine_management/routine_management_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_create_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_delete_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/routine_options_dialog.dart';
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
      builder: (_) =>
          RoutineNameDialog(initialName: initial, onSubmit: onCreate),
    );
  }

  void _renameRoutine(
      String initial, void Function(String name) onCreate) async {
    showDialog(
      context: context,
      builder: (_) =>
          RoutineNameDialog(initialName: initial, onSubmit: onCreate),
    );
  }

  void _deleteRoutine(void Function() onConfirm) async {
    showDialog(
      context: context,
      builder: (_) => RoutineDeleteDialog(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Routines"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _createRoutine(
            "routine $routinesLength",
            (name) async => BlocProvider.of<RoutineManagementBloc>(context)
                .add(CreateRoutineEvent(name: name)),
          ),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<RoutineManagementBloc, RoutineManagementState>(
          builder: (context, state) {
            if (state is RoutineManagementLoadedState) {
              routinesLength = state.routines.length + 1;
              if (isGridView) {
                return GridView(
                  padding: EdgeInsets.all(gridSpacing),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                );
              } else {
                return ListView(
                  children: state.routines.map(
                    (e) {
                      return RoutineListTile(
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
                          onLongPress: () async {
                            final res = await showDialog<Option>(
                                context: context,
                                builder: (context) =>
                                    RoutineOptionsDialog(routineName: e.name));

                            print("selected option: $res");
                            switch (res) {
                              case Option.edit:
                                _renameRoutine(
                                    e.name,
                                    (name) =>
                                        BlocProvider.of<RoutineManagementBloc>(
                                                context)
                                            .add(UpdateRoutineEvent(
                                                routineToUpdate:
                                                    e.copyWith(name: name))));
                                break;

                              case Option.delete:
                                _deleteRoutine(() =>
                                    BlocProvider.of<RoutineManagementBloc>(
                                            context)
                                        .add(DeleteRoutineEvent(
                                            routineToDelete: e)));
                                break;
                              default:
                            }
                          });
                    },
                  ).toList(),
                );
              }
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
