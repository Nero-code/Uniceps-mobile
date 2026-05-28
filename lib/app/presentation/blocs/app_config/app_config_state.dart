part of 'app_config_cubit.dart';

@freezed
abstract class AppConfigState with _$AppConfigState {
  const factory AppConfigState.appConfig({required Configs config}) = _AppConfig;
}
