import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';

final dietPlan = DietPlan(id: 0, name: 'Fake Plan 1', createdAt: DateTime.now(), days: [dietDay, dietDay]);

const dietDay = DietDay(
  id: 0,
  name: 'Diet Day 1',
  index: 0,
  meals: [
    DietMeal(
      id: 0,
      name: 'meal 1',
      index: 0,
      ingredients: [
        DietMealIngredient(
          id: 0,
          amount: 150,
          index: 0,
          code: 'code',
          nameAr: 'nameAr',
          nameEn: 'nameEn',
          category: 'category',
          description: 'description',
          servingSizeInGrams: 100,
          calories: 25,
          protein: 30,
          carbs: 35,
          fats: 40,
        ),
        DietMealIngredient(
          id: 0,
          amount: 150,
          index: 0,
          code: 'code',
          nameAr: 'nameAr',
          nameEn: 'nameEn',
          category: 'category',
          description: 'description',
          servingSizeInGrams: 100,
          calories: 25,
          protein: 30,
          carbs: 35,
          fats: 40,
        ),
      ],
    ),
    DietMeal(
      id: 0,
      name: 'meal 1',
      index: 0,
      ingredients: [
        DietMealIngredient(
          id: 0,
          amount: 150,
          index: 0,
          code: 'code',
          nameAr: 'nameAr',
          nameEn: 'nameEn',
          category: 'category',
          description: 'description',
          servingSizeInGrams: 100,
          calories: 25,
          protein: 30,
          carbs: 35,
          fats: 40,
        ),
      ],
    ),
  ],
);

const dietMeal = DietMeal(
  id: 0,
  name: 'meal 1',
  index: 0,
  ingredients: [
    DietMealIngredient(
      id: 0,
      amount: 150,
      index: 0,
      code: 'code',
      nameAr: 'nameAr',
      nameEn: 'nameEn',
      category: 'category',
      description: 'description',
      servingSizeInGrams: 100,
      calories: 25,
      protein: 30,
      carbs: 35,
      fats: 40,
    ),
    DietMealIngredient(
      id: 0,
      amount: 150,
      index: 0,
      code: 'code',
      nameAr: 'nameAr',
      nameEn: 'nameEn',
      category: 'category',
      description: 'description',
      servingSizeInGrams: 100,
      calories: 25,
      protein: 30,
      carbs: 35,
      fats: 40,
    ),
  ],
);

const dietIngredient = DietMealIngredient(
  id: 0,
  amount: 150,
  index: 0,
  code: 'code',
  nameAr: 'nameAr',
  nameEn: 'nameEn',
  category: 'category',
  description: 'description',
  servingSizeInGrams: 100,
  calories: 25,
  protein: 30,
  carbs: 35,
  fats: 40,
);
