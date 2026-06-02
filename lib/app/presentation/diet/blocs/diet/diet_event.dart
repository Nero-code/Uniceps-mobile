part of 'diet_bloc.dart';

@freezed
class DietEvent with _$DietEvent {
  const factory DietEvent.getDietData({int? planId}) = _GetDietData;

  // Diet Plan Events
  const factory DietEvent.addDietPlan(DietPlan plan) = _AddDietPlan;
  const factory DietEvent.updateDietPlan(DietPlan plan) = _UpdateDietPlan;
  const factory DietEvent.deleteDietPlan(int id) = _DeleteDietPlan;
  const factory DietEvent.setCurrentDietPlan(int id) = _SetCurrentDietPlan;

  // Diet Day Events
  const factory DietEvent.addDietDay(int planId, DietDay day) = _AddDietDay;
  const factory DietEvent.updateDietDay(DietDay day) = _UpdateDietDay;
  const factory DietEvent.deleteDietDay(int id) = _DeleteDietDay;
  const factory DietEvent.reorderDietDays(int planId, List<DietDay> days) = _ReorderDietDays;

  // Diet Meal Events
  const factory DietEvent.addDietMeal(int dayId, DietMeal meal) = _AddDietMeal;
  const factory DietEvent.updateDietMeal(DietMeal meal) = _UpdateDietMeal;
  const factory DietEvent.deleteDietMeal(int id) = _DeleteDietMeal;
  const factory DietEvent.reorderDietMeals(int dayId, List<DietMeal> meals) = _ReorderDietMeals;

  // Diet Meal Ingredient Events
  const factory DietEvent.addMealIngredient(int mealId, DietMealIngredient ingredient) = _AddMealIngredient;
  const factory DietEvent.updateMealIngredient(DietMealIngredient ingredient) = _UpdateMealIngredient;
  const factory DietEvent.deleteMealIngredient(int id) = _DeleteMealIngredient;
  const factory DietEvent.reorderMealIngredients(int mealId, List<DietMealIngredient> ingredients) =
      _ReorderMealIngredients;
}
