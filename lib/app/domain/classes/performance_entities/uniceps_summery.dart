class UnicepsSummery {
  // Summery
  final int totalWeight;
  final int totalReps;
  final int totalDurationInMinutes;
  final int totalSessions;

  // Performance
  final double averageCompletionRate;
  final double efficiency;

  // Streak
  final int currentStreak;
  final int longestStreak;

  const UnicepsSummery({
    required this.totalWeight,
    required this.totalReps,
    required this.totalDurationInMinutes,
    required this.totalSessions,
    required this.averageCompletionRate,
    required this.efficiency,
    required this.currentStreak,
    required this.longestStreak,
  });

  factory UnicepsSummery.empty() => const UnicepsSummery(
    totalWeight: 0,
    totalReps: 0,
    totalDurationInMinutes: 0,
    totalSessions: 0,
    averageCompletionRate: 0,
    efficiency: 0,
    currentStreak: 0,
    longestStreak: 0,
  );
}
