import 'package:drift/drift.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';

class Accounts extends Table {
  TextColumn get uid => text()();
  TextColumn get email => text().withLength(min: 1, max: 255)();
  TextColumn get type => textEnum<AccountType>()();
  DateTimeColumn get createdAt => dateTime()();
}
