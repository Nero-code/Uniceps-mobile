import 'package:uniceps/core/constants/constants.dart';

class PhysicalReport {
  /// BMI = `weight` / `sqr(height)`
  final double bmi;

  /// BMR (M) = `(10 * weight)` + `(6.25 * height)` - `(5 * ageInYears)`  `(+5 if Male)`
  ///
  /// BMR (F) = `(10 * weight)` + `(6.25 * height)` - `(5 * ageInYears)`  `(-161 if Female)`
  final double bmr;

  /// BF% (M) = `86.01 * log10(waist - neck) - 70.041 * log10(height)`
  ///
  /// BF% (F) = `163.205 * log10(waist + hips - neck) - 97.684 * log10(height)`
  final double bodyFatPercentage;

  final Gender gender;
  const PhysicalReport({
    required this.bmi,
    required this.bmr,
    required this.gender,
    required this.bodyFatPercentage,
  });
}
