// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
// import 'package:uniceps/core/environments/env.dart';

///
///   A P P   C O N S T A N T S
///

const APP_NAME = 'Uniceps';
const APP_VERSION = 'v2.0.0';
const APP_RELEASE_DATE = '10/10/2024';

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

String encodeTranslations(Map<Lang, String> trans) => jsonEncode(trans.map(
      (key, value) => MapEntry(key.name, value),
    ));

Map<Lang, String> parseTranslations(String muscleGroupTranslations) {
  final dec = jsonDecode(muscleGroupTranslations) as Map;
  return dec.map<Lang, String>((key, value) => MapEntry(parseLang(key.toString()), value.toString()));
}

Map<Lang, String> parseTransFromFile(Map<String, dynamic> muscleGroupTranslations) {
  return muscleGroupTranslations.map<Lang, String>((key, value) => MapEntry(parseLang(key), value.toString()));
}

Lang parseLang(String lang) {
  return Lang.values.firstWhere(
    (l) => l.val == lang.toLowerCase(),
  );
}

enum ThemeType { light, dark }

// const List<String> languageCodes = ['ar', 'en'];

// const DATE_PATTERN = "dd/MM/yyyy";

final trSections = [
  const MuscleGroup(
    apiId: 4,
    muscleGroupTranslations: {Lang.en: "Legs", Lang.ar: "أرجل"},
  ),
  const MuscleGroup(
    apiId: 7,
    muscleGroupTranslations: {Lang.en: "Calves", Lang.ar: "بطة الرجل"},
  ),
  const MuscleGroup(
    apiId: 1,
    muscleGroupTranslations: {Lang.en: "Chest", Lang.ar: "صدر"},
  ),
  const MuscleGroup(
    apiId: 3,
    muscleGroupTranslations: {Lang.en: "Back", Lang.ar: "ظهر"},
  ),
  const MuscleGroup(
    apiId: 2,
    muscleGroupTranslations: {Lang.en: "Shoulder", Lang.ar: "أكتاف"},
  ),
  const MuscleGroup(
    apiId: 5,
    muscleGroupTranslations: {Lang.en: "Biceps", Lang.ar: "باي"},
  ),
  const MuscleGroup(
    apiId: 6,
    muscleGroupTranslations: {Lang.en: "Triceps", Lang.ar: "تراي"},
  ),
  const MuscleGroup(
    apiId: 8,
    muscleGroupTranslations: {Lang.en: "Abs", Lang.ar: "معدة"},
  ),
];

// final arTrSections = [
//   const MuscleGroup(arGroupName: "أرجل", id: 4),
//   const MuscleGroup(arGroupName: "بطة الرجل", id: 7),
//   const MuscleGroup(arGroupName: "صدر", id: 1),
//   const MuscleGroup(arGroupName: "ظهر", id: 3),
//   const MuscleGroup(arGroupName: "أكتاف", id: 2),
//   const MuscleGroup(arGroupName: "باي", id: 5),
//   const MuscleGroup(arGroupName: "تراي", id: 6),
//   const MuscleGroup(arGroupName: "معدة", id: 8),
// ];

///   A P P   I M A G E S

// const PHOTOS_PATH = "images/photos/";

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
final HEADERS = {
  "Content-Type": "application/json",
  "Accept": "application/json",
  "version": "1.0.0",
  "Platform": Platform.isAndroid ? "Android" : "IOS",
  "os-version": Platform.operatingSystemVersion,
  "os": Platform.operatingSystem,
  "build-number": Platform.operatingSystemVersion,
};

/// TESTING URL
// const API = Env.baseUrl;

const API = kDebugMode || kProfileMode ? r"https://uniceps.runasp.net/api" : r"https://uniceps.trio-verse.com/api/v1";

// const API_V2 = kDebugMode || kProfileMode ? r"uniceps.runasp.net" : r"uniceps.trio-verse.com/api/v1";
const API_V2 = r"uniceps.runasp.net";
// const API_V2 = r"uniceps.trio-verse.com/api/v1";

/// PRODUCTION URL
// const API = r"https://uniceps.trio-verse.com/api/v1";

/// https://trio-verse.com
const URL = "https://trio-verse.com";
const TELEGRAM = "https://t.me/uniceps_bot";
const HTTP_REFRESH = "/refresh";
const HTTP_HANDSHAKE = "/handshake";
const HTTP_GUEST_MODE = "/guest";

const HTTP_REFRESH_TOKEN = '';
const HTTP_ACCESS_TOKEN = '';

const HTTP_PLAYER_INFO = "/profile";
const HTTP_PLAYER = "/player";

const HTTP_LOGIN = "";
const HTTP_FORGOT_PASSWORD = "";

const HTTP_TRAINING_PROGRAM = "/routines";
const HTTP_IMAGES = "/images";
const HTTP_SUBSCRIPTIONS = "/subscription";
const HTTP_MEASURMENTS = "/metrics";
const HTTP_PRESENCE = "/attendances";
const HTTP_GYMS = "/gyms";
const HTTP_GYM_LOGO = "/logos";

// V2 Routes
const HTTP_SESSION_SYNC = '/api/Workout';
const HTTP_MEMBERSHIP = "/api/Membership";
const HTTP_REGISTER = "/api/Authentication";
const HTTP_VERIFY_CODE = "/api/Authentication/VerifyOtp";
const HTTP_PLAN = "/api/Plan/0";
const HTTP_BUY_PLAN = "/api/Membership";
const HTTP_MUSCLE_GROUPS = "/api/MuscleGroup";
const HTTP_EXERCISES = "/api/Exercise";

// name: uniceps
// description: A new Flutter project.
// # The following line prevents the package from being accidentally published to
// # pub.dev using `flutter pub publish`. This is preferred for private packages.
// publish_to: 'none' # Remove this line if you wish to publish to pub.dev

// # The following defines the version and build number for your application.
// # A version number is three numbers separated by dots, like 1.2.43
// # followed by an optional build number separated by a +.
// # Both the version and the builder number may be overridden in flutter
// # build by specifying --build-name and --build-number, respectively.
// # In Android, build-name is used as versionName while build-number used as versionCode.
// # Read more about Android versioning at https://developer.android.com/studio/publish/versioning
// # In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
// # Read more about iOS versioning at
// # https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
// # In Windows, build-name is used as the major, minor, and patch parts
// # of the product and file versions while build-number is used as the build suffix.
// version: 2.1.8+9

// environment:
//   sdk: '>=3.1.3 <4.0.0'

// # Dependencies specify other packages that your package needs in order to work.
// # To automatically upgrade your package dependencies to the latest versions
// # consider running `flutter pub upgrade --major-versions`. Alternatively,
// # dependencies can be manually updated by changing the version numbers below to
// # the latest version available on pub.dev. To see which dependencies have newer
// # versions available, run `flutter pub outdated`.
// dependencies:
//   flutter:
//     sdk: flutter


//   # The following adds the Cupertino Icons font to your application.
//   # Use with the CupertinoIcons class for iOS style icons.
//   cupertino_icons: ^1.0.2
//   animations: ^2.0.11
//   dartz: ^0.10.1
//   equatable: ^2.0.5
//   flutter_bloc: ^8.1.4
//   get_it: ^7.6.7
//   flutter_localizations:
//     sdk: flutter
//   intl: ^0.19.0
//   shared_preferences: ^2.2.2
//   # change_app_package_name: ^1.1.0
//   firebase_core: ^2.24.2
//   qr_flutter: ^4.1.0
//   table_calendar: ^3.0.9
//   flutter_launcher_icons: ^0.13.1
//   internet_connection_checker: ^1.0.0+1
//   http: ^1.2.2
//   hive_flutter: ^1.1.0
//   firebase_messaging: ^14.7.10
//   cached_network_image: ^3.3.1
//   sliding_up_panel: ^2.0.0+1
//   google_fonts: ^6.2.1
//   animated_flip_card: ^1.0.2
//   url_launcher: ^6.3.0
//   alert_banner: ^1.0.1
//   path_provider: ^2.1.4
//   logger: ^2.4.0
//   drift: ^2.23.1
//   drift_flutter: ^0.2.0
//   freezed_annotation: 2.4.1
//   json_annotation: ^4.9.0
//   flutter_secure_storage: ^9.2.4
//   sqlite3_flutter_libs: ^0.5.33
//   file_selector: ^1.0.3
//   flutter_local_notifications: ^19.5.0

// dev_dependencies:
//   flutter_test:
//     sdk: flutter

//   # The "flutter_lints" package below contains a set of recommended lints to
//   # encourage good coding practices. The lint set provided by the package is
//   # activated in the `analysis_options.yaml` file located at the root of your
//   # package. See that file for information about deactivating specific lint
//   # rules and activating additional ones.
//   flutter_lints: ^3.0.2
//   mockito: ^5.4.4
//   build_runner: ^2.4.9
//   faker: ^2.2.0
//   drift_dev: ^2.23.1
//   freezed: 2.4.6
//   json_serializable: ^6.9.0

// # Flutter launcher icons Creates App Logo for all platforms
// flutter_launcher_icons:
//   android: "launcher_icon"
//   ios: true
//   image_path: "images/logo/launcher.png"
//   min_sdk_android: 21 # android min sdk min:16, default 21
  
// # For information on the generic Dart part of this file, see the
// # following page: https://dart.dev/tools/pub/pubspec

// # The following section is specific to Flutter packages.
// flutter:
//   generate: true
//   # The following line ensures that the Material Icons font is
//   # included with your application, so that you can use the icons in
//   # the material Icons class.
//   uses-material-design: true

//   # To add assets to your application, add an assets section, like this:
//   assets:
//     - images/
//     - images/logo/
//     - images/photos/
//     - images/muscle-groups/
//     - images/test_imgs/
//     - images/cap_uni/
//     - assets/captain_quotes.json
//     - assets/cap_motive.txt

//   # An image asset can refer to one or more resolution-specific "variants", see
//   # https://flutter.dev/assets-and-images/#resolution-aware

//   # For details regarding adding assets from package dependencies, see
//   # https://flutter.dev/assets-and-images/#from-packages

//   # To add custom fonts to your application, add a fonts section here,
//   # in this "flutter" section. Each entry in this list should have a
//   # "family" key with the font family name, and a "fonts" key with a
//   # list giving the asset and other descriptors for the font. For
//   # example:
//   fonts:
//     - family: Cairo
//       fonts:
//         - asset: fonts/cairo/Cairo-ExtraLight.ttf
//           weight: 200
//         - asset: fonts/cairo/Cairo-Light.ttf
//           weight: 300
//         - asset: fonts/cairo/Cairo-Regular.ttf
//           weight: 400
//         - asset: fonts/cairo/Cairo-Medium.ttf
//           weight: 500
//         - asset: fonts/cairo/Cairo-SemiBold.ttf
//           weight: 600
//         - asset: fonts/cairo/Cairo-Bold.ttf
//           weight: 700
//         - asset: fonts/cairo/Cairo-ExtraBold.ttf
//           weight: 800
//         - asset: fonts/cairo/Cairo-Black.ttf
//           weight: 900
    
//     - family: Playwrite
//       fonts:
//         - asset: fonts/playwrite/Playwrite-ExtraLight.ttf
//           weight: 200
//         - asset: fonts/playwrite/Playwrite-Light.ttf
//           weight: 300
//         - asset: fonts/playwrite/Playwrite-Regular.ttf
//           weight: 400

//   #   - family: Trajan Pro
//   #     fonts:
//   #       - asset: fonts/TrajanPro.ttf
//   #       - asset: fonts/TrajanPro_Bold.ttf
//   #         weight: 700
//   #
//   # For details regarding fonts from package dependencies,
//   # see https://flutter.dev/custom-fonts/#from-packages


///////////////////////////////////////////////////////////////////////////////
///
///    A P P - R O U T E S
///
///////////////////////////////////////////////////////////////////////////////

const ROUTE_SPLASH = '/';

///
///   A U T H   R O U T E S
///
const ROUTE_AUTH = '/auth';
const ROUTE_FORGOT_PASSWORD = '/forgot_password';

///
///   M A I N   R O U T E S
///
const ROUTE_HOME = '/home';
const ROUTE_HANDSHAKE = '/home/handshake';
const ROUTE_PROFILE = '/home/profile';
const ROUTE_GYMS_LIST = '/home/profile/gyms_list';
const ROUTE_EXERCISE = '/home/exercise';
const ROUTE_SUBSCRIPTIONS = '/home/profile/subscriptions';
const ROUTE_MEASUREMENTS = '/home/profile/measurements';
const ROUTE_ABOUT = "/home/profile/about";

///
///   A U X I L I A R Y   R O U T E S
///
const ROUTE_QR_SCANNER = '/home/qr_scanner';
const ROUTE_PLAYER_INFO = '/player_info';
const ROUTE_PRESENCE = '/home/profile/presence';

///
///   H I V E   T A B L E S   N A M E S
///

const HIVE_PROFILE_BOX = "player_info";
const HIVE_USER_BOX = "user";
const HIVE_TRAINING_BOX = "trainingProgram";
const HIVE_LAST_WEIGHT_BOX = "lastWeightBox";
const HIVE_MEASURE_BOX = "measurements";

/// Pattern: [yyyy-MM-ddThh:mm:ss]
String dateToString(DateTime date) {
  return DateFormat("yyyy-MM-ddThh:mm:ssZ").format(date);
}

/// Pattern: [yyyy-MM-ddThh:mm:ss]
DateTime stringToDate(String source) {
  return DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(source, true);
}

/// Exercises image url parser...
String imgUrlParser(int muscleG, String imgName) {
  return "$API"
      "$HTTP_TRAINING_PROGRAM"
      "$HTTP_IMAGES"
      "/$muscleG"
      "/$imgName"
      ".png";
}
