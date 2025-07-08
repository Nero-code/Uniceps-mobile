import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class MediaHelper {
  Future<Uint8List?> getImage(String imageUrl);
  Future<void> saveImages(List<String> imageUrls);
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
  Future<void> saveImages(List<String> imageUrls) async {
    if (await checker.hasConnection) {
      for (var imageUrl in imageUrls) {
        final res = await client.get(Uri.parse(imageUrl));
        if (res.statusCode == 200) {
          await imagesCache.put(imageUrl, res.bodyBytes);
        }
      }
      return;
    }
    throw OfflineFailure(errorMessage: 'no internet');
  }
}
