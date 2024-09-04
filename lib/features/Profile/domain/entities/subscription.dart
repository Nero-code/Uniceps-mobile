import 'package:equatable/equatable.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';

// {
//             "id": 123,
//             "pid": 123456789,
//             "gym_id": 18,
//             "sport_name": "Body building",
//             "trainer_name": "yazan ash",
//             "start_date": "15/08/2024",
//             "end_date": "15/09/2024",
//             "price": "30000",
//             "discount_value": "0",
//             "discount_des": "",
//             "is_paid": "True",
//             "paid_value": "30000",
//             "payments": []
// }

class Subscription extends Equatable {
  final String id, pId, sportName, gymId, trainerName, discountDes;
  final bool isPaid;
  final double price, paidValue, discountVal;
  final DateTime startDate, endDate;
  final List<Payment>? payments;

  const Subscription({
    required this.id,
    required this.pId,
    required this.sportName,
    required this.gymId,
    required this.trainerName,
    required this.discountDes,
    required this.isPaid,
    required this.price,
    required this.paidValue,
    required this.discountVal,
    required this.startDate,
    required this.endDate,
    required this.payments,
  });

  @override
  List<Object?> get props => [id];
}
