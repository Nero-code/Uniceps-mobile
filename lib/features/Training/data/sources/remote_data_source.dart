import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/data/models/handshake_model.dart';
// import 'package:uniceps/features/Training/data/models/presence_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';
// import 'package:uniceps/features/Training/services/entities/avatar.dart';

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

  Future<List<HandShakeModel>> getAllHandshakes();
}

class RemoteTrainingSourceImpl implements RemoteTrainingSource {
  final http.Client client;

  /// This box is for granting access to user token effeciently
  final Box<Map<dynamic, dynamic>> userBox, playerBox;
  // final Box<Map<String, double>> lastWBox;

  // final Box<Map<String, dynamic>> routineBox;

  final ImageCacheManager cacheManager;

  const RemoteTrainingSourceImpl({
    required this.client,
    required this.userBox,
    required this.playerBox,
    required this.cacheManager,
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
    print("HTTP_ROUTE: " "$API" "$HTTP_TRAINING_PROGRAM" "/$gymId" "/$pid");
    final res = await client.get(
        Uri.parse("$API" "$HTTP_TRAINING_PROGRAM" "/$gymId" "/$pid"),
        headers: {
          ...HEADERS,
          'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
        });

    print("status Code is: ${res.statusCode}");

    if (res.statusCode == 200) {
      print("status Code is: ${res.statusCode}");
      final temp = jsonDecode(res.body);
      // print("res body: ${res.body}");

      // print("temp: $temp");
      // print("weights: $weights");

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

  // @override
  // Future<List<PresenceModel>> getPresence(String gymId) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Avatar> getAvatar() {
  //   // TODO: implement getAvatar
  //   throw UnimplementedError();
  // }

  @override
  Future<List<HandShakeModel>> getAllHandshakes() async {
    print(
        "check 1 inside getCurrenthandshake: Playerbox.get(): ${playerBox.get(HIVE_PROFILE_BOX)}");
    final temp = <HandShakeModel>[];
    final res = await client.get(
      Uri.parse(
          "$API$HTTP_HANDSHAKE/${playerBox.get(HIVE_PROFILE_BOX)!['uid']}"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
    );
    print("hanshakes status code: ${res.statusCode}");
    print("Handshakes body: ${res.body}");
    if (res.statusCode == 200) {
      for (var i in jsonDecode(res.body)) {
        temp.add(HandShakeModel.fromJson(i));
      }

      temp.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      print("Handshakes: $temp");

      return temp;
    } else if (res.statusCode == 204) {
      print("hanshakes status code: ${res.statusCode}");
      throw NoGymSpecifiedException();
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
    print(res.statusCode);
    if (res.statusCode == 200) {
      print("Remote_S: getSubscribedToGyms: ${res.body}");
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
