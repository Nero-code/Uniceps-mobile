// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

abstract class ApiRoutes {
  static const API = kDebugMode || kProfileMode
      ? r"https://uniceps.runasp.net/api"
      : r"https://uniceps.trio-verse.com/api/v1";

  static const API_V2 = r"uniceps.runasp.net";

  /// PRODUCTION URL
  // const API = r"https://uniceps.trio-verse.com/api/v1";

  /// https://trio-verse.com
  static const URL = "https://trio-verse.com";
  // static const HTTP_REGISTER = "/auth";
  // static const HTTP_VERIFY_CODE = "/auth/verify";
  // static const HTTP_REFRESH = "/refresh";
  // static const HTTP_HANDSHAKE = "/handshake";
  // static const HTTP_GUEST_MODE = "/guest";
  // static const HTTP_REFRESH_TOKEN = '';
  // static const HTTP_ACCESS_TOKEN = '';
  // static const HTTP_PLAYER_INFO = "/profile";
  // static const HTTP_PLAYER = "/player";
  // static const HTTP_LOGIN = "";
  // static const HTTP_FORGOT_PASSWORD = "";
  // static const HTTP_TRAINING_PROGRAM = "/routines";
  // static const HTTP_IMAGES = "/images";
  // static const HTTP_SUBSCRIPTIONS = "/subscription";
  // static const HTTP_MEASURMENTS = "/metrics";
  // static const HTTP_MUSCLE_GROUPS = "/api/MuscleGroup";
  // static const HTTP_EXERCISES = "/api/Exercise";
  // static const HTTP_PRESENCE = "/attendances";
  // static const HTTP_GYMS = "/gyms";
  // static const HTTP_GYM_LOGO = "/logos";
}
