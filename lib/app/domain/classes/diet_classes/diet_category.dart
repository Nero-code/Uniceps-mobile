import 'package:equatable/equatable.dart';

class DietCategory extends Equatable {
  final int id;
  final String name;

  const DietCategory({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
