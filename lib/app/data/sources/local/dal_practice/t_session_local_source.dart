import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';

abstract class ITSessionLocalSourceContract {
  Future<TSession> getPreviousSession();

  Future<TSession> startTrainingSession();
  Future<TLog> logSet(TLog log);
  Future<void> finishTrainingSession(TSession session);
}

class TSessionLocalSource implements ITSessionLocalSourceContract {
  @override
  Future<TSession> getPreviousSession() async {
    // TODO: implement getPreviousSession
    throw UnimplementedError();
  }

  @override
  Future<TSession> startTrainingSession() async {
    // TODO: implement startTrainingSession
    throw UnimplementedError();
  }

  @override
  Future<TLog> logSet(TLog log) async {
    // TODO: implement logSet
    throw UnimplementedError();
  }

  @override
  Future<void> finishTrainingSession(TSession session) async {
    // TODO: implement finishTrainingSession
    throw UnimplementedError();
  }
}
