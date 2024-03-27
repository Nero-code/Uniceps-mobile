import 'package:flutter/material.dart';

const color1 = Color(0xFF000814);
const color2 = Color(0xFF001D3D);
const color3 = Color(0xFF003566);
const color4 = Color(0xFFFFC300);
const color5 = Color(0xFFFFD60A);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: color2,
    secondary: color5,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
