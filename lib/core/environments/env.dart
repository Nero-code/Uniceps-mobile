// ignore_for_file: constant_identifier_names

class Env {
  static const name = String.fromEnvironment('NAME');
  static const baseUrl = String.fromEnvironment('BASE_URL');
}

class Envs {
  static const DEV = 'DEV';
  static const STAGING = 'TESTING';
  static const PRODUCTION = 'PRODUCTION';
}
