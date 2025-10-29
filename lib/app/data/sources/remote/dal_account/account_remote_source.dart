import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IAccountRemoteSource {
  Future<MembershipModel> getCurrentPlan();
}

class AccountRemoteSource implements IAccountRemoteSource {
  const AccountRemoteSource({required ClientHelper clientHelper})
      : _clientHelper = clientHelper;

  final ClientHelper _clientHelper;

  @override
  Future<MembershipModel> getCurrentPlan() async {
    return await _clientHelper.getHandler(
        API_V2, HTTP_SUBSCRIPTIONS, MembershipModel.fromJson);
  }
}
