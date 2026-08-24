import 'package:flutter/material.dart';

abstract class AppColors {
  static const lightBg = Color(0xFFF6F8FA);
  static const cardSurface = Colors.white;
  static const primaryDark = Color(0xFF1E293B);
  static const primaryTeal = Color(0xFF0EA5E9);
  static const accentMint = Color(0xFF10B981);
  static const textSubtle = Color(0xFF64748B);
  static const borderLight = Color(0xFFE2E8F0);
}

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

// const sec2 = Color(0xFF00A9B9);

const mainBlueDark = Color(0xFF263137); // D   R                    10
const themeDark = Color(0xFF3C494F); //   A   K                 11
const themeLight = Color(0xFFD7E6E6); //                         12

const background = Color.fromARGB(255, 245, 245, 245);
// const back2 = Color.fromARGB(255, 228, 228, 228);
const back2 = Color(0xFFF4F4F4);

const secondaryLighter = Color(0xFFDBF5F6);
const secondaryLight = Color(0xFFB5EBE9);

ThemeData lightTheme = ThemeData(
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: mainBlueLight, foregroundColor: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: mainBlueLight,
    foregroundColor: back2,
  ),
  fontFamily: 'Cairo',
  appBarTheme: const AppBarTheme().copyWith(
    // foregroundColor: Colors.black,
    // foregroundColor: ,
    // backgroundColor: back2,
    // systemOverlayStyle: const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,

    //     systemNavigationBarColor: Colors.transparent),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainBlue,
    primary: mainBlueLight,
    secondary: secondaryBlue,
    // background: back2,
    secondaryContainer: secondaryBlue,
    // onBackground: mainBlueDark,
    onPrimaryContainer: themeDark,
    onPrimary: color5,
    surfaceTint: Colors.transparent, // AppBar transparent layer on scroll...
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
