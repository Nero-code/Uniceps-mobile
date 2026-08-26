import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/app/data/services/unifile/unifile.dart';
import 'package:uniceps/app/domain/classes/routine_classes/premade_routine.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IRoutineRemoteSourceContract {
  Future<List<PremadeRoutine>> getPremadeRoutines(Gender gender, String languageCode);

  Future<UniFile> downloadRoutine(String apiId, String languageCode);
  // Future<void> createRoutines(RoutineDto dto);
  // Future<void> updateRoutines(RoutineDto dto);
  // Future<void> deleteRoutines(RoutineDto dto);
  // Future<void> shareRoutines(RoutineDto dto, String userId);
}

class RoutinesRemoteSource implements IRoutineRemoteSourceContract {
  final HttpClientHelper _clientHelper;
  const RoutinesRemoteSource({required HttpClientHelper clientHelper}) : _clientHelper = clientHelper;

  @override
  Future<List<PremadeRoutine>> getPremadeRoutines(Gender gender, String languageCode) async {
    return await _clientHelper.getListHandler(
      ApiRoutes.domain,
      ApiRoutes.premadeRoutines,
      PremadeRoutine.fromJson,
      queryParams: {'targetGender': gender.val.toString()},
      needsHeader: false,
      headers: {'Accept-Language': languageCode},
    );
  }

  @override
  Future<UniFile> downloadRoutine(String apiId, String languageCode) async {
    return await _clientHelper.getHandler(
      ApiRoutes.domain,
      ApiRoutes.getPremadeRoutine(apiId),
      UniFile.fromJson,
      needsHeader: false,
      headers: {'Accept-Language': languageCode},
    );
  }
}
