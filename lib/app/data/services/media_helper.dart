import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class MediaHelper {
  Stream<double> saveImages(List<String> imageUrls);

  Future<Uint8List?> getImage(String imageUrl);
  Future<void> addImage(String imageKey, Uint8List bitmap);
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
  Stream<double> saveImages(List<String> imageUrls) async* {
    if (imageUrls.isEmpty) return;
    final chunk = 1 / imageUrls.length;
    yield 0;

    for (final url in imageUrls) {
      logger.d("Is image available?");
      if (imagesCache.containsKey(url)) {
        // Image already stored in cache no need to get it again.
        logger.d("YES!: $url");
        yield chunk;
      } else if (await checker.hasConnection) {
        // Image not stored, need to get it before continuing.
        logger.d("NO!: $url");
        try {
          final res = await client.get(Uri.https(ApiRoutes.domain, ApiRoutes.exerciseImage(url)));
          if (res.statusCode == 200) {
            await imagesCache.put(url, res.bodyBytes);
          }
        } catch (e, s) {
          logger.e('Internet cut off suddenly', error: e, stackTrace: s);
          continue;
        }
      } else {
        // No Image and No Internet connection available.

        logger.e('No Internet Connection');
        throw OfflineFailure(errorMessage: 'no internet');
      }
    }
  }

  @override
  Future<Uint8List?> getImage(String imageUrl) async => imagesCache.get(imageUrl);

  @override
  Future<void> addImage(String imageUrl, Uint8List bitmap) => imagesCache.put(imageUrl, bitmap);
}
