import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Failure extends Equatable {
  String getErrorMessage();
}

////////////////////////////////////////////////////////////////////////////////
///   A U T H   F A I L U R E S
////////////////////////////////////////////////////////////////////////////////
class AuthFailure extends Failure {
  final String _errorMessage;

  AuthFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }

  @override
  List<Object?> get props => [_errorMessage];
}


////////////////////////////////////////////////////////////////////////////////
///   D A T A B A S E   F A I L U R E S
////////////////////////////////////////////////////////////////////////////////
