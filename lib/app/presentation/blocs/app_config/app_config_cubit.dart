import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/services/app_configs_service.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/helpers/configs.dart';

part 'app_config_cubit.freezed.dart';
part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  final AppConfigsService _appConfigsService;
  AppConfigCubit({required AppConfigsService appConfigsService})
    : _appConfigsService = appConfigsService,
      super(AppConfigState.appConfig(config: Configs.initial(language: 'en')));

  Future<void> loadConfigs() async {
    final config = await _appConfigsService.getAppConfigs();
    emit(.appConfig(config: config));
  }

  Future<void> changeAppLanguageTo(String appLanguage) async {
    final config = await _appConfigsService.changeAppConfigs(appLanguage: Locale(appLanguage));
    emit(.appConfig(config: config));
  }

  Future<void> changeExercisesLanguageTo(String language) async {
    final config = await _appConfigsService.changeAppConfigs(exerciseLibLanguage: Locale(language));
    emit(.appConfig(config: config));
  }

  Future<void> changeAppThemeTo(ThemeMode mode) async {
    final config = await _appConfigsService.changeAppConfigs(mode: mode);
    emit(.appConfig(config: config));
  }

  Future<void> changeGoalTo(Goal goal) async {
    final config = await _appConfigsService.changeAppConfigs(goal: goal);
    emit(.appConfig(config: config));
  }

  Future<void> changeActivityLevelTo(ActivityLevel level) async {
    final config = await _appConfigsService.changeAppConfigs(activityLevel: level);
    emit(.appConfig(config: config));
  }
}
