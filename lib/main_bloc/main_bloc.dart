import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  var theme = ThemeMode.light;
  var lang = Language.En;
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {
      if (event is ThemeSwitch) {
        emit(
          ActiveState(
            themeMode:
                theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            language: lang,
          ),
        );
      } else if (event is LanguageSwitch) {
        emit(
          ActiveState(
              themeMode: theme,
              language: lang == Language.En ? Language.Ar : Language.En),
        );
      }
    });
  }
}
