import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/diet_models/diet_log_dto.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/dal_diet/diet_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_diet/diet_remote_source.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class DietRepo implements IDietService {
  final IDietLocalSource _localSource;
  final IDietRemoteSource _remoteSource;

  List<Ingredient> allIngredients = [];

  DietRepo({required IDietLocalSource localSource, required IDietRemoteSource remoteSource})
    : _localSource = localSource,
      _remoteSource = remoteSource;

  @override
  Future<Either<IngredientFailure, List<Ingredient>>> loadIngredients({String language = 'en'}) async {
    try {
      // 1. Use memory cache if available
      if (allIngredients.isNotEmpty) return Right(allIngredients);

      // 2. Fetch what we have locally
      var models = await _localSource.getIngredients();

      // 3. Seed library from remote ONLY if it's missing (typically on first install)
      final hasLibraryItems = models.any((i) => !i.isUserGenerated);
      if (!hasLibraryItems) {
        try {
          final remoteData = await _remoteSource.loadIngredients(language: language);
          await _localSource.bulkSaveIngredients(remoteData);
          // Refresh local list to include newly saved library items
          models = await _localSource.getIngredients();
        } catch (remoteError) {
          // Log error but don't fail the whole operation.
          // The user can still use their local/custom ingredients.
        }
      }

      allIngredients = (models.map((i) => i.toEntity()).toList()..sort((a, b) => a.name.compareTo(b.name)));
      return Right(allIngredients);
    } catch (e) {
      return Left(IngredientFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<IngredientFailure, bool>> changeIngredientsLanguage({required String language}) async {
    try {
      final remoteData = await _remoteSource.loadIngredients(language: language);
      await _localSource.bulkSaveIngredients(remoteData);
      allIngredients = remoteData.map((e) => e.toEntity()).toList();
      return const Right(true);
    } catch (remoteError) {
      return const Left(.iOffline());
    }
  }

  @override
  Future<Either<IngredientFailure, List<Ingredient>>> filterIngredientsBy({
    String searchString = '',
    int? categoryId,
  }) async {
    logger.d("allIngredients length: ${allIngredients.length}");
    try {
      if (searchString.isEmpty && categoryId == null) return Right(allIngredients);

      final query = searchString.toLowerCase();
      final filteredList = allIngredients.where((i) {
        final matchesSearch = searchString.isEmpty || i.name.toLowerCase().contains(query);
        final matchesCategory = categoryId == null || i.categoryId == categoryId;
        return matchesSearch && matchesCategory;
      }).toList();

      return Right(filteredList);
    } catch (e) {
      return Left(IngredientFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<IngredientFailure, Ingredient>> saveIngredient(Ingredient ingredient) async {
    try {
      final model = IngredientModel.fromEntity(ingredient);
      final savedModel = await _localSource.saveIngredient(model);
      final savedEntity = savedModel.toEntity();

      // Update memory cache
      final index = allIngredients.indexWhere((i) => i.id == savedEntity.id);
      if (index != -1) {
        allIngredients[index] = savedEntity;
      } else {
        allIngredients.add(savedEntity);
      }

      return Right(savedEntity);
    } catch (e) {
      return Left(IngredientFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<IngredientFailure, Unit>> bulkSaveIngredients(List<Ingredient> ingredients) async {
    try {
      final models = ingredients.map((e) => IngredientModel.fromEntity(e)).toList();
      await _localSource.bulkSaveIngredients(models);

      // Force cache refresh on next load or update locally
      // For simplicity, we just clear the cache so it reloads from DB
      allIngredients.clear();

      return const Right(unit);
    } catch (e) {
      return Left(IngredientFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<IngredientFailure, Unit>> deleteIngredient(Ingredient ingredient) async {
    try {
      await _localSource.deleteIngredient(IngredientModel.fromEntity(ingredient));
      allIngredients.removeWhere((i) => i.id == ingredient.id);
      return const Right(unit);
    } catch (e) {
      return Left(IngredientFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<DietLogFailure, List<DietLog>>> getAllLogs() async {
    try {
      final res = await _localSource.getAllLogs();
      if (res.isEmpty) return const Left(DietLogFailure.noLogsEver());
      return Right(res.map((log) => log.toEntity()).toList());
    } catch (e) {
      return Left(DietLogFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<DietLogFailure, List<DietLog>>> getLogsForDate(DateTime date) async {
    try {
      final res = await _localSource.getLogsForDate(date);
      if (res.isEmpty) return const Left(DietLogFailure.noLogsToday());
      return Right(res.map((log) => log.toEntity()).toList());
    } catch (e) {
      return Left(DietLogFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<DietLogFailure, Unit>> logMeal(DietLog log) async {
    try {
      await _localSource.upsertDietLog(DietLogDto.fromEntity(log));
      return const Right(unit);
    } catch (e) {
      return Left(DietLogFailure.databaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<DietLogFailure, Unit>> deleteLog(DietLog log) async {
    try {
      await _localSource.deleteLog(DietLogDto.fromEntity(log));
      return const Right(unit);
    } catch (e) {
      return Left(DietLogFailure.databaseFailure(message: e.toString()));
    }
  }
}
