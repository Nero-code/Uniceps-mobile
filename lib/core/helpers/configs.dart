import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class Configs extends Equatable {
  final Locale appLanguage;
  final Locale exerciseLibLanguage;
  final ThemeMode mode;
  final Goal? goal;
  final ActivityLevel? activityLevel;

  const Configs({
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
    goal: Goal.values.where((goal) => goal.name == json['goal']).firstOrNull,
    activityLevel: ActivityLevel.values.where((al) => al.name == json['activityLevel']).firstOrNull,
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    appLanguage.languageCode,
    exerciseLibLanguage.languageCode,
    mode.name,
    goal?.name,
    activityLevel?.name,
  ];
}
