// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/account_entities/account.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String email;
  final DateTime createdAt;
  final AccountType type;

  const AccountModel({
    required this.email,
    required this.createdAt,
    required this.type,
  });

  factory AccountModel.guest() => AccountModel(
        email: "john.doe@example.com",
        createdAt: DateTime.now(),
        type: AccountType.guest,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  factory AccountModel.fromTable(db.Account c) => AccountModel(
      email: c.email, createdAt: c.createdAt, type: AccountType.normal);

  db.AccountsCompanion toTable() => db.AccountsCompanion(
      email: Value(email), type: Value(type), createdAt: Value(createdAt));

  factory AccountModel.fromEntity(Account account) => AccountModel(
      email: account.email, createdAt: account.createdAt, type: account.type);

  Account toEntity() => Account(email: email, createdAt: createdAt, type: type);
}
