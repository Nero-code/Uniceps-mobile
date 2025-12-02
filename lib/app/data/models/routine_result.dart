import 'package:uniceps/core/errors/failure.dart';

enum Stage {
  start,
  images,
  routine,
  days,
  items,
  sets,
  done,
  error,
}

class RoutineResult {
  final double progress;
  final Stage stage;

  final FileParseFailure? error;

  const RoutineResult({required this.progress, required this.stage, this.error});
}
