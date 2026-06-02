part of 'diet_meal_bloc.dart';

@freezed
abstract class DietMealEvent with _$DietMealEvent {
  const factory DietMealEvent.getMeals(int dayId) = _GetMeals;
  const factory DietMealEvent.addMeal(int dayId, DietMeal meal) = _AddMeal;
  const factory DietMealEvent.updateMeal(int dayId, DietMeal meal) = _UpdateMeal;
  const factory DietMealEvent.deleteMeal(int dayId, int id) = _DeleteMeal;
  const factory DietMealEvent.reorderMeals(int dayId, List<DietMeal> meals) = _ReorderMeals;
}
