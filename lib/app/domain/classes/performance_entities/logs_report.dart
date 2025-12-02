class LogsReport {
  /// Weight Analysis variables per session
  final double maxWeight, avgWeight, minWeight;
  final double totalWeights;

  /// Volume Analysis variables per session
  final double maxVolume, avgVolume, minVolume;
  final double totalVolume;

  /// Performance Metrics per routine
  final List<double> intensity, density;

  const LogsReport({
    required this.maxWeight,
    required this.avgWeight,
    required this.minWeight,
    required this.totalWeights,
    required this.maxVolume,
    required this.avgVolume,
    required this.minVolume,
    required this.totalVolume,
    required this.intensity,
    required this.density,
  });
}
