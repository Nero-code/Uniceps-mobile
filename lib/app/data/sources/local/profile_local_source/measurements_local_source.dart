import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IMeasurementsLocalSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements();
  Future<void> saveMeasurements(List<MeasurementModel> list);
}

class MeasurementsDBService implements IMeasurementsLocalSource {
  MeasurementsDBService({
    required this.measureBox,
    required this.logger,
  });
  final Box<Map<dynamic, dynamic>> measureBox;
  final Logger logger;

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    final list = <MeasurementModel>[];
    for (var i in measureBox.keys) {
      list.add(MeasurementModel.fromJson(measureBox.get(i)!));
    }

    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    list.sort((a, b) {
      return b.checkDate.compareTo(a.checkDate);
    });
    return list;
  }

  /// Caches Measurements based on:
  ///
  /// Node [ID] : Value [Map]
  @override
  Future<void> saveMeasurements(List<MeasurementModel> list) async {
    logger.d("saveMsList ${list.length}");
    for (var i in list) {
      await measureBox.put(i.id, i.toJson());
    }
  }
}
