import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/subscription_model.dart';

abstract class IAccountRemoteSource {
  Future<AccountModel> getUserAccount();
  Future<SubscriptionModel> getCurrentPlan();
}

class AccountRemoteSource implements IAccountRemoteSource {
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
}
