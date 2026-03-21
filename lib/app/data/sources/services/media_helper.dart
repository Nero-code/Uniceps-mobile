import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class MediaHelper {
  Future<Uint8List?> getImage(String imageUrl);
  Stream<double> saveImages(List<String> imageUrls);
}

class ImageMediaHelper implements MediaHelper {
  final Box<Uint8List> imagesCache;
  final NetworkInfo checker;
  final Client client;
  final Logger logger;

  const ImageMediaHelper({
    required this.imagesCache,
    required this.checker,
    required this.client,
    required this.logger,
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
        logger.e(e.toString(), error: e);
        rethrow;
      }
    }
    throw OfflineFailure(errorMessage: "no internet");
  }

  @override
  Stream<double> saveImages(List<String> imageUrls) async* {
    logger.d("Checking connection....");
    if (await checker.hasConnection) {
      yield 0;
      logger.d("Checked!");
      for (var imageUrl in imageUrls) {
        logger.d("is image available?");
        if (imagesCache.get(imageUrl) == null) {
          logger.d("NO!: $imageUrl");
          final res = await client.get(Uri.parse(imageUrl));
          if (res.statusCode == 200) {
            await imagesCache.put(imageUrl, res.bodyBytes);
          } else {
            logger.e('Internet cut off suddenly: ${res.body}');
            throw NoInternetException();
          }
        }
        yield 1 / imageUrls.length;
      }
      return;
    }
    logger.e('No Internet Connection');
    throw OfflineFailure(errorMessage: 'no internet');
  }
}
