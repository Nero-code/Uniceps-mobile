import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/training_models/training_prog_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';

abstract class ITrainingRemoteSource {
  Future<TrainingProgramModel> getTrainingProgram({
    required String gymId,
    required String pid,
    required Map<String, double> weights,
  });
}

class TrainingAPISource implements ITrainingRemoteSource {
  final http.Client client;

  /// This box is for granting access to user token effeciently
  final Box<Map<dynamic, dynamic>> userBox, trainBox;

  /// This service is for custom caching for routine images
  ///
  /// it provides a Reactive way of downloading the required
  /// images and gives notifications upon download update.
  final ImageCacheManager cacheManager;

  /// This is a simple logger object.
  ///
  /// Needs more refactoring to implement different logging framworks
  final Logger logger;

  const TrainingAPISource({
    required this.client,
    required this.userBox,
    required this.cacheManager,
    required this.logger,
    required this.trainBox,
    // required this.lastWBox,
  });

  ///   This method calls the api with url: GET -> {API} / routine / {gym_id} / {pid}
  ///
  ///   throws [EmptyCacheExeption], [ServerException]
  @override
  Future<TrainingProgramModel> getTrainingProgram({
    required String gymId,
    required String pid,
    required Map<String, double> weights,
  }) async {
    logger.t("HTTP_ROUTE: " "$API" "$HTTP_TRAINING_PROGRAM" "/$gymId" "/$pid");
    final res = await client.get(
        Uri.parse("$API" "$HTTP_TRAINING_PROGRAM" "/$gymId" "/$pid"),
        headers: {
          ...HEADERS,
          'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
        });

    logger.t("status Code is: ${res.statusCode}");
    logger.t("response body:  ${res.body}");
    if (res.statusCode == 200) {
      logger.t("status Code is: ${res.statusCode}");
      final temp = jsonDecode(res.body);

      //  /////////////////////////////////
      //
      //  CACHE PROGRAM IMAGES BEFORE PARSE
      //

      final images =
          await cacheManager.getAndCacheImages(temp['routine_items']);
      //
      //  /////////////////////////////////
      return TrainingProgramModel.fromJson(
        json: temp,
        weights: weights,
        images: images,
      );
    } else if (res.statusCode == 204) {
      await trainBox.delete(gymId);
      throw NoTrainingProgramException();
    }
    throw ServerException();
  }
}
