// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  factory AccountModel.fromEntity(Account account) => AccountModel(
      email: account.email, createdAt: account.createdAt, type: account.type);

  Account toEntity() => Account(email: email, createdAt: createdAt, type: type);
}
