import 'dart:async';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class ImageCacheManager {
  final Box<Uint8List> imagesCache;
  final InternetConnectionChecker checker;
  final http.Client client;
  final Logger logger;
  ImageCacheManager({
    required this.imagesCache,
    required this.checker,
    required this.client,
    required this.logger,
  });

  final StreamController loadingBar = StreamController<double>.broadcast();
  // Stream<double> get progress =>
  //     _loadingBar.stream.map((event) => double.parse(event));

  double increament = 0;

  Future<Map<String, Uint8List>> getAndCacheImages(List<dynamic> exs) async {
    logger.d("ImageCacheManager getAndCache");
    logger.d("exs length: ${exs.length}");

    increament = 0.0;
    loadingBar.sink.add(increament);
    logger.d("${loadingBar.hasListener}");

    final cacheKeys = imagesCache.keys;
    final Map<String, Uint8List> map = {};
    for (int i = 0; i < exs.length; i++) {
      var temp = "${exs[i]['Muscle_Group']}/${exs[i]['ExerciseImage']}";
      if (!cacheKeys.contains(temp)) {
        // logger.d("no image found");
        try {
          final response = await client.get(
            headers: {...HEADERS},
            Uri.parse(
              imgUrlParser(
                  exs[i]['Muscle_Group'], "${exs[i]['ExerciseImage']}"),
            ),
          );
          if (response.statusCode == 200) {
            await imagesCache.put(temp, response.bodyBytes);
            map.addAll({"${exs[i]['id']}": response.bodyBytes});

            loadingBar.add((increament += 1 / exs.length));
          } else {
            throw NoInternetException();
          }
        } catch (e) {
          logger
              .d("ImageCacheManager Error: ${e.runtimeType} : ${e.toString()}");
          throw NoInternetException();
        }
      } else {
        // logger.d("-------------------image found!!!");
        map.addAll({"${exs[i]['id']}": imagesCache.get(temp)!});
        loadingBar.add((increament += (1 / exs.length)));
      }
    }
    // final list = <String,Uint8List>{};
    // for (var i in imagesCache.keys) {
    //   list.addAll({:imagesCache.get(i) as Uint8List});
    // }
    increament = 0.0;
    if (map.isNotEmpty) {
      return map;
    }

    throw EmptyCacheExeption();

    // if (await checker.hasConnection) {
    //   try {} catch (e) {
    //     logger.d("ImageCacheManager Error: ${e.runtimeType} : ${e.toString()}");
    //     throw Exception(e.toString());
    //   }
    // }else{}
  }

  Future<Map<String, Uint8List>> getLocalImages(List<dynamic> exc) async {
    increament = 0.0;
    final Map<String, Uint8List> images = {};
    for (var i in exc) {
      final key = "${i['Muscle_Group']}/${i['ExerciseImage']}";
      if (imagesCache.containsKey(key)) {
        images.addAll({"${i['id']}": imagesCache.get(key)!});

        loadingBar.add((increament += 1 / exc.length));
      } else {
        throw EmptyCacheExeption();
      }
    }
    increament = 0.0;
    return images;
  }
}
