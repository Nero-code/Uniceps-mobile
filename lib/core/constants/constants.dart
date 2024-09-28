// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:intl/intl.dart';

///
///   A P P   C O N S T A N T S
///

const APP_NAME = 'Uniceps';

const APP_LOGO = "images/logo/Logo.png";
const APP_LOGO_DARK = "images/logo/Logo-dark.png";
const APP_LOGO_LIGHT = "images/logo/Logo-light.png";

enum Gender { male, female }

enum Lang { en, ar }

enum ThemeType { light, dark }

const List<String> languageCodes = ['ar', 'en'];

const DATE_PATTERN = "dd/MM/yyyy";

///   A P P   I M A G E S

const PHOTOS_PATH = "images/photos/";

const IMG_BACK = "back.png";
const IMG_BLANK = "blank.png";
const IMG_CONTROL_PANAL = "control_panal.png";
const IMG_DEPARTING = "departing.png";
const IMG_DESKTOP = "desktop.png";
const IMG_EMPTY = "empty.png";
const IMG_EMPTY_2 = "empty_2.png";
const IMG_MEMORY = "memory.png";
const IMG_NO_INTERNET = "noInternet.png";
const IMG_SERVER_ERROR = "server_error.png";
const IMG_VOID = "void.png";
const IMG_WARNING = "warning.png";

///
///
///   A P I - U R L S
///
///

final HEADERS = {
  "Content-Type": "application/json",
  "Accept": "application/json",
  "version": "1.0.0",
  "Platform": Platform.isAndroid ? "Android" : "IOS",
  "os-version": Platform.operatingSystemVersion,
  "os": Platform.operatingSystem,
};

const FAKE_API = "https://uniapi-ui65lw0m.b4a.run/api/v1";
const API = "https://uniapi-ui65lw0m.b4a.run/api/v1";
const HTTP_REGISTER = "/auth";
const HTTP_VERIFY_CODE = "/auth/verify";

const HTTP_HANDSHAKE = "/handshake";

const HTTP_PLAYER_INFO = "/profile";

const HTTP_LOGIN = "";
const HTTP_FORGOT_PASSWORD = "";

const HTTP_TRAINING_PROGRAM = "/routines";
const HTTP_IMAGES = "/images";
const HTTP_SUBSCRIPTIONS = "/subscription";
const HTTP_MEASURMENTS = "/metrics";

const HTTP_PRESENCE = "/attendances";
const HTTP_GYMS = "/gyms";
const HTTP_GYM_LOGO = "/logos";

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

// ////////////////////////////////////////////////////////////////////////// //
//                H I V E   D A T A B A S E   S C H E M A
// ////////////////////////////////////////////////////////////////////////// //
//
// {
//    "user":
//      {
//        "player_info": {Player}         @Deprecated
//        "token": {Token}
//      }
//
//    ----------------------------------
//
//    "program": {TrainingProgram},
//
//    ----------------------------------
//
//    "Gyms":
//      {
//        "currentGym": {"gym_id"}
//        list["gym_id"]:
//        {
//          "metrics": [id1, id2, id3],
//          "SubScriptions": [id1, id2, id3],
//        }
//      }
//
//    ----------------------------------
//
//    "Presence":
//      {
//        "gymId": [ PresenceModel ]
//      }
//
//    ----------------------------------
//
//    "measure":
//      {
//        "gymId": [ MeasurementModel ]
//      }
//
//    ----------------------------------
//
//    "subs":
//      {
//        "gymId": [ SubscriptionModel ]
//      }
//    ----------------------------------
//
//    "avatar":

// }
//
// ////////////////////////////////////////////////////////////////////////// //

/// Pattern: [dd/MM/yyyy]
String dateToString(DateTime date) {
  return DateFormat("dd/MM/yyyy").format(date);
}

/// Pattern: [dd/MM/yyyy]
DateTime stringToDate(String source) {
  return DateFormat("dd/MM/yyyy").parse(source);
}

/// Exercises image url parser...
String imgUrlParser(int muscleG, String imgName) {
  return "$API"
      "$HTTP_TRAINING_PROGRAM"
      "$HTTP_IMAGES"
      "/$muscleG"
      "/$imgName"
      ".jpg";
}
