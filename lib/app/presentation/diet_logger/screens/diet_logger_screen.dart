import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/diet_logger/diet_logger_bloc.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/ingredients/ingredients_cubit.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/edit_diet_log_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/add_diet_log_sheet.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/diet_log_tile.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/diet_summary_card.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';

class DietLoggerScreen extends StatelessWidget {
  const DietLoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final caloriesGoal = context.read<AppConfigCubit>().state.whenOrNull(
      appConfig: (config) => config.activityLevel?.multiplier,
    );
    return BlocProvider(
      create: (context) => IngredientsCubit(sl())..loadAllIngredients(),
      lazy: false,
      child: Scaffold(
        backgroundColor: back2,
        body: BlocBuilder<DietLoggerBloc, DietLoggerState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox(),
            loading: () => const LoadingIndicator(),
            success: (logs) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 280,
                    collapsedHeight: 280,
                    pinned: true,
                    stretch: true,
                    elevation: 0,
                    leading: const SizedBox(),

                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,

                      background: DietSummaryCard(logs: logs, calorieGoal: caloriesGoal),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 10, bottom: 70),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final log = logs[index];
                        return DietLogTile(log: log, onTap: () => _showEditLogDialog(context, log));
                      }, childCount: logs.length),
                    ),
                  ),
                ],
              );
            },
            failure: (failure) => Center(child: Text(failure.toString())),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddLogSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddLogSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddDietLogSheet(),
    );
  }

  void _showEditLogDialog(BuildContext context, DietLog log) {
    showDialog(
      context: context,
      builder: (context) => EditDietLogDialog(
        log: log,
        onUpdate: (updatedLog) {
          // TODO: Implement actual update logic (BLoC/Repo)
        },
        onDelete: () {
          // TODO: Implement actual delete logic (BLoC/Repo)
        },
      ),
    );
  }
}
