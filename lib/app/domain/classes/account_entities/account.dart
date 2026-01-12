import 'package:equatable/equatable.dart';

enum AccountType { guest, normal, business }

class Account extends Equatable {
  final String uid;
  final String email;
  final DateTime createdAt;
  final AccountType type;

  const Account({required this.uid, required this.email, required this.createdAt, required this.type});

  @override
  List<Object?> get props => [uid, email, createdAt, type];
}
