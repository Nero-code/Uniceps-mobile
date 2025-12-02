import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/account_entities/account.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  @JsonKey(name: 'id')
  final String uid;

  final String email;
  final DateTime createdAt;
  final AccountType type;

  const AccountModel({
    required this.uid,
    required this.email,
    required this.createdAt,
    required this.type,
  });

  factory AccountModel.guest() => AccountModel(
        uid: '',
        email: 'john.doe@example.com',
        createdAt: DateTime.now(),
        type: AccountType.guest,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  factory AccountModel.fromTable(db.Account c) => AccountModel(
      // uid: c.uid,
      uid: '',
      email: c.email,
      createdAt: c.createdAt,
      type: AccountType.normal);

  db.AccountsCompanion toTable() => db.AccountsCompanion(
      uid: drift.Value(uid), email: drift.Value(email), type: drift.Value(type), createdAt: drift.Value(createdAt));

  factory AccountModel.fromEntity(Account account) =>
      AccountModel(uid: account.uid, email: account.email, createdAt: account.createdAt, type: account.type);

  Account toEntity() => Account(uid: uid, email: email, createdAt: createdAt, type: type);
}
