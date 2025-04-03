import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/subscription_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class ISubscriptionsLocalSource {
  // Subscriptions Responsibility
  Future<List<SubscriptionModel>> getSubs(String gymId);
  Future<void> saveSubs(String gymId, List<SubscriptionModel> list);
}

class SubscriptionsDBService implements ISubscriptionsLocalSource {
  final Box<List<dynamic>> subsBox;
  final Logger logger;

  const SubscriptionsDBService({required this.subsBox, required this.logger});

  @override
  Future<List<SubscriptionModel>> getSubs(String gymId) async {
    logger.d("LocalSubsCheck");
    final res = subsBox.get(gymId);
    final list = <SubscriptionModel>[];
    if (res != null) {
      logger.d("Local --> Subs --> ${res.runtimeType}");
      for (var i in res) {
        list.add(SubscriptionModel.fromJson(i));
      }
      return list;
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> saveSubs(String gymId, List<SubscriptionModel> list) async {
    return await subsBox.put(gymId, [for (var i in list) i.toJson()]);
  }
}
