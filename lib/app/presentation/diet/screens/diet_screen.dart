import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_day/diet_day_bloc.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
import 'package:uniceps/app/presentation/diet/dialogs/delete_diet_day_dialog.dart';
import 'package:uniceps/app/presentation/diet/dialogs/delete_diet_meal_dialog.dart';
import 'package:uniceps/app/presentation/diet/dialogs/diet_day_add_edit_dialog.dart';
import 'package:uniceps/app/presentation/diet/dialogs/diet_meal_add_edit_dialog.dart';
import 'package:uniceps/app/presentation/diet/screens/meal_details_screen.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key, required this.plan});

  final DietPlan plan;

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  int _selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DietDayBloc(sl())..add(DietDayEvent.getDays(widget.plan.id!))),
        BlocProvider(create: (context) => DietMealBloc(sl())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.plan.name),
          actions: [
            BlocBuilder<DietDayBloc, DietDayState>(
              builder: (context, state) {
                final dayCount = state.maybeWhen(loaded: (days) => days.length, orElse: () => 0);
                return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<DietDayBloc>(),
                      child: DietDayAddEditDialog(planId: widget.plan.id!, defaultName: '${l10n.day} #${dayCount + 1}'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<DietMealBloc, DietMealState>(
              listener: (context, state) {
                // When a meal is added/updated/deleted, we should refresh the days to get updated macro summaries
                context.read<DietDayBloc>().add(DietDayEvent.getDays(widget.plan.id!));
              },
            ),
          ],
          child: BlocBuilder<DietDayBloc, DietDayState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const LoadingIndicator(),
                error: (f) => ReloadScreenWidget(
                  f: f,
                  callBack: () => context.read<DietDayBloc>().add(DietDayEvent.getDays(widget.plan.id!)),
                ),
                loaded: (days) {
                  if (days.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.noDaysInPlan),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: context.read<DietDayBloc>(),
                                child: DietDayAddEditDialog(planId: widget.plan.id!, defaultName: '${l10n.day} #1'),
                              ),
                            ),
                            child: Text('${l10n.add} ${l10n.day}'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (_selectedDayIndex >= days.length) {
                    _selectedDayIndex = days.length - 1;
                  }
                  if (_selectedDayIndex < 0) _selectedDayIndex = 0;

                  final currentDay = days[_selectedDayIndex];

                  return Column(
                    children: [
                      // Day Selector
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: days.asMap().entries.map((entry) {
                            final index = entry.key;
                            final day = entry.value;
                            final isSelected = index == _selectedDayIndex;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onLongPress: () => showDialog(
                                  context: context,
                                  builder: (optionsContext) => SimpleDialog(
                                    title: Text(day.name),
                                    children: [
                                      SimpleDialogOption(
                                        onPressed: () {
                                          Navigator.pop(optionsContext);
                                          showDialog(
                                            context: context,
                                            builder: (_) => BlocProvider.value(
                                              value: context.read<DietDayBloc>(),
                                              child: DietDayAddEditDialog(planId: widget.plan.id!, day: day),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(Icons.edit_outlined, size: 20),
                                            const SizedBox(width: 12),
                                            Text(l10n.rename),
                                          ],
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          Navigator.pop(optionsContext);
                                          showDialog(
                                            context: context,
                                            builder: (_) => BlocProvider.value(
                                              value: context.read<DietDayBloc>(),
                                              child: DeleteDietDayDialog(
                                                planId: widget.plan.id!,
                                                day: day,
                                                onDelete: () {
                                                  if (_selectedDayIndex > 0) {
                                                    setState(() => _selectedDayIndex--);
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                                            const SizedBox(width: 12),
                                            Text(l10n.delete, style: const TextStyle(color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: ChoiceChip(
                                  label: Text(day.name),
                                  selectedColor: Colors.blue.shade100,
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    if (selected) setState(() => _selectedDayIndex = index);
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      // Day Summary
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DietMacroSummary(
                          calories: currentDay.calories,
                          protein: currentDay.protein,
                          carbs: currentDay.carbs,
                          fats: currentDay.fats,
                        ),
                      ),

                      if (widget.plan.description != null && widget.plan.description!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.plan.description!,
                              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
                            ),
                          ),
                        ),

                      // Meals List
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: currentDay.meals.length + 1,
                          itemBuilder: (context, index) {
                            if (index == currentDay.meals.length) {
                              return ListTile(
                                leading: const Icon(Icons.add),
                                title: Text(l10n.addMeal),
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<DietMealBloc>(),
                                    child: DietMealAddEditDialog(
                                      dayId: currentDay.id!,
                                      defaultName: 'Meal #${currentDay.meals.length + 1}',
                                    ),
                                  ),
                                ),
                              );
                            }
                            final meal = currentDay.meals[index];
                            return Card(
                              elevation: 0,
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                title: Text(meal.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (meal.description != null && meal.description!.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          meal.description!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                                        ),
                                      ),
                                    Text('${meal.calories.toStringAsFixed(0)} kcal'),
                                    DietMacroSummary(
                                      calories: meal.calories,
                                      protein: meal.protein,
                                      carbs: meal.carbs,
                                      fats: meal.fats,
                                      compact: true,
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit_outlined),
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (_) => BlocProvider.value(
                                      value: context.read<DietMealBloc>(),
                                      child: DietMealAddEditDialog(dayId: currentDay.id!, meal: meal),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
                                  );
                                },
                                onLongPress: () => showDialog(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<DietMealBloc>(),
                                    child: DeleteDietMealDialog(dayId: currentDay.id!, meal: meal),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
