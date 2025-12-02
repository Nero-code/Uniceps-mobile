import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IAccountLocalSource {
  Future<AccountModel> getUserAccount();
  Future<MembershipModel> getCurrentPlan();

  Future<void> saveUserAccount(AccountModel userAccount);

  /// Returns a `Should Notify?` boolean
  Future<bool> saveUserMembership(MembershipModel subscriptionPlan);

  Future<void> logout();
}

class AccountLocalSource implements IAccountLocalSource {
  final FlutterSecureStorage _secureStorage;
  final AppDatabase _database;

  static const planKey = 'plan';

  AccountLocalSource({required FlutterSecureStorage secureStorage, required AppDatabase database})
      : _secureStorage = secureStorage,
        _database = database;

  /// ### Get User Account:
  ///
  /// Account is an offline-first data resource, the absence of it means an
  /// `Unatherized` state which translates to **guest**.
  @override
  Future<AccountModel> getUserAccount() async {
    final account = await _database.select(_database.accounts).getSingle();
    return AccountModel.fromTable(account);
  }

  @override
  Future<MembershipModel> getCurrentPlan() async {
    final res = await _secureStorage.read(key: planKey);
    if (res == null) {
      return MembershipModel.free();
    }
    final memebership = MembershipModel.fromJson(jsonDecode(res));
    if (DateTime.now().difference(memebership.endDate).inDays > 0) {
      await _secureStorage.delete(key: planKey);
      return MembershipModel.free();
    }
    return memebership;
  }

  @override
  Future<void> saveUserAccount(AccountModel userAccount) async {
    await _database.into(_database.accounts).insert(userAccount.toTable());
  }

  @override
  Future<bool> saveUserMembership(MembershipModel subscriptionPlan) async {
    final oldM = await _secureStorage.read(key: planKey);
    if (oldM == null) {
      await _secureStorage.write(key: planKey, value: jsonEncode(subscriptionPlan.toJson()));
      return true;
    }
    final mem = MembershipModel.fromJson(jsonDecode(oldM));
    if (subscriptionPlan.endDate.compareTo(mem.endDate) > 0) {
      await _secureStorage.write(key: planKey, value: jsonEncode(subscriptionPlan.toJson()));
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    await _database.delete(_database.accounts).go();
    await _secureStorage.deleteAll();
  }
}
