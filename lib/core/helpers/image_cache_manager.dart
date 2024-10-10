// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class ImageCacheManager {
  final Box<Uint8List> imagesCache;
  final InternetConnectionChecker checker;
  final http.Client client;
  ImageCacheManager({
    required this.imagesCache,
    required this.checker,
    required this.client,
  });

  Future<Map<String, Uint8List>> getAndCacheImages(List<dynamic> exs) async {
    print("ImageCacheManager getAndCache");
    print("exs length: ${exs.length}");

    final cacheKeys = imagesCache.keys;
    final Map<String, Uint8List> map = {};
    for (int i = 0; i < exs.length; i++) {
      var temp = "${exs[i]['Muscle_Group']}/${exs[i]['ExerciseImage']}";
      if (!cacheKeys.contains(temp)) {
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
          } else {
            throw NoInternetException();
          }
        } catch (e) {
          print("ImageCacheManager Error: ${e.runtimeType} : ${e.toString()}");
          throw Exception();
        }
      } else {
        map.addAll({"${exs[i]['id']}": imagesCache.get(temp)!});
      }
    }
    // final list = <String,Uint8List>{};
    // for (var i in imagesCache.keys) {
    //   list.addAll({:imagesCache.get(i) as Uint8List});
    // }

    if (map.isNotEmpty) {
      return map;
    }

    throw EmptyCacheExeption();

    // if (await checker.hasConnection) {
    //   try {} catch (e) {
    //     print("ImageCacheManager Error: ${e.runtimeType} : ${e.toString()}");
    //     throw Exception(e.toString());
    //   }
    // }else{}
  }

  Future<Map<String, Uint8List>> getLocalImages(List<dynamic> exc) async {
    final Map<String, Uint8List> images = {};
    for (var i in exc) {
      final key = "${i['Muscle_Group']}/${i['ExerciseImage']}";
      if (imagesCache.containsKey(key)) {
        images.addAll({"${i['id']}": imagesCache.get(key)!});
      } else {
        throw EmptyCacheExeption();
      }
    }
    return images;
  }
}
