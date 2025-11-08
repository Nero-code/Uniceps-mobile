import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

extension MeasurementsExtension on MeasurementModel {
  MeasurementsCompanion insertable() => MeasurementsCompanion.insert(
        height: height,
        weight: weight,
        lArm: lArm,
        rArm: rArm,
        lHumerus: lHumerus,
        rHumerus: rHumerus,
        lThigh: lThigh,
        rThigh: rThigh,
        lLeg: lLeg,
        rLeg: rLeg,
        neck: neck,
        shoulders: shoulders,
        waist: waist,
        chest: chest,
        hips: hips,
        checkDate: checkDate,
      );

  Insertable<Measurement> updatable() => MeasurementsCompanion.custom(
        height: Constant(height),
        weight: Constant(weight),
        lArm: Constant(lArm),
        rArm: Constant(rArm),
        lHumerus: Constant(lHumerus),
        rHumerus: Constant(rHumerus),
        lThigh: Constant(lThigh),
        rThigh: Constant(rThigh),
        lLeg: Constant(lLeg),
        rLeg: Constant(rLeg),
        neck: Constant(neck),
        shoulders: Constant(shoulders),
        waist: Constant(waist),
        chest: Constant(chest),
        hips: Constant(hips),
      );
}
