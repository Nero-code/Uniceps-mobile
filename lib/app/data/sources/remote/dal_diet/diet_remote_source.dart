import 'package:uniceps/app/data/models/diet_models/diet_log_dto.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/logging/app_logger.dart';

abstract class IDietRemoteSource {
  Future<List<IngredientModel>> loadIngredients({DateTime? lastSync});

  Future<String> uploadIngredient(IngredientModel userIng);

  Future<int> uploadDietLog(DietLogDto log);
}

class DietRemoteSource implements IDietRemoteSource {
  final HttpClientHelper _clientHelper;
  const DietRemoteSource({required HttpClientHelper clientHelper}) : _clientHelper = clientHelper;

  @override
  Future<List<IngredientModel>> loadIngredients({DateTime? lastSync}) async {
    final hasValidToken = await _clientHelper.tokenService.isTokenValid();
    return await _clientHelper.getListHandler(
      ApiRoutes.domain,
      ApiRoutes.ingredients,
      IngredientModel.fromJson,
      needsHeader: hasValidToken,
      queryParams: lastSync != null ? {'lastSync': lastSync.toIso8601String()} : null,
    );
  }

  @override
  Future<String> uploadIngredient(IngredientModel userIng) async {
    return await _clientHelper.postHandler(
      ApiRoutes.domain,
      ApiRoutes.ingredientsUpload,
      userIng.toJson(),
      fromJson: (json) {
        logger.d(json);
        return json['apiId'];
      },
    );
  }

  @override
  Future<int> uploadDietLog(DietLogDto log) async {
    return await _clientHelper.postHandler(
      ApiRoutes.domain,
      ApiRoutes.dietLogs,
      log.toJson(),
      fromJson: (json) {
        logger.d(json);
        return json['apiId'];
      },
    );
  }
}
