import 'package:equatable/equatable.dart';

class Avatar extends Equatable {
  /// Level manipulation
  final int level;

  /// Level manipulation
  final double percentage;

  /// map for completed exercises each day { day: [... , execrise_id] }
  final Map<String, List<int>> completedToday;

  const Avatar({
    required this.level,
    required this.percentage,
    this.completedToday = const {},
  });

  @override
  List<Object?> get props => [level, percentage];
}
