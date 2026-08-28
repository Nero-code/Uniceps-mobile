import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/diet_logger/diet_logger_bloc.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/ingredients/ingredients_bloc.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/edit_diet_log_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/add_diet_log_sheet.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/diet_log_tile.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/diet_summary_card.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietLoggerScreen extends StatelessWidget {
  const DietLoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final language = context.read<AppConfigCubit>().state.config.exerciseLibLanguage.languageCode;
    return BlocProvider(
      create: (context) => IngredientsBloc(dietCommands: sl())..add(.started(language)),
      lazy: false,
      child: Scaffold(
        backgroundColor: back2,
        floatingActionButton: Builder(
          builder: (context) =>
              FloatingActionButton(onPressed: () => _showAddLogSheet(context, language), child: const Icon(Icons.add)),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              collapsedHeight: 300,
              pinned: true,
              stretch: true,
              elevation: 0,
              leading: const SizedBox(),
              backgroundColor: back2,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: BlocBuilder<DietLoggerBloc, DietLoggerState>(
                  builder: (context, state) => FutureBuilder(
                    future: context.read<AppConfigCubit>().getCaloriesGoal(),
                    builder: (context, caloriesGoalValue) => DietSummaryCard(
                      logs: state.maybeWhen(orElse: () => [], success: (logs) => logs),
                      calorieGoal: caloriesGoalValue.data ?? 0,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 70),
              sliver: BlocBuilder<DietLoggerBloc, DietLoggerState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SliverToBoxAdapter(child: SizedBox()),
                    loading: () => const SliverToBoxAdapter(child: LoadingIndicator()),
                    success: (logs) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            DietLogTile(log: logs[index], onTap: () => _showEditLogDialog(context, logs[index])),
                        childCount: logs.length,
                      ),
                    ),
                    failure: (f) => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(f.maybeWhen(noLogsToday: () => l10n.noLogsToday, orElse: () => l10n.errUnknown)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddLogSheet(BuildContext context, String language) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (context) => IngredientsBloc(dietCommands: sl())..add(.started(language)),
        child: const AddDietLogSheet(),
      ),
    );
  }

  void _showEditLogDialog(BuildContext context, DietLog log) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<DietLoggerBloc>(),
        child: EditDietLogDialog(
          log: log,
          onUpdate: (updatedLog) => context.read<DietLoggerBloc>().add(.logServing(log: updatedLog)),
          onDelete: () => context.read<DietLoggerBloc>().add(.deleteLog(log: log)),
        ),
      ),
    );
  }
}
