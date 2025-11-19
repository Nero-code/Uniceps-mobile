class SessionsReport {
  final Duration maxDuration;
  final Duration avgDuration;
  final Duration minDuration;

  final Duration totalDuration;

  /// Repreasents number of sets(logs) achieved within a session
  ///
  /// Rate = sets / duration
  final double progressRate;

  const SessionsReport({
    required this.maxDuration,
    required this.avgDuration,
    required this.minDuration,
    required this.totalDuration,
    required this.progressRate,
  });
}
