import 'package:flutter/material.dart';

const color1 = Color(0xFF000814);
const color2 = Color(0xFF001D3D);
const color3 = Color(0xFF003566);
const color4 = Color(0xFFFFC300);
const color5 = Color(0xFFFFD60A);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.amber,
    secondary: color5,
    surfaceTint: Colors.transparent, // AppBar trasparent layer on scroll...
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
