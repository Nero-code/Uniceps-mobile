enum AccountType { guest, normal, business }

class Account {
  final String uid;
  final String email;
  final DateTime createdAt;
  final AccountType type;

  const Account({
    required this.uid,
    required this.email,
    required this.createdAt,
    required this.type,
  });
}
