// ignore_for_file: constant_identifier_names

//
//   A P P   C O N S T A N T S
//

const APP_NAME = 'Uniceps';
const APP_VERSION = "v3.2.0+17${String.fromEnvironment('VERSION_SUFFIX')}";

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
