import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IGymsLocalSource {
  // Gyms Responsibility
  Future<List<GymModel>> getGyms();
  Future<void> saveGyms(List<GymModel> list);
}

class GymsDBService implements IGymsLocalSource {
  final Box<Map<dynamic, dynamic>> gymsBox;

  const GymsDBService({required this.gymsBox});

  @override
  Future<List<GymModel>> getGyms() async {
    final list = <GymModel>[];

    for (var key in gymsBox.keys) {
      list.add(GymModel.fromJson(gymsBox.get(key)!));
    }

    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }

    return list;
  }

  @override
  Future<void> saveGyms(List<GymModel> list) async {
    for (var i in list) {
      await gymsBox.put(i.id, i.toJson());
    }
  }
}
