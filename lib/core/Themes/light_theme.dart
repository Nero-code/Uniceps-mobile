import 'package:flutter/material.dart';

const color1 = Color(0xFF000814);
const color2 = Color(0xFF001D3D);
const color3 = Color(0xFF003566);
const color4 = Color(0xFFFFC300);
const color5 = Color(0xFFFFD60A);
// New
const color6 = Color(0xFF47466D); // M
const color7 = Color(0xFF3D84A7); //  A
const color8 = Color(0xFF46CDCF); //   I     T H E M E
const color9 = Color(0xFFABEDD8); //    N

const color10 = Color(0xFF263137); // D   R
const color11 = Color(0xFF3C494F); //   A   K
const color12 = Color(0xFFD7E6E6);

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme()
      .copyWith(foregroundColor: Colors.white, backgroundColor: color7),
  colorScheme: ColorScheme.fromSeed(
    seedColor: color6,
    primary: color7,
    secondary: color8,
    background: Colors.white,
    secondaryContainer: color8,
    onBackground: color10,
    onPrimaryContainer: color11,
    onPrimary: color5,
    surfaceTint: Colors.transparent, // AppBar transparent layer on scroll...
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
