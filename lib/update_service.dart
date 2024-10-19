import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/version.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateService {
  final InternetConnectionChecker connectionChecker;
  final Client client;
  UpdateService({
    required this.connectionChecker,
    required this.client,
  });
  Version? updateAvailable;
  Future<bool> isUpdateAvailable() async {
    debugPrint("update service running a check");
    if (await connectionChecker.hasConnection) {
      try {
        final res = await client.get(
          Uri.parse("https://trio-verse.com/app/mobile/updates"
              "/${Platform.isAndroid ? "A" : "I"}"),
        );

        debugPrint("update service ${res.statusCode}");
        if (res.statusCode == 200) {
          debugPrint("update ${res.body}");
          final version = Version.fromJson(jsonDecode(res.body));
          debugPrint("update ${res.body}");
          updateAvailable = version;
          return version.versionNum != APP_VERSION;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> updatefromApi() async {
    if (updateAvailable != null && await connectionChecker.hasConnection) {
      try {
        // final directory = Directory('/storage/emulated/0/Download');
        // await FlutterDownloader.enqueue(
        //   url: updateAvailable!.mainUrl,
        //   saveInPublicStorage: true,
        //   savedDir: await directory.exists()
        //       ? directory.path
        //       : (await getApplicationDocumentsDirectory()).path,
        // );
        if (await canLaunchUrl((Uri.parse(updateAvailable!.mainUrl)))) {
          final res = await launchUrl(Uri.parse(updateAvailable!.mainUrl));
          return res;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<void> updatefromStore() async {
    if (updateAvailable != null && await connectionChecker.hasConnection) {
      if (await canLaunchUrl(Uri.parse(updateAvailable!.playUrl))) {
        launchUrl(Uri.parse(updateAvailable!.playUrl));
      }
    }
  }
}
