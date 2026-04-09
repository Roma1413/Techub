import 'package:flutter/material.dart';

// ─── TechHub Color Palette ─────────────────────────────
class TechColors {
  static const background    = Color(0xFF0A0A0F);
  static const surface       = Color(0xFF13131A);
  static const surfaceHigh   = Color(0xFF1C1C28);
  static const border        = Color(0xFF2A2A3A);

  static const accent        = Color(0xFF00D4FF);
  static const accentAlt     = Color(0xFF7C3AED);

  static const success       = Color(0xFF00C896);
  static const warning       = Color(0xFFFFB800);

  static const textPrimary   = Color(0xFFF0F0FF);
  static const textSecondary = Color(0xFF8888AA);
  static const textMuted     = Color(0xFF4A4A6A);

  static const cardGlow      = Color(0x1500D4FF);
}

// ─── TechHub Theme ─────────────────────────────────────
ThemeData techHubTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: TechColors.background,

    colorScheme: const ColorScheme.dark(
      primary: TechColors.accent,
      secondary: TechColors.accentAlt,
      surface: TechColors.surface,

      onPrimary: TechColors.background,
      onSecondary: Colors.white,
      onSurface: TechColors.textPrimary,

      outline: TechColors.border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: TechColors.background,
      foregroundColor: TechColors.textPrimary,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    cardTheme: CardThemeData(
      color: TechColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: TechColors.border,
          width: 1,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: TechColors.accent,
        foregroundColor: TechColors.background,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: TechColors.surfaceHigh,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: TechColors.border,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: TechColors.border,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: TechColors.accent,
          width: 1.5,
        ),
      ),

      labelStyle: const TextStyle(
        color: TechColors.textSecondary,
      ),

      hintStyle: const TextStyle(
        color: TechColors.textMuted,
      ),
    ),

    listTileTheme: const ListTileThemeData(
      textColor: TechColors.textPrimary,
      iconColor: TechColors.accent,
    ),

    dividerTheme: const DividerThemeData(
      color: TechColors.border,
    ),

    textTheme: const TextTheme(
      displayLarge:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w800),

      displayMedium:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w800),

      headlineLarge:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w700),

      headlineMedium:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w700),

      headlineSmall:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w600),

      titleLarge:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w600),

      titleMedium:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w500),

      titleSmall:
      TextStyle(color: TechColors.textPrimary, fontWeight: FontWeight.w500),

      bodyLarge:
      TextStyle(color: TechColors.textPrimary),

      bodyMedium:
      TextStyle(color: TechColors.textSecondary),

      bodySmall:
      TextStyle(
        color: TechColors.textSecondary,
        fontSize: 12,
      ),

      labelSmall:
      TextStyle(
        color: TechColors.textMuted,
        fontSize: 11,
        letterSpacing: 0.5,
      ),
    ),
  );
}

// ─── Tabs ──────────────────────────────────────────────
enum TechTab {
  explore('explore'),
  orders('orders'),
  account('account');

  const TechTab(this.value);

  final String value;
}