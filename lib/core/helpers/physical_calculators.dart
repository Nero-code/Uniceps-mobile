import 'dart:math' as math;

import 'package:uniceps/core/constants/constants.dart';

double calculateBMI({required double weight, required double height}) {
  if (height <= 0) return 0;
  return weight / math.pow(height / 100, 2);
}

double calculateBMR({required double weight, required double height, required int age, required Gender gender}) {
  return (10 * weight) + (6.25 * height) - (5 * age) + (gender == Gender.male ? 5 : -161);
}

// double calculateBodyFat({
//   required Gender gender,
//   required double height,
//   required double waist,
//   required double neck,
//   double? hips, // Only needed for females
// }) {
//   double bf = 0;
//   if (gender == Gender.male && waist - neck > 0 && height > 0) {
//     bf = 86.01 * _log10(waist - neck) - 70.041 * _log10(height) + 36.76;
//   } else if (gender == Gender.female && hips != null && waist + hips - neck > 0 && height > 0) {
//     bf = 163.205 * _log10(waist + hips - neck) - 97.684 * _log10(height) - 78.387;
//   }
//   return bf;
// }

double calculateBodyFat({
  required Gender gender,
  required double height, // in cm
  required double waist, // in cm
  required double neck, // in cm
  double? hips, // in cm (required for females)
}) {
  if (height <= 0) return 0;

  double bodyDensity = 0;

  if (gender == Gender.male) {
    double delta = waist - neck;
    if (delta <= 0) return 0;

    bodyDensity = 1.0324 - (0.19077 * _log10(delta)) + (0.15456 * _log10(height));
  } else {
    if (hips == null) return 0;
    double delta = waist + hips - neck;
    if (delta <= 0) return 0;

    bodyDensity = 1.29579 - (0.35004 * _log10(delta)) + (0.22100 * _log10(height));
  }

  if (bodyDensity <= 0) return 0;

  double bodyFat = (495 / bodyDensity) - 450;
  return bodyFat.clamp(0, 100); // Ensures result stays within reasonable bounds
}

double _log10(num x) => math.log(x) / math.ln10;
