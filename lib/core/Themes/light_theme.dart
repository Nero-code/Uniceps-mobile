import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const color1 = Color(0xFF000814);
const color2 = Color(0xFF001D3D);
const color3 = Color(0xFF003566);
const color4 = Color(0xFFFFC300);
const color5 = Color(0xFFFFD60A);
// New
const mainBlue = Color(0xFF47466D); // M                            6
const mainBlueLight = Color(0xFF3D84A7); //  A                      7
const secondaryBlue = Color(0xFF46CDCF); //   I     T H E M E       8
const secondaryBlueLight = Color(0xFFABEDD8); //    N               9

const mainBlueDark = Color(0xFF263137); // D   R                    10
const themeDark = Color(0xFF3C494F); //   A   K                 11
const themeLight = Color(0xFFD7E6E6); //                         12

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme().copyWith(
    foregroundColor: Colors.white,
    backgroundColor: mainBlueLight,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainBlue,
    primary: mainBlueLight,
    secondary: secondaryBlue,
    background: Colors.white,
    secondaryContainer: secondaryBlue,
    onBackground: mainBlueDark,
    onPrimaryContainer: themeDark,
    onPrimary: color5,
    surfaceTint: Colors.transparent, // AppBar transparent layer on scroll...
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
