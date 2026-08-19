import 'dart:math' as math;

import 'package:uniceps/core/constants/constants.dart';

double calculateBMI({required double weight, required double height}) {
  if (height <= 0) return 0;
  return weight / math.pow(height / 100, 2);
}

double calculateBMR({required double weight, required double height, required int age, required Gender gender}) {
  return (10 * weight) + (6.25 * height) - (5 * age) + (gender == Gender.male ? 5 : -161);
}

double calculateBodyFat({
  required Gender gender,
  required double height,
  required double waist,
  required double neck,
  double? hips, // Only needed for females
}) {
  double bf = 0;
  if (gender == Gender.male && waist - neck > 0 && height > 0) {
    bf = 86.01 * _log10(waist - neck) - 70.041 * _log10(height) + 36.76;
  } else if (gender == Gender.female && hips != null && waist + hips - neck > 0 && height > 0) {
    bf = 163.205 * _log10(waist + hips - neck) - 97.684 * _log10(height) - 78.387;
  }
  return bf;
}

double _log10(num x) => math.log(x) / math.ln10;
