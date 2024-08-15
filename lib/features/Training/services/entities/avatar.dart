import 'package:equatable/equatable.dart';

class Avatar extends Equatable {
  /// Level manipulation
  final int level;

  /// Percntage of progress...
  ///
  /// Must be between [0,...,1]
  final double percentage;

  /// Logo of the current Gym.
  ///
  /// Should default to App Logo.
  final String? gymLogo;

  /// Player name should be accessable from home page without loading
  /// full profile data
  ///
  /// because it's costly on the proccessor
  final String playerName;

  // map for completed exercises each day { day: [... , execrise_id] }
  // final Map<String, List<int>> completedToday;

  /// Avater is a separete Entity from profile and it specializes in player
  /// progress...
  ///
  /// it must be split from player for future updates

  const Avatar({
    required this.level,
    required this.percentage,
    required this.playerName,
    this.gymLogo,
    // this.completedToday = const {},
  });

  @override
  List<Object?> get props => [level, percentage];
}
