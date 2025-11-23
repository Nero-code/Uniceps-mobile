import 'dart:async';

import 'package:drift/drift.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/services/sync/sync_contract.dart';
import 'package:uniceps/core/constants/constants.dart';

class TSessionSyncService implements TSessionSyncContract {
  final AppDatabase _database;
  final ClientHelper _client;
  final InternetConnectionChecker _connectionChecker;
  final Logger _logger;

  TSessionSyncService({
    required AppDatabase database,
    required ClientHelper client,
    required InternetConnectionChecker connectionChecker,
    required Logger logger,
  })  : _database = database,
        _client = client,
        _connectionChecker = connectionChecker,
        _logger = logger;

  final doneList = <int>[];
  var queue = StreamController<TSessionModel>();

  @override
  void start() {
    _logger.t('TSession SyncService Starting!');
    _init();
  }

  @override
  void dispose() async {
    if (!queue.isClosed) {
      await queue.close();
    }
  }

  void _init() async {
    queue = StreamController<TSessionModel>();
    queue.stream.asyncMap(_syncSession).listen((_) {});

    final unSyncedFinishedSessions = await readAll();
    _onData(unSyncedFinishedSessions);

    _logger.t('TSession SyncService Started!');
  }

  Future<List<TypedResult>> readAll() {
    final logA = _database.alias(_database.tLogs, 't');
    return (_database.select(_database.tSessions)..where((f) => f.finishedAt.isNotNull() & f.apiId.isNull()))
        .join([leftOuterJoin(logA, logA.sessionId.equalsExp(_database.tSessions.tsId))]).get();
  }

  void _onData(List<TypedResult> rows) async {
    final logA = _database.alias(_database.tLogs, 't');
    List<TSession> sessions = [];
    List<TLog> logs = [];
    for (var row in rows) {
      final s = row.readTable(_database.tSessions);
      if (!sessions.contains(s)) sessions.add(s);
      final l = row.readTable(logA);
      if (!logs.contains(l)) logs.add(l);
    }

    for (var s in sessions) {
      final lgs = logs.where((e) => e.sessionId == s.tsId).toList();
      if (!doneList.contains(s.tsId)) queue.add(TSessionModel.fromTable(s, lgs));
    }
  }

  void _syncSession(TSessionModel model) async {
    if (doneList.contains(model.id)) return;
    int attempt = 0;
    int maxAttempts = 5;
    int delay = 1;

    // Retry Mechanism
    while (!await _connectionChecker.hasConnection) {
      _logger.t('session sync: attempt $attempt, Retring...');
      if (attempt >= maxAttempts) return;
      await Future.delayed(Duration(seconds: delay *= 2));
      attempt++;
    }

    try {
      final apiId =
          await _client.postHandler(API_V2, HTTP_SESSION_SYNC, model.toJson(), fromJson: (json) => json['id'] as int);

      await (_database.update(_database.tSessions)..where((f) => f.tsId.equals(model.id!)))
          .write(TSessionsCompanion.custom(apiId: Constant(apiId!), isSynced: const Constant(true)));

      doneList.add(model.id!);
    } catch (e) {
      _logger.e(e.toString(), error: e);
    }
  }
}
