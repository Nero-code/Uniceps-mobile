import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/data/models/account_models/plan_item_model.dart';
import 'package:uniceps/app/data/models/account_models/plan_model.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IAccountRemoteSource {
  Future<MembershipModel> getUserMembership();
  Future<PlanModel> getPlans();

  Future<PaymentResponse> buyPlan(PlanItemModel item);
}

class AccountRemoteSource implements IAccountRemoteSource {
  const AccountRemoteSource({required ClientHelper clientHelper}) : _clientHelper = clientHelper;

  final ClientHelper _clientHelper;

  @override
  Future<MembershipModel> getUserMembership() async {
    return await _clientHelper.getHandler(API_V2, HTTP_MEMBERSHIP, MembershipModel.fromJson);
  }

  @override
  Future<PlanModel> getPlans() async {
    return (await _clientHelper.getListHandler(API_V2, HTTP_PLAN, PlanModel.fromJson)).first;
  }

  @override
  Future<PaymentResponse> buyPlan(PlanItemModel item) async {
    final res = await _clientHelper.postHandler(API_V2, HTTP_BUY_PLAN, {
      "planItemId": item.id,
    }, fromJson: PaymentResponse.fromJson);
    return res!;
  }
}
