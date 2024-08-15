import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Training/data/models/presence_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Training/services/entities/avatar.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';

abstract class RemoteTrainingSource {
  Future<TrainingProgram> getTrainingProgram();
  Future<List<Gym>> getGyms();
  Future<List<PresenceModel>> getPresence(String gymId);
  Future<Avatar> getAvatar();
}

class RemoteTrainingSourceImpl implements RemoteTrainingSource {
  final http.Client client;

  /// This box is for granting access to user token effeciently
  final Box<Map<String, dynamic>> userBox;

  const RemoteTrainingSourceImpl({required this.client, required this.userBox});

  @override
  Future<TrainingProgram> getTrainingProgram() async {
    final res = await client.get(Uri.http(API, "/training", {}));
    print(res);
    print("status Code is: ${res.statusCode}");
    if (res.statusCode == 200) {
      print("status Code is: ${res.statusCode}");
      final temp = jsonDecode(res.body);
      print("res body: ${res.body}");

      print("temp: $temp");
      return TrainingProgramModel.fromJson(temp);
    }
    throw Exception();
  }

  @override
  Future<List<Gym>> getGyms() async {
    final res = await client.get(Uri.http(API, "/path", {}));
    final list = <Gym>[];
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      temp.map((e) => list.add(GymModel.fromJson(e)));
      return list;
    }
    throw Exception();
  }

  @override
  Future<List<PresenceModel>> getPresence(String gymId) {
    throw UnimplementedError();
  }

  @override
  Future<Avatar> getAvatar() {
    // TODO: implement getAvatar
    throw UnimplementedError();
  }
}
