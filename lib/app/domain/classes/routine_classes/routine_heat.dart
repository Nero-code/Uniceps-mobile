class RoutineHeat {
  final String routineName;
  final int sessionCount;
  final int? lastdayId;
  final Duration duration;
  final int days;
  final int exercises;
  final int sets;

  const RoutineHeat({
    required this.routineName,
    required this.sessionCount,
    required this.duration,
    required this.days,
    required this.exercises,
    required this.sets,
    this.lastdayId,
  });

  factory RoutineHeat.cold(String name) => RoutineHeat(
        routineName: name,
        sessionCount: 0,
        duration: Duration.zero,
        days: 0,
        exercises: 0,
        sets: 0,
      );
}
