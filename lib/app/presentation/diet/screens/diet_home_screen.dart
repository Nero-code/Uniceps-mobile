import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_plan_widget.dart';
import 'package:uniceps/injection_dependency.dart';

class DietHomeScreen extends StatefulWidget {
  const DietHomeScreen({super.key});

  @override
  State<DietHomeScreen> createState() => _DietHomeScreenState();
}

class _DietHomeScreenState extends State<DietHomeScreen> {
  int _selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final theme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => DietPlanBloc(sl())..add(const DietPlanEvent.getPlans()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'UniDiet',
            style: TextStyle(fontFamily: 'Playwrite', color: Theme.of(context).colorScheme.primary),
          ),
          elevation: 0,
        ),
        body: BlocBuilder<DietPlanBloc, DietPlanState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (plans, currentPlan) {
                if (currentPlan == null) {
                  return const Center(child: Text('No Active Diet Plan'));
                }

                if (_selectedDayIndex >= currentPlan.days.length) {
                  _selectedDayIndex = 0;
                }
                final selectedDay = currentPlan.days.isEmpty ? null : currentPlan.days[_selectedDayIndex];

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Beautiful Summary Card
                      _buildSummaryCard(screen, theme, selectedDay),

                      const SizedBox(height: 8),

                      DietPlanWidget(plan: currentPlan),

                      const SizedBox(height: 8),

                      // Horizontal Day Picker
                      if (currentPlan.days.isNotEmpty) _buildDayPicker(currentPlan.days, theme),

                      // Active DietPlan Day Meals
                      if (selectedDay != null) _buildMealList(selectedDay, theme),

                      const SizedBox(height: 80), // Space for FAB
                    ],
                  ),
                );
              },
              error: (f) => Center(child: Text(f.getErrorMessage())),
              orElse: () => const SizedBox(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showQuickLogBottomSheet(context),
          label: const Text('Quick Log'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(Size screen, ColorScheme theme, DietDay? day) {
    final calories = day?.calories ?? 0;
    const targetCalories = 2500.0; // Ideal to get from user profile
    final progress = (calories / targetCalories).clamp(0.0, 1.0);

    return Stack(
      children: [
        Container(
          width: screen.width,
          height: screen.width * 0.6,
          margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [theme.primary, theme.secondary],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [BoxShadow(color: theme.primary.withOpacity(0.3), blurRadius: 5, offset: const Offset(0, 3))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Daily Supply',
                    style: TextStyle(
                      color: theme.onSecondary.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    padding: .symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(color: theme.onSurface.withAlpha(50), borderRadius: .circular(50)),
                    // child: Text(DateFormat('d/M/y').format(DateTime.now()), style: TextStyle(color: theme.onSecondary)),
                    child: Text(
                      DateFormat('MMM d, y').format(DateTime.now()),
                      style: TextStyle(color: theme.onSecondary),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: .min,
                        textDirection: .ltr,
                        spacing: 5,
                        children: [
                          Text(
                            calories.toStringAsFixed(0),
                            style: TextStyle(color: theme.onSecondary, fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'kcal',
                            style: TextStyle(color: theme.onSecondary, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Remaining: ${(targetCalories - calories).clamp(0, targetCalories).toStringAsFixed(0)} kcal',
                        style: TextStyle(color: theme.onSecondary.withOpacity(0.8), fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox.square(
                    dimension: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox.square(
                          dimension: 70,
                          child: CircularProgressIndicator(
                            value: progress + .5,
                            strokeWidth: 10,
                            color: theme.onSecondary,
                            backgroundColor: theme.onSecondary.withOpacity(0.2),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        Text(
                          '${(progress * 100).toStringAsFixed(0)}%',
                          style: TextStyle(color: theme.onSecondary, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (day != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMiniMacro('Protein', '${day.protein.toStringAsFixed(0)}g', theme),
                    _buildMiniMacro('Carbs', '${day.carbs.toStringAsFixed(0)}g', theme),
                    _buildMiniMacro('Fats', '${day.fats.toStringAsFixed(0)}g', theme),
                  ],
                ),
            ],
          ),
        ),
        // Decorative design elements
        Positioned(top: -20, right: -20, child: CircleAvatar(radius: 80, backgroundColor: Colors.white.withAlpha(50))),
        Positioned(bottom: -10, left: 0, child: CircleAvatar(radius: 55, backgroundColor: Colors.white.withAlpha(50))),
      ],
    );
  }

  Widget _buildMiniMacro(String label, String value, ColorScheme theme) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(color: theme.onSecondary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: TextStyle(color: theme.onSecondary.withOpacity(0.7), fontSize: 11)),
      ],
    );
  }

  Widget _buildDayPicker(List<DietDay> days, ColorScheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text('Diet Schedule', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final isSelected = index == _selectedDayIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedDayIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.primary : theme.surface,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: isSelected
                        ? [BoxShadow(color: theme.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                        : [],
                    border: Border.all(color: isSelected ? theme.primary : theme.outline.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Day',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                          color: isSelected ? theme.onSecondary : theme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? theme.onSecondary : theme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMealList(DietDay day, ColorScheme theme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: day.meals.length,
      itemBuilder: (context, index) {
        final meal = day.meals[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: theme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.outline.withOpacity(0.1)),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(20, 8, 12, 4),
                title: Text(meal.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text(
                  '${meal.calories.toStringAsFixed(0)} kcal',
                  style: TextStyle(color: theme.primary, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add_circle_outline_rounded, color: theme.primary, size: 28),
                  onPressed: () {
                    // Quick add to this specific meal
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: DietMacroSummary(
                  calories: meal.calories,
                  protein: meal.protein,
                  carbs: meal.carbs,
                  fats: meal.fats,
                  compact: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuickLogBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ),
                const Text('Quick Log Meal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search food...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                // Add food list / Recent items here
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Food Item $index'),
                      subtitle: const Text('100g - 150 kcal'),
                      trailing: const Icon(Icons.add),
                      onTap: () {
                        // Log food and close
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
