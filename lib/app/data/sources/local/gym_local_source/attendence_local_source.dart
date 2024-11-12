import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IAttendenceLocalSource {
  // Attendence Responsibility
  Future<List<Attendence>> getAttendenceAtGym(String gymId);
  Future<void> saveAttenenceAtGym(String gymId, List<Attendence> list);
}

class AttendenceLocalService implements IAttendenceLocalSource {
  final Box<List<dynamic>> attendBox;

  const AttendenceLocalService({required this.attendBox});

  @override
  Future<List<Attendence>> getAttendenceAtGym(String gymId) async {
    if (!attendBox.containsKey(gymId)) {
      throw EmptyCacheExeption();
    }
    final res = <Attendence>[];
    final list = attendBox.get(gymId)!;
    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    for (var i in list) {
      res.add(Attendence.fromJson(i));
    }
    return res;
  }

  @override
  Future<void> saveAttenenceAtGym(String gymId, List<Attendence> list) async {
    final temp = <Map>[];
    for (var i in list) {
      temp.add(i.toJson());
    }
    await attendBox.put(gymId, temp);
  }
}
