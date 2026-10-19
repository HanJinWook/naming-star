import 'package:flutter/material.dart';

/// 작명별 디자인 시스템 — '새벽녘 별' 컨셉의 따뜻한 프리미엄 무드
class AppTheme {
  static const bg = Color(0xFFFFF9F1);
  static const surface = Colors.white;
  static const primary = Color(0xFF3D348B); // deep indigo
  static const primarySoft = Color(0xFFEEEAFB);
  static const gold = Color(0xFFF7B32B);
  static const coral = Color(0xFFF4845F);
  static const ink = Color(0xFF2B2440);
  static const sub = Color(0xFF8A839E);
  static const line = Color(0xFFF0E7D8);
  static const boy = Color(0xFF5B8DEF);
  static const girl = Color(0xFFF472A0);
  static const good = Color(0xFF43A06B);
  static const warn = Color(0xFFE0A030);
  static const bad = Color(0xFFE05D5D);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: gold,
        surface: surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        foregroundColor: ink,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: ink),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: line),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: primary, width: 1.6),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: ink, height: 1.55),
        bodySmall: TextStyle(color: sub, height: 1.5),
      ),
    );
  }

  static Color scoreColor(double score) {
    if (score >= 85) return good;
    if (score >= 70) return gold;
    if (score >= 55) return warn;
    return bad;
  }

  static String scoreWord(double score) {
    if (score >= 90) return '최상';
    if (score >= 80) return '우수';
    if (score >= 70) return '양호';
    if (score >= 55) return '보통';
    return '주의';
  }
}
