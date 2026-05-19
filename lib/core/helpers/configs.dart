import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class Configs {
  Locale appLanguage;
  Locale exerciseLibLanguage;
  ThemeMode mode;
  Goal? goal;
  ActivityLevel? activityLevel;

  Configs({
    required this.appLanguage,
    required this.exerciseLibLanguage,
    required this.mode,
    required this.goal,
    required this.activityLevel,
  });

  factory Configs.initial({required String language}) => Configs(
    appLanguage: Locale(language),
    exerciseLibLanguage: Locale(language),
    mode: .light,
    goal: null,
    activityLevel: null,
  );

  factory Configs.fromJson(Map<String, dynamic> json) => Configs(
    appLanguage: Locale(json['appLanguage'] ?? 'en'),
    exerciseLibLanguage: Locale(json['exerciseLibLanguage']),
    mode: ThemeMode.values.firstWhere((mode) => mode.name == json['themeMode'], orElse: () => .light),
    goal: Goal.values.firstWhere((goal) => goal.name == json['goal']),
    activityLevel: ActivityLevel.values.firstWhere((al) => al.name == json['activityLevel']),
  );

  Map<String, dynamic> toJson() => {
    'appLanguage': appLanguage.languageCode,
    'exerciseLibLanguage': exerciseLibLanguage.languageCode,
    'themeMode': mode.name,
    'goal': goal?.name,
    'activityLevel': activityLevel?.name,
  };

  Configs copyWith({
    Locale? appLanguage,
    Locale? exerciseLibLanguage,
    ThemeMode? mode,
    Goal? goal,
    ActivityLevel? activityLevel,
  }) => Configs(
    appLanguage: appLanguage ?? this.appLanguage,
    exerciseLibLanguage: exerciseLibLanguage ?? this.exerciseLibLanguage,
    mode: mode ?? this.mode,
    goal: goal ?? this.goal,
    activityLevel: activityLevel ?? this.activityLevel,
  );
}
