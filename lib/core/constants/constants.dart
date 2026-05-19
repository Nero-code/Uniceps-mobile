// ignore_for_file: constant_identifier_names

//
//   A P P   C O N S T A N T S
//

const APP_NAME = 'Uniceps';
const APP_VERSION = "v3.1.7+16${String.fromEnvironment('VERSION_SUFFIX')}";

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

///   A P P   I M A G E S

// const IMG_BACK = "images/photos/back.png";
// const IMG_BLANK = "images/photos/blank.png";
// const IMG_CONTROL_PANAL = "images/photos/control_panal.png";
// const IMG_DEPARTING = "images/photos/departing.png";
// const IMG_DESKTOP = "images/photos/desktop.png";
// const IMG_EMPTY = "images/photos/empty.png";
// const IMG_EMPTY_2 = "images/photos/empty_2.png";
// const IMG_MEMORY = "images/photos/memory.png";
// const IMG_NO_INTERNET = "images/photos/noInternet.png";
// const IMG_SERVER_ERROR = "images/photos/server_error.png";
// const IMG_SERVER_DOWN = "images/photos/server_down.png";
// const IMG_VOID = "images/photos/void.png";
// const IMG_WARNING = "images/photos/warning.png";
// const IMG_NO_PROGRAM = "images/photos/no_program.png";
// const IMG_NO_ATTENDENCE = "images/photos/attendence_err.png";
// const IMG_NO_MEASUREMENTS = "images/photos/measurements_err.png";
const IMG_PREMIUM = "images/photos/premium.png";
