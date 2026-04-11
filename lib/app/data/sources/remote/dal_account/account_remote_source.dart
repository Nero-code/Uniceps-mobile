import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/data/models/account_models/plan_item_model.dart';
import 'package:uniceps/app/data/models/account_models/plan_model.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';

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
    return await _clientHelper.getHandler(ApiRoutes.domain, ApiRoutes.membership, MembershipModel.fromJson);
  }

  @override
  Future<PlanModel> getPlans() async {
    return (await _clientHelper.getListHandler(ApiRoutes.domain, ApiRoutes.plan, PlanModel.fromJson)).first;
  }

  @override
  Future<PaymentResponse> buyPlan(PlanItemModel item) async {
    final res = await _clientHelper.postHandler(ApiRoutes.domain, ApiRoutes.buyPlan, {
      "planItemId": item.id,
    }, fromJson: PaymentResponse.fromJson);
    return res!;
  }
}
