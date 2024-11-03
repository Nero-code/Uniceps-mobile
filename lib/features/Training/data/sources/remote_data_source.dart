import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';

abstract class RemoteTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram({
    required String gymId,
    required String pid,
    required Map<String, double> weights,
  });
  Future<List<GymModel>> getGyms();
  Future<List<GymModel>> getSubscribedToGyms();
  // Future<List<PresenceModel>> getPresence(String gymId);
  // Future<Avatar> getAvatar();
}

class RemoteTrainingSourceImpl implements RemoteTrainingSource {
  final http.Client client;

  /// This box is for granting access to user token effeciently
  final Box<Map<dynamic, dynamic>> userBox, playerBox, trainBox;
  // final Box<Map<String, double>> lastWBox;

  // final Box<Map<String, dynamic>> routineBox;

  final ImageCacheManager cacheManager;
  final Logger logger;

  const RemoteTrainingSourceImpl({
    required this.client,
    required this.userBox,
    required this.playerBox,
    required this.cacheManager,
    required this.logger,
    required this.trainBox,
    // required this.lastWBox,
  });

  ///   This method calls the api with url: GET -> API/routine/gym_id/pid
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

    if (res.statusCode == 200) {
      logger.t("status Code is: ${res.statusCode}");
      final temp = jsonDecode(res.body);
      // logger.t("res body: ${res.body}");

      // logger.t("temp: $temp");
      // logger.t("weights: $weights");

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

  @override
  Future<List<GymModel>> getGyms() async {
    final res = await client.get(Uri.http(API, "/path", {}));
    final list = <GymModel>[];
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      temp.map((e) => list.add(GymModel.fromJson(e)));
      return list;
    }
    throw ServerException();
  }

  /// throws [NoGymSpecifiedException], [ServerException]
  @override
  Future<List<GymModel>> getSubscribedToGyms() async {
    final list = <GymModel>[];
    final res = await client.get(
      Uri.parse(
        "$API" "$HTTP_GYMS" "/shakes",
      ),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!['token'],
      },
    );
    logger.t(res.statusCode);
    if (res.statusCode == 200) {
      logger.t("Remote_S: getSubscribedToGyms: ${res.body}");
      for (var i in jsonDecode(res.body)) {
        list.add(GymModel.fromJson(i));
      }

      return list;
    } else if (res.statusCode == 204) {
      throw NoGymSpecifiedException();
    }
    throw ServerException();
  }
}
