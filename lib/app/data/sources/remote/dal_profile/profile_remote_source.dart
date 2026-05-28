import 'dart:typed_data';

import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';

abstract class IProfileRemoteSource {
  Future<bool> uploadProfile(ProfileModel profile);
  Future<bool> uploadPhoto(Uint8List image);

  Future<bool> deletePhoto();
}

class ProfileRemoteSource implements IProfileRemoteSource {
  const ProfileRemoteSource({required HttpClientHelper client}) : _client = client;
  final HttpClientHelper _client;

  @override
  Future<bool> uploadProfile(ProfileModel profile) async =>
      await _client.postHandler(ApiRoutes.domain, ApiRoutes.profile, profile.toJson(), fromJson: (_) => true) ?? false;

  @override
  Future<bool> uploadPhoto(Uint8List image) async {
    await _client.uploadPhoto('file', image, ApiRoutes.domain, ApiRoutes.profilePicture, {});
    return true;
  }

  @override
  Future<bool> deletePhoto() async {
    await _client.deleteHandler(ApiRoutes.domain, ApiRoutes.profile, {});
    return true;
  }
}
