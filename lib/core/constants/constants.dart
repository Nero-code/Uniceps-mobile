// ignore_for_file: constant_identifier_names

//
//   A P P   C O N S T A N T S
//

import 'package:uniceps/core/helpers/version.dart';

const APP_NAME = 'Uniceps';
const APP_VERSION =
    "v${Version.currentMajor}.${Version.currentMinor}.${Version.currentPatch}.${Version.currentBuild}"
    "${String.fromEnvironment('VERSION_SUFFIX')}";

///   A P P   I M A G E S
const IMG_PREMIUM = "images/photos/premium.png";
const APP_LOGO = "images/logo/Logo.png";
const APP_LOGO_DARK = "images/logo/Logo-dark.png";
const APP_LOGO_LIGHT = "images/logo/Logo-light.png";
const APP_LOGO_WHITE = "images/logo/Logo-white.png";

const ASSET_QUOTES = 'assets/captain_quotes.json';

enum Gender {
  male(1),
  female(2);

  final int val;
  const Gender(this.val);
}

Gender parseGender(int val) => Gender.values.firstWhere((g) => g.val == val);

enum Goal {
  bulking(1),
  losingWeight(2),
  maintenance(3);

  final int val;
  const Goal(this.val);

  double get calorieModifier {
    switch (this) {
      case Goal.bulking:
        return 500.0;
      case Goal.losingWeight:
        return -500.0;
      case Goal.maintenance:
        return 0.0;
    }
  }
}

Goal parseGoal(int val) => Goal.values.firstWhere((g) => g.val == val);

enum ActivityLevel {
  sedentary(1),
  lightlyActive(2),
  moderatelyActive(3),
  veryActive(4),
  extraActive(5);

  final int val;
  const ActivityLevel(this.val);

  double get multiplier {
    switch (this) {
      case ActivityLevel.sedentary:
        return 1.2;
      case ActivityLevel.lightlyActive:
        return 1.375;
      case ActivityLevel.moderatelyActive:
        return 1.55;
      case ActivityLevel.veryActive:
        return 1.725;
      case ActivityLevel.extraActive:
        return 1.9;
    }
  }
}

ActivityLevel parseActivityLevel(int val) => ActivityLevel.values.firstWhere((a) => a.val == val);

enum Lang {
  en('en', 'English'),
  ar('ar', 'العربية');

  final String code;
  final String name;
  const Lang(this.code, this.name);
}

Lang parseLang(String lang) {
  return Lang.values.firstWhere((l) => l.code == lang.toLowerCase());
}

enum ThemeType { light, dark }
