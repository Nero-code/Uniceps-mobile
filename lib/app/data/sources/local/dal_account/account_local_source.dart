import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/subscription_model.dart';

abstract class IAccountLocalSource {
  Future<AccountModel> getUserAccount();
  Future<SubscriptionModel> getCurrentPlan();

  Future<void> saveUserAccount(AccountModel userAccount);

  Future<void> saveUserPlan(SubscriptionModel subscriptionPlan);
}

class AccountLocalSource implements IAccountLocalSource {
  @override
  Future<SubscriptionModel> getCurrentPlan() async {
    // TODO: implement getCurrentPlan
    throw UnimplementedError();
  }

  @override
  Future<AccountModel> getUserAccount() async {
    // TODO: implement getUserAccount
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
}
