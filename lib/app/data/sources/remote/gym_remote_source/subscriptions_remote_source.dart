import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/profile_models/subscription_model.dart';
import "package:http/http.dart" as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class ISubscriptionsRemoteSource {
  Future<List<SubscriptionModel>> getSubsriptions(String gymId, String pid);
}

class SubscriptionsAPISource implements ISubscriptionsRemoteSource {
  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  const SubscriptionsAPISource({
    required http.Client client,
    required this.userBox,
    required this.logger,
  }) : _client = client;

  @override
  Future<List<SubscriptionModel>> getSubsriptions(
      String gymId, String pid) async {
    logger.t("Profile ->  RemoteS -> getSubs -> URL: /$gymId/$pid");

    if (pid.isEmpty) {
      throw EmptyCacheExeption();
    }
    final res =
        await _client.get(Uri.parse("$API$HTTP_SUBSCRIPTIONS/$gymId/$pid"));
    final list = <SubscriptionModel>[];
    logger.t(res.statusCode);
    if (res.statusCode == 200) {
      logger.t("Subs: ${res.body}");
      logger.t(jsonDecode(res.body).runtimeType);

      final subsList = jsonDecode(res.body) as List<dynamic>;

      logger.t("check 3");
      for (var i in subsList) {
        list.add(SubscriptionModel.fromJson(i));
      }
      logger.t("check 4");
      return list;
    } else if (res.statusCode == 204) {
      throw EmptyCacheExeption();
    }
    throw ServerException();
  }
}
