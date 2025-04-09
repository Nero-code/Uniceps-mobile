import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/routine_management/routine_management_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_edit_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_grid_tile.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_list_tile.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class RoutineManagementScreen extends StatefulWidget {
  const RoutineManagementScreen({super.key});

  @override
  State<RoutineManagementScreen> createState() =>
      _RoutineManagementScreenState();
}

class _RoutineManagementScreenState extends State<RoutineManagementScreen> {
  final gridSpacing = 6.0;

  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoutineManagementBloc()..add(GetRoutinesEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("My Routines"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RoutineEditScreen(routineId: 0),
              ),
            ),
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<RoutineManagementBloc, RoutineManagementState>(
            builder: (context, state) {
              if (state is RoutineManagementLoadedState) {
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
                              builder: (context) =>
                                  RoutineEditScreen(routineId: e.id ?? 0),
                            ),
                          ),
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
                              builder: (context) =>
                                  RoutineEditScreen(routineId: e.id ?? 0),
                            ),
                          ),
                        );
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
          )),
    );
  }
}
