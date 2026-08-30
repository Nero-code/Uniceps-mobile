import 'package:flutter/material.dart';

abstract class AppColors {
  // Base Colors
  static const lightBg = Color(0xFFF6F8FA);
  static const cardSurface = Colors.white;
  static const primaryDark = Color(0xFF1E293B);
  static const textSubtle = Color(0xFF64748B);
  static const borderLight = Color(0xFFE2E8F0);

  // Seed Colors provided by you
  static const primary = Color(0xFF3D84A7);
  static const secondary = Color(0xFF46CDCF);

  // Mapped for backwards compatibility with your existing widgets
  static const primaryTeal = primary;
  static const accentMint = secondary;
}

// Generate the Themes
ThemeData lightTheme = _buildTheme(Brightness.light);
ThemeData darkTheme = _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;

  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    brightness: brightness,
    surface: isDark ? const Color(0xFF0F172A) : AppColors.lightBg,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    brightness: brightness,
    fontFamily: 'Cairo', // Keeping your current font

    scaffoldBackgroundColor: colorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: isDark ? Colors.white : AppColors.primaryDark,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isDark ? Colors.white10 : AppColors.borderLight),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isDark ? Colors.white24 : AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    ),
  );
}
