import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/subscription_model.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IAccountRemoteSource {
  Future<AccountModel> getUserAccount();
  Future<SubscriptionModel> getCurrentPlan();
}

class AccountRemoteSource implements IAccountRemoteSource {
  const AccountRemoteSource({required ClientHelper clientHelper})
      : _clientHelper = clientHelper;

  final ClientHelper _clientHelper;

  @override
  Future<AccountModel> getUserAccount() async {
    // TODO: implement getUserAccount
    throw UnimplementedError();
  }

  @override
  Future<SubscriptionModel> getCurrentPlan() async {
    return await _clientHelper.getHandler(
        API_V2, HTTP_SUBSCRIPTIONS, SubscriptionModel.fromJson);
  }
}
