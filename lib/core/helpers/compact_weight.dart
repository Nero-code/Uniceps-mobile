class CompactWeight {
  final String value;
  final String unit;

  CompactWeight(this.value, this.unit);

  @override
  String toString() => '$value $unit';
}

CompactWeight formatMassiveWeight(double kg) {
  // Base unit is kg
  final units = ['kg', 'T', 'kT', 'MT'];
  int unitIndex = 0;
  double scaled = kg;

  while (scaled >= 1000 && unitIndex < units.length - 1) {
    scaled /= 1000;
    unitIndex++;
  }

  String formatted = scaled.toStringAsFixed(1);
  if (formatted.endsWith('.0')) {
    formatted = formatted.substring(0, formatted.length - 2);
  }

  return CompactWeight(formatted, units[unitIndex]);
}
