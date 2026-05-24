import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';

abstract class IProfileRemoteSource {
  Future<bool> uploadProfile(ProfileModel profile);
  Future<bool> uploadPhoto(String path);
}

class ProfileRemoteSource implements IProfileRemoteSource {
  const ProfileRemoteSource({required ClientHelper client}) : _client = client;
  final ClientHelper _client;

  @override
  Future<bool> uploadProfile(ProfileModel profile) async =>
      await _client.postHandler(ApiRoutes.domain, ApiRoutes.profile, profile.toJson(), fromJson: (_) => true) ?? false;

  @override
  Future<bool> uploadPhoto(String path) async {
    // TODO: implement uploadPhoto
    throw UnimplementedError();
  }
}
