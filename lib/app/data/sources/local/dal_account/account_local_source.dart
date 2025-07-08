import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/subscription_model.dart';

abstract class IAccountLocalSource {
  Future<AccountModel> getUserAccount();
  Future<SubscriptionModel> getCurrentPlan();

  Future<void> saveUserAccount(AccountModel userAccount);
  Future<void> saveUserPlan(SubscriptionModel subscriptionPlan);

  Future<void> logout();
}

class AccountLocalSource implements IAccountLocalSource {
  /// ### Get User Account:
  ///
  /// Account is an offline-first data resource, the absence of it means an
  /// `Unatherized` state which translates to **guest**.
  @override
  Future<AccountModel> getUserAccount() async {
    return AccountModel.guest();
  }

  @override
  Future<SubscriptionModel> getCurrentPlan() async {
    // TODO: implement getCurrentPlan
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserAccount(AccountModel userAccount) {
    // TODO: implement saveUserAccount
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserPlan(SubscriptionModel subscriptionPlan) {
    // TODO: implement saveUserPlan
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
