abstract class AppRoutes {
  static const splash = '/';

  ///
  ///   A U T H   R O U T E S
  ///
  static const auth = '/auth';

  ///
  ///   M A I N   R O U T E S
  ///
  static const home = '/home';
  static const myRoutines = '/home/my_routines';
  static const practice = '/home/practice';
  static const settings = '/home/settings';
  static const analytics = '/home/analytics';
  static const routineManager = '/home/routine_manager';
  static const routineEdit = '/home/routine_manager/{routine_id}';
  static const routineExercises = '/home/routine_manager/exercises';
  static const routineItemSetsEdit = '/home/routine_manager/{routine_id}/{item_id}';
  static const plans = '/plans';

  static const profile = '/home/settings/profile';
  static const exercises = '/home/exercise';
  static const subscriptions = '/home/profile/subscriptions';
  static const measurements = '/home/profile/measurements';
  static const about = "/home/profile/about";
}
