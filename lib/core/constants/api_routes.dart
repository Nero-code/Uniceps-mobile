// ignore_for_file: constant_identifier_names

abstract class ApiRoutes {
  static const domain = String.fromEnvironment('API_URL');

  /// https://trio-verse.com
  static const URL = "https://trio-verse.com";

  static const telegram = String.fromEnvironment('TELEGRAM');
  static const deleteAccount = "https://uniceps.trio-verse.com/privacy";

  static const register = "/api/Authentication";
  static const verifyCode = "/api/Authentication/VerifyOtp";
  static const refreshToken = '/api/Authentication/RefreshToken';

  static const deviceInfo = "/api/UserDevice";
  static const sessionSync = '/api/Workout';

  static const plan = "/api/Plan/0";
  static const buyPlan = "/api/Membership";
  static const membership = "/api/Membership/0";

  static const exercises = "/api/ExerciseV2";
  static const muscleGroups = "/api/MuscleGroup";
  static String exerciseImage(String exId) => "/api/ExerciseV2/get-image/$exId";
}
