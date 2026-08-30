import 'dart:io';

import 'package:http/http.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/local/dal_diet/diet_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_diet/diet_remote_source.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class IngredientsLibrarySyncService {
  final IDietLocalSource _localSource;
  final IDietRemoteSource _remoteSource;

  IngredientsLibrarySyncService({required IDietLocalSource localSource, required IDietRemoteSource remoteSource})
    : _localSource = localSource,
      _remoteSource = remoteSource;

  Future<void> syncLib() async {
    try {
      // 1. Upload User Generated Content First
      await _uploadUserGeneratedContent();

      // 2. Download New Base Library Content (Delta Sync)
      final latest = await _localSource.getLastLibSync();
      final updatedIngredients = await _retry(() => _remoteSource.loadIngredients(lastSync: latest));

      if (updatedIngredients.isNotEmpty) {
        await _localSource.bulkSaveIngredients(updatedIngredients);
      }
    } on ClientException catch (ce) {
      logger.d('ClientException: $ce');
    } on SocketException catch (se) {
      logger.d('SocketException: $se');
    } on NoContentException {
      logger.d('NoContentException library must be up-to-date');
      return;
    } catch (e, s) {
      logger.e('IngredientsLibrarySyncService Error', error: e, stackTrace: s);
    }
  }

  Future<void> _uploadUserGeneratedContent() async {
    final unsyncedItems = await _localSource.getUserGeneratedContent();

    for (final item in unsyncedItems) {
      try {
        // Upload to server and get the new apiId
        final apiId = await _retry(() => _remoteSource.uploadIngredient(item));

        // Update local record as synced
        final syncedItem = item.copyWith(apiId: apiId.toString(), isSynced: true);

        await _localSource.saveIngredient(syncedItem);
      } on NoContentException {
        return;
      } catch (e) {
        logger.e('Failed to upload ingredient: ${item.name}', error: e);
        // Continue to next item even if one fails
      }
    }
  }

  Future<T> _retry<T>(Future<T> Function() action, {int maxAttempts = 3}) async {
    int attempts = 0;
    while (attempts < maxAttempts) {
      try {
        return await action();
      } on SocketException {
        rethrow;
      } on NoContentException {
        rethrow;
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;
        final delay = Duration(seconds: attempts * 2);
        logger.d('Retry attempt $attempts after ${delay.inSeconds}s');
        await Future.delayed(delay);
      }
    }
    throw Exception('Retry failed');
  }
}
