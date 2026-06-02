import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_day/diet_day_bloc.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
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

  void _showDayDialog(BuildContext context, {DietDay? day}) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: day?.name ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(day == null ? '${l10n.add} ${l10n.day}' : l10n.rename),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.pName),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                if (day == null) {
                  context.read<DietDayBloc>().add(
                    DietDayEvent.addDay(widget.plan.id!, DietDay(name: name, index: 0, meals: [])),
                  );
                } else {
                  context.read<DietDayBloc>().add(DietDayEvent.updateDay(widget.plan.id!, day.copyWith(name: name)));
                }
                Navigator.pop(ctx);
              }
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showDeleteDayDialog(BuildContext context, DietDay day) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${l10n.delete} ${l10n.day}?'),
        content: Text(l10n.deleteAlertContent(day.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              context.read<DietDayBloc>().add(DietDayEvent.deleteDay(widget.plan.id!, day.id!));
              Navigator.pop(ctx);
              if (_selectedDayIndex > 0) {
                setState(() => _selectedDayIndex--);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }

  void _showMealDialog(BuildContext context, int dayId, {DietMeal? meal}) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: meal?.name ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(meal == null ? l10n.addMeal : l10n.rename),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.pName),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                if (meal == null) {
                  context.read<DietMealBloc>().add(
                    DietMealEvent.addMeal(dayId, DietMeal(name: name, index: 0, ingredients: [])),
                  );
                } else {
                  context.read<DietMealBloc>().add(DietMealEvent.updateMeal(dayId, meal.copyWith(name: name)));
                }
                Navigator.pop(ctx);
              }
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showDeleteMealDialog(BuildContext context, int dayId, DietMeal meal) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${l10n.deleteMeal}?'),
        content: Text(l10n.deleteAlertContent(meal.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              context.read<DietMealBloc>().add(DietMealEvent.deleteMeal(dayId, meal.id!));
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }

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
            Builder(
              builder: (context) {
                return IconButton(icon: const Icon(Icons.add), onPressed: () => _showDayDialog(context));
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
                            onPressed: () => _showDayDialog(context),
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
                                onLongPress: () => _showDeleteDayDialog(context, day),
                                child: ChoiceChip(
                                  label: Text(day.name),
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
                                onTap: () => _showMealDialog(context, currentDay.id!),
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
                                  onPressed: () => _showMealDialog(context, currentDay.id!, meal: meal),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
                                  );
                                },
                                onLongPress: () => _showDeleteMealDialog(context, currentDay.id!, meal),
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
