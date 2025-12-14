import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IAccountLocalSource {
  Future<AccountModel> getUserAccount();
  Future<MembershipModel> getCurrentPlan();

  Future<void> saveUserAccount(AccountModel userAccount);

  /// Returns a `Should Notify?` boolean
  Future<bool> saveUserMembership(MembershipModel subscriptionPlan);
  Future<MembershipModel> userMembershipNotified();

  Future<void> logout();
}

class AccountLocalSource implements IAccountLocalSource {
  final FlutterSecureStorage _secureStorage;
  final AppDatabase _database;
  final Logger _logger;

  static const planKey = 'plan';
  const AccountLocalSource({
    required FlutterSecureStorage secureStorage,
    required AppDatabase database,
    required Logger logger,
  }) : _secureStorage = secureStorage,
       _database = database,
       _logger = logger;

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
      throw Exception('No plan found');
    }
    _logger.t('found Membership locally');
    final membership = MembershipModel.fromJson(jsonDecode(res));
    if (DateTime.now().difference(membership.endDate).inDays > 0) {
      await _secureStorage.delete(key: planKey);
      throw Exception('Plan Expired');
    }
    return membership;
  }

  @override
  Future<void> saveUserAccount(AccountModel userAccount) async {
    await _database.delete(_database.accounts).go();
    await _database.into(_database.accounts).insert(userAccount.toTable());
  }

  @override
  Future<bool> saveUserMembership(MembershipModel membership) async {
    final oldM = await _secureStorage.read(key: planKey);
    if (oldM == null) {
      _logger.i('Got New Membership');
      await _secureStorage.write(key: planKey, value: jsonEncode(membership.toJson()));
      return true;
    }
    final mem = MembershipModel.fromJson(jsonDecode(oldM));
    if (membership.endDate.compareTo(mem.endDate) > 0) {
      _logger.i('Got Extended Membership');
      await _secureStorage.write(key: planKey, value: jsonEncode(membership.toJson()));
      return true;
    }
    if (!mem.isNotified) {
      _logger.i('Got Same Membership but did not notify user');
      return true;
    }
    _logger.t('No New Membership');
    return false;
  }

  @override
  Future<void> logout() async {
    await _database.delete(_database.accounts).go();
    await _secureStorage.deleteAll();
  }

  @override
  Future<MembershipModel> userMembershipNotified() async {
    final memString = await _secureStorage.read(key: planKey);
    if (memString != null) {
      var mem = MembershipModel.fromJson(jsonDecode(memString)).copyWith(isNotified: true);
      await _secureStorage.write(key: planKey, value: jsonEncode(mem.toJson()));
      return mem;
    }
    throw EmptyCacheExeption();
  }
}
