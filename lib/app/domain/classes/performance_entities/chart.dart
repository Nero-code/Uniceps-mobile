import 'package:uniceps/app/domain/classes/performance_entities/point.dart';

class Chart<X, Y> {
  final List<Point<X, Y>> points;
  final String title;

  const Chart({required this.points, required this.title});
}
