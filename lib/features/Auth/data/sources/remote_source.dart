import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';

abstract class RemoteAuthSource {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> verifyEmail({required String email});
  Future<bool> verifyCodeSent({required String code});
  Future<void> verifyGymCode({required String gymCode});
  Future<void> uploadPlayerInfo({required PlayerModel player});
  Future<void> requestPasswordChange(String newPass);
  // Future<bool> isLoggedIn();
}

class RemoteAuthSourceImpl implements RemoteAuthSource {
  final http.Client client;

  RemoteAuthSourceImpl(this.client);

  @override
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final res = await client.post(
      Uri.parse("192.168.1.7:5000/login"),
      body: {"email": email, "password": password},
    );
    if (res.statusCode == 200) {
      return;
    }
    throw AuthException();
  }

  @override
  Future<void> requestPasswordChange(String newPass) async {
    final res = await getIt('/login', {});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> uploadPlayerInfo({required PlayerModel player}) async {
    final res = await client.put(Uri.parse(FAKE_API + "/player"), body: {});
    if (res.statusCode != 201) {
      throw Exception();
    }
  }

  @override
  Future<bool> verifyCodeSent({required String code}) async {
    final res = await client
        .post(Uri.parse(FAKE_API + "/Auth/verify"), body: {"code": 0});
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    final res = await client
        .post(Uri.parse(FAKE_API + "/Auth"), body: {"email": email});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> verifyGymCode({required String gymCode}) async {
    final res = await client.post(Uri.parse(FAKE_API + "/Auth/verify_gym"),
        body: {"gym_code": gymCode});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  // @override
  // Future<bool> isLoggedIn() {
  //   // No Need to implement
  //   throw UnimplementedError();
  // }

  ///
  ///   H E L P E R   M E T H O D   FOR HTTP CLIENT
  ///

  Future<http.Response> getIt(String suffix, Map<String, dynamic> body) async {
    // final res = Uri.parse(FAKE_API + suffix);
    // final res2 = http.Request("GET", res);
    // res2.body = jsonEncode(body);
    // return await res2.send();
    return await client.get(Uri.parse(FAKE_API + suffix), headers: {});
  }
}
