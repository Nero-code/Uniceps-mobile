const APP_NAME = 'Uniceps';

enum Gender {
  male,
  female,
}

enum Lang {
  en,
  ar,
}

enum ThemeType {
  light,
  dark,
}

const List<String> languageCodes = ['ar', 'en'];

enum MuscleGroup {
  arms,
  legs,
  abdomin,
  shoulders,
  chest,
  tripez,
}

////////////////////////////////////////////////////////////////////////////////
///
///   A P I   U R L S
///
////////////////////////////////////////////////////////////////////////////////

const API = "https://www.uniceps.com/api/v1";
const FAKE_API = "http://192.168.1.10:5000";

////////////////////////////////////////////////////////////////////////////////
///
///   A P P   R O U T E S
///
////////////////////////////////////////////////////////////////////////////////

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
const ROUTE_PROFILE = '/profile';
const ROUTE_EXERCISE = '/exercise';
const ROUTE_SUBSCRIPTIONS = '/subscriptions';
const ROUTE_MEASUREMENTS = '/measurements';

///
///   A U X I L I A R Y   R O U T E S
///
const ROUTE_QR_SCANNER = '/qr_scanner';
const ROUTE_PLAYER_INFO = '/player_info';
const ROUTE_PRESENCE = '/presence';
