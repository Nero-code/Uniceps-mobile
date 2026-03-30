// ignore_for_file: constant_identifier_names

//
//   A P P   C O N S T A N T S
//

const APP_NAME = 'Uniceps';
const APP_VERSION = "v2.1.11+11${String.fromEnvironment('VERSION_SUFFIX')}";

const APP_LOGO = "images/logo/Logo.png";
const APP_LOGO_DARK = "images/logo/Logo-dark.png";
const APP_LOGO_LIGHT = "images/logo/Logo-light.png";

const ASSET_QUOTES = 'assets/captain_quotes.json';

enum Gender {
  male(1),
  female(2);

  final int val;
  const Gender(this.val);
}

Gender parseGender(int val) => Gender.values.firstWhere((g) => g.val == val);

enum Lang {
  en('en'),
  ar('ar');

  final String val;
  const Lang(this.val);
}

Lang parseLang(String lang) {
  return Lang.values.firstWhere((l) => l.val == lang.toLowerCase());
}

enum ThemeType { light, dark }

///   A P P   I M A G E S

const IMG_BACK = "images/photos/back.png";
const IMG_BLANK = "images/photos/blank.png";
const IMG_CONTROL_PANAL = "images/photos/control_panal.png";
const IMG_DEPARTING = "images/photos/departing.png";
const IMG_DESKTOP = "images/photos/desktop.png";
const IMG_EMPTY = "images/photos/empty.png";
const IMG_EMPTY_2 = "images/photos/empty_2.png";
const IMG_MEMORY = "images/photos/memory.png";
const IMG_NO_INTERNET = "images/photos/noInternet.png";
const IMG_SERVER_ERROR = "images/photos/server_error.png";
const IMG_SERVER_DOWN = "images/photos/server_down.png";
const IMG_VOID = "images/photos/void.png";
const IMG_WARNING = "images/photos/warning.png";
const IMG_NO_PROGRAM = "images/photos/no_program.png";
const IMG_NO_ATTENDENCE = "images/photos/attendence_err.png";
const IMG_NO_MEASUREMENTS = "images/photos/measurements_err.png";
const IMG_PREMIUM = "images/photos/premium.png";

///
///
///   A P I - U R L S
///
///

// ignore: non_constant_identifier_names
// final HEADERS = {
//   "Content-Type": "application/json",
//   "Accept": "application/json",
//   "version": "1.0.0",
//   "Platform": Platform.isAndroid ? "Android" : "IOS",
//   "os-version": Platform.operatingSystemVersion,
//   "os": Platform.operatingSystem,
//   "build-number": Platform.operatingSystemVersion,
// };

/// TESTING URL
// const API = Env.baseUrl;

// const API = kDebugMode || kProfileMode ? r"https://uniceps.runasp.net/api" : r"https://uniceps.trio-verse.com/api/v1";

// const API_V2 = kDebugMode || kProfileMode ? r"uniceps.runasp.net" : r"uniceps.trio-verse.com/api/v1";
// const API_V2 = r"uniceps.runasp.net";
// const API_V2 = r"uniapi.trio-verse.com";
// const API_V2 = String.fromEnvironment('API_URL');

/// PRODUCTION URL
// const API = r"https://uniceps.trio-verse.com/api/v1";

/// https://trio-verse.com
// const URL = "https://uniceps.trio-verse.com";
// const TELEGRAM = String.fromEnvironment('TELEGRAM');
// const DELETE_ACCOUNT = "https://uniceps.trio-verse.com/privacy";
// const HTTP_REFRESH = "/refresh";
// const HTTP_HANDSHAKE = "/handshake";
// const HTTP_GUEST_MODE = "/guest";

// const HTTP_ACCESS_TOKEN = '';
//
// const HTTP_PLAYER_INFO = "/profile";
// const HTTP_PLAYER = "/player";
//
// const HTTP_LOGIN = "";
// const HTTP_FORGOT_PASSWORD = "";
//
// const HTTP_TRAINING_PROGRAM = "/routines";
// const HTTP_IMAGES = "/images";
// const HTTP_SUBSCRIPTIONS = "/subscription";
// const HTTP_MEASURMENTS = "/metrics";
// const HTTP_PRESENCE = "/attendances";
// const HTTP_GYMS = "/gyms";
// const HTTP_GYM_LOGO = "/logos";
//
// // V2 Routes
// const HTTP_SESSION_SYNC = '/api/Workout';
// const HTTP_MEMBERSHIP = "/api/Membership/0";
// const HTTP_REGISTER = "/api/Authentication";
// const HTTP_REFRESH_TOKEN = '/api/Authentication/RefreshToken';
// const HTTP_VERIFY_CODE = "/api/Authentication/VerifyOtp";
// const HTTP_PLAN = "/api/Plan/0";
// const HTTP_BUY_PLAN = "/api/Membership";
// const HTTP_MUSCLE_GROUPS = "/api/MuscleGroup";
// const HTTP_EXERCISES = "/api/ExerciseV2";
// const HTTP_DEVICE_INFO = "/api/UserDevice";

///
///    A P P - R O U T E S
///
///////////////////////////////////////////////////////////////////////////////

// const ROUTE_SPLASH = '/';
//
// ///
// ///   A U T H   R O U T E S
// ///
// const ROUTE_AUTH = '/auth';
// const ROUTE_FORGOT_PASSWORD = '/forgot_password';
//
// ///
// ///   M A I N   R O U T E S
// ///
// const ROUTE_HOME = '/home';
// const ROUTE_HANDSHAKE = '/home/handshake';
// const ROUTE_PROFILE = '/home/profile';
// const ROUTE_GYMS_LIST = '/home/profile/gyms_list';
// const ROUTE_EXERCISE = '/home/exercise';
// const ROUTE_SUBSCRIPTIONS = '/home/profile/subscriptions';
// const ROUTE_MEASUREMENTS = '/home/profile/measurements';
// const ROUTE_ABOUT = "/home/profile/about";
//
// ///
// ///   A U X I L I A R Y   R O U T E S
// ///
// const ROUTE_QR_SCANNER = '/home/qr_scanner';
// const ROUTE_PLAYER_INFO = '/player_info';
// const ROUTE_PRESENCE = '/home/profile/presence';

///
///   H I V E   T A B L E S   N A M E S
///

// const HIVE_PROFILE_BOX = "player_info";
// const HIVE_USER_BOX = "user";
// const HIVE_TRAINING_BOX = "trainingProgram";
// const HIVE_LAST_WEIGHT_BOX = "lastWeightBox";
// const HIVE_MEASURE_BOX = "measurements";

/// Pattern: [yyyy-MM-ddThh:mm:ss]
// String dateToString(DateTime date) {
//   return DateFormat("yyyy-MM-ddThh:mm:ssZ").format(date);
// }
//
// /// Pattern: [yyyy-MM-ddThh:mm:ss]
// DateTime stringToDate(String source) {
//   return DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(source, true);
// }
