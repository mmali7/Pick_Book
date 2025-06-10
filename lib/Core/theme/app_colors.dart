import 'package:flutter/material.dart';

/// App color constants following clean architecture principles
class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF20B2AA); // Teal
  static const Color secondary = Color(0xFF1E3A8A); // Navy Blue
  static const Color accent = Color(0xFFFFFFFF); // White

  // Background colors
  static const Color background = Color(0xFFF8FAFC); // Light Gray
  static const Color surface = Color(0xFFFFFFFF); // White

  // Text colors
  static const Color textPrimary = Color(0xFF1E3A8A); // Navy Blue
  static const Color textSecondary = Color(0xFF334155); // Dark Gray
  static const Color textLight = Color(0xFFFFFFFF); // White

  // Utility colors
  static const Color shadow = Color(0x1A000000); // Black with opacity
  static const Color overlay = Color(0x0D20B2AA); // Primary with opacity

  // Gradient colors
  static List<Color> primaryGradient = [
    primary,
    primary.withOpacity(0.9),
    secondary,
  ];

  static List<Color> backgroundGradient = [
    background,
    background.withOpacity(0.8),
    primary.withOpacity(0.1),
  ];
}
