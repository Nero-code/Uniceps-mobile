import 'dart:math';

import 'package:faker/faker.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';

abstract class ModelFactory<T> {
  Faker get faker => Faker();

  /// Generate a single fake model.
  T generateFake();

  /// Generate fake list based on provided length.
  List<T> generateFakeList({required int length});
}

class UserFactory implements ModelFactory<UserModel> {
  final _faker = Faker();
  @override
  Faker get faker => _faker;

  @override
  UserModel generateFake() {
    return UserModel(
      id: Random().nextInt(1000000).toString(),
      token: Random().nextInt(1000000).toString(),
      email: _faker.internet.email(),
    );
  }

  @override
  List<UserModel> generateFakeList({required int length}) {
    return List.generate(
      length,
      (index) => UserModel(
        id: Random().nextInt(1000000).toString(),
        token: Random().nextInt(1000000).toString(),
        email: _faker.internet.email(),
      ),
    );
  }
}
