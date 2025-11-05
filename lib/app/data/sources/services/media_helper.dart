import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class MediaHelper {
  Future<Uint8List?> getImage(String imageUrl);
  Stream<double> saveImages(List<String> imageUrls);
}

class ImageMediaHelper implements MediaHelper {
  final Box<Uint8List> imagesCache;
  final InternetConnectionChecker checker;
  final Client client;

  const ImageMediaHelper({
    required this.imagesCache,
    required this.checker,
    required this.client,
  });

  @override
  Future<Uint8List?> getImage(String imageUrl) async {
    if (imagesCache.containsKey(imageUrl)) {
      return imagesCache.get(imageUrl);
    }
    if (await checker.hasConnection) {
      try {
        final res = await client.get(Uri.parse(imageUrl));
        if (res.statusCode == 200) {
          await imagesCache.put(imageUrl, res.bodyBytes);
          return res.bodyBytes;
        }
      } catch (e) {
        print(e.toString());
        rethrow;
      }
    }
    throw OfflineFailure(errorMessage: "no internet");
  }

  @override
  Stream<double> saveImages(List<String> imageUrls) async* {
    print("Checking connection....");
    if (await checker.hasConnection) {
      yield 0;
      print("Checked!");
      for (var imageUrl in imageUrls) {
        print("is image available?");
        if (imagesCache.get(imageUrl) == null) {
          print("NO!");
          final res = await client.get(Uri.parse(imageUrl));
          if (res.statusCode == 200) {
            await imagesCache.put(imageUrl, res.bodyBytes);
          } else {
            throw NoInternetException();
          }
        }
        yield 1 / imageUrls.length;
      }
      return;
    }
    throw OfflineFailure(errorMessage: 'no internet');
  }
}
