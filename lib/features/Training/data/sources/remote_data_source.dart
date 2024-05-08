import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';

abstract class RemoteTrainingSource {
  Future<TrainingProgram> getTrainingProgram();
  Future<List<Gym>> getGyms();
}

class RemoteTrainingSourceImpl implements RemoteTrainingSource {
  final http.Client client;

  const RemoteTrainingSourceImpl(this.client);

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
}
