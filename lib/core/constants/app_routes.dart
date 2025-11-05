abstract class AppRoutes {
  static const String splash = '/';

  ///
  ///   A U T H   R O U T E S
  ///
  static const String auth = '/auth';

  ///
  ///   M A I N   R O U T E S
  ///
  static const String home = '/home';
  static const String myRoutines = '/home/my_routines';
  static const String practice = '/home/practice';
  static const String settings = '/home/settings';
  static const String analytics = '/home/analytics';
  static const String routineManager = '/home/routine_manager';
  static const String routineEdit = '/home/routine_manager/{routine_id}';
  static const String routineExercises = '/home/routine_manager/exercises';
  static const String routineItemSetsEdit =
      '/home/routine_manager/{routine_id}/{item_id}';
  static const String plans = '/plans';

  static const String profile = '/home/settings/profile';
  static const String exercises = '/home/exercise';
  static const String subscriptions = '/home/profile/subscriptions';
  static const String measurements = '/home/profile/measurements';
  static const String about = "/home/profile/about";
}
