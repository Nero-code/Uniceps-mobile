import 'package:equatable/equatable.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';

class Subscription extends Equatable {
  final String id, description;
  final List<Payment> payments;

  const Subscription({
    required this.id,
    required this.description,
    required this.payments,
  });

  @override
  List<Object?> get props => [id];
}
