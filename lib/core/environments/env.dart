// ignore_for_file: constant_identifier_names

abstract class Env {
  static const name = String.fromEnvironment('FLAVOR');
  static const baseUrl = String.fromEnvironment('API');
}

class Envs {
  static const dev = 'dev';
  static const staging = 'staging';
  static const prod = 'prod';
}
