import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/diet_models/diet_log_dto.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/logging/app_logger.dart';

abstract class IDietLocalSource {
  // Ingredients
  Future<List<IngredientModel>> getIngredients({String? searchString, int? categoryId});
  Future<IngredientModel> saveIngredient(IngredientModel ingredient);
  Future<void> bulkSaveIngredients(List<IngredientModel> ingredients);
  Future<void> deleteIngredient(IngredientModel ingredient);

  Future<DateTime?> getLastLibSync();
  Future<List<IngredientModel>> getUserGeneratedContent();

  // Diet Logging
  Future<List<DietLogDto>> getTodayLogs();
  Future<void> logMeal(DietLogDto log);
  Future<void> upsertDietLog(DietLogDto log);
  Future<void> deleteLog(DietLogDto log);

  // Analytics Section
  Future<List<DietLogDto>> getAllLogs();

  // Synchronization
  Future<List<DietLogDto>> getAllUnSyncedLogs();
  Future<void> bulkSaveLogs(List<DietLogDto> logs);
}

class DietLocalSource implements IDietLocalSource {
  const DietLocalSource({required AppDatabase db}) : _db = db;
  final AppDatabase _db;

  @override
  Future<List<IngredientModel>> getIngredients({String? searchString, int? categoryId}) async {
    final query = _db.select(_db.ingredients);
    if (searchString != null && searchString.isNotEmpty) {
      query.where((tbl) => tbl.name.contains(searchString));
    }
    if (categoryId != null) {
      query.where((tbl) => tbl.categoryId.equals(categoryId));
    }

    final result = await query.get();
    return result.map((e) => IngredientModel.fromCompanion(e)).toList();
  }

  @override
  Future<IngredientModel> saveIngredient(IngredientModel ingredient) async {
    final companion = IngredientsCompanion(
      id: ingredient.id != null ? Value(ingredient.id!) : const Value.absent(),
      apiId: ingredient.apiId != null ? Value(ingredient.apiId!) : const Value.absent(),
      name: Value(ingredient.name),
      isUserGenerated: Value(ingredient.isUserGenerated),
      categoryId: Value(ingredient.categoryId),
      categoryName: Value(ingredient.categoryName),
      servingSizeInGrams: Value(ingredient.servingSizeInGrams),
      calories: Value(ingredient.calories),
      protein: Value(ingredient.protein),
      carbs: Value(ingredient.carbs),
      fats: Value(ingredient.fats),
      version: Value(ingredient.version),
      isSynced: Value(ingredient.isSynced),
      updatedAt: Value(ingredient.updatedAt),
      createdAt: Value(ingredient.createdAt),
    );

    final id = await _db
        .into(_db.ingredients)
        .insert(companion, onConflict: DoUpdate((old) => companion, target: [_db.ingredients.id]));

    final result = await (_db.select(_db.ingredients)..where((t) => t.id.equals(id))).getSingle();
    return IngredientModel.fromCompanion(result);
  }

  @override
  Future<void> bulkSaveIngredients(List<IngredientModel> ingredients) async {
    await _db.batch((batch) {
      for (final ingredient in ingredients) {
        final companion = IngredientsCompanion(
          id: ingredient.id != null ? Value(ingredient.id!) : const Value.absent(),
          apiId: ingredient.apiId != null ? Value(ingredient.apiId!) : const Value.absent(),
          name: Value(ingredient.name),
          isUserGenerated: Value(ingredient.isUserGenerated),
          categoryId: Value(ingredient.categoryId),
          categoryName: Value(ingredient.categoryName),
          servingSizeInGrams: Value(ingredient.servingSizeInGrams),
          calories: Value(ingredient.calories),
          protein: Value(ingredient.protein),
          carbs: Value(ingredient.carbs),
          fats: Value(ingredient.fats),
          version: Value(ingredient.version),
          isSynced: Value(ingredient.isSynced),
          updatedAt: Value(ingredient.updatedAt),
          createdAt: Value(ingredient.createdAt),
        );
        batch.insert(
          _db.ingredients,
          companion,
          onConflict: DoUpdate((old) => companion, target: [_db.ingredients.apiId]),
        );
      }
    });
  }

  @override
  Future<void> deleteIngredient(IngredientModel ingredient) async {
    if (ingredient.id != null) {
      await (_db.delete(_db.ingredients)..where((t) => t.id.equals(ingredient.id!))).go();
    }
  }

  @override
  Future<void> deleteLog(DietLogDto log) async {
    if (log.id != null) {
      await (_db.delete(_db.dietLogs)..where((t) => t.id.equals(log.id!))).go();
    }
  }

  @override
  Future<List<DietLogDto>> getAllLogs() async {
    final result = await _db.select(_db.dietLogs).get();
    return result.map((e) => DietLogDto.fromCompanion(e)).toList();
  }

  @override
  Future<List<DietLogDto>> getTodayLogs() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    final query = _db.select(_db.dietLogs)
      ..where((tbl) => tbl.timestamp.isBiggerOrEqualValue(today) & tbl.timestamp.isSmallerThanValue(tomorrow));

    final result = await query.get();
    return result.map((e) => DietLogDto.fromCompanion(e)).toList();
  }

  @override
  Future<void> logMeal(DietLogDto log) async {
    await upsertDietLog(log);
  }

  @override
  Future<void> upsertDietLog(DietLogDto log) async {
    final companion = DietLogsCompanion(
      id: log.id != null ? Value(log.id!) : const Value.absent(),
      apiId: log.apiId != null ? Value(log.apiId!) : const Value.absent(),
      name: Value(log.ingredientName),
      totalGrams: Value(log.totalGrams),
      calories: Value(log.calories),
      protein: Value(log.protein),
      carbs: Value(log.carbs),
      fats: Value(log.fats),
      timestamp: Value(log.timestamp),
      version: Value(log.version),
      isSynced: Value(log.isSynced),
    );

    await _db
        .into(_db.dietLogs)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_db.dietLogs.id], // Conflict target is the id
          ),
        );
  }

  @override
  Future<DateTime?> getLastLibSync() async {
    final query = _db.selectOnly(_db.ingredients)..addColumns([_db.ingredients.updatedAt.max()]);

    final result = await query.getSingle();
    final latestDate = result.read(_db.ingredients.updatedAt.max());
    logger.d("isUtc: ${latestDate?.isUtc} $latestDate");

    return latestDate?.toLocal();
  }

  @override
  Future<List<IngredientModel>> getUserGeneratedContent() async {
    final query = _db.select(_db.ingredients)..where((tbl) => (tbl.isUserGenerated & tbl.isSynced.not()));

    final result = await query.get();
    return result.map((e) => IngredientModel.fromCompanion(e)).toList();
  }

  @override
  Future<List<DietLogDto>> getAllUnSyncedLogs() async {
    final query = _db.select(_db.dietLogs)..where((tbl) => tbl.isSynced.not());
    final result = await query.get();

    return result.map((l) => DietLogDto.fromCompanion(l)).toList();
  }

  @override
  Future<void> bulkSaveLogs(List<DietLogDto> logs) async {
    await _db.batch((batch) {
      for (final log in logs) {
        final companion = DietLogsCompanion.insert(
          apiId: Value(log.apiId),
          name: log.ingredientName,
          totalGrams: log.totalGrams,
          calories: log.calories,
          protein: log.protein,
          carbs: log.carbs,
          fats: log.fats,
          timestamp: log.timestamp,
          version: log.version,
          isSynced: true,
        );
        batch.insert(_db.dietLogs, companion);
      }
    });
  }
}
