const APP_NAME = 'Uniceps';

enum Gender {
  male,
  female,
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
///   A P P   R O U T E S
///
////////////////////////////////////////////////////////////////////////////////

const ROUTE_SPLASH = '/';
const ROUTE_HOME = '/home';
const ROUTE_EXERCISE = '/exercise';
const ROUTE_SUBSCRIPTIONS = '/subscriptions';
const ROUTE_MEASUREMENTS = '/measurements';
const ROUTE_PROFILE = '/profile';
const ROUTE_AUTH = '/auth';
const ROUTE_QR_SCANNER = '/qr_scanner';
const ROUTE_PLAYER_INFO = '/player_info';
const ROUTE_PRESENCE = '/presence';
const ROUTE_FORGOT_PASSWORD = '/forgot_password';
