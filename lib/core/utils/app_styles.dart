import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static const TextStyle headlineLarge = TextStyle(
    color: AppColors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.primary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
}
