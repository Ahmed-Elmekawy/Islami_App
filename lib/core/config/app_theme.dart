import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';
import '../constants.dart';
import '../utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarThemeData(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppStyles.titleMedium,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.primary,
        onPrimary: AppColors.secondary,
        onSecondary: AppColors.white,
        onSurface: AppColors.secondary,
      ),
      textTheme: const TextTheme(
        headlineLarge: AppStyles.headlineLarge,
        headlineMedium: AppStyles.headlineMedium,
        titleLarge: AppStyles.titleLarge,
        titleMedium: AppStyles.titleMedium,
        bodyLarge: AppStyles.bodyLarge,
        bodyMedium: AppStyles.bodyMedium,
        bodySmall: AppStyles.bodySmall,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.secondary,
        selectedLabelStyle: AppStyles.bodySmall,
        type: BottomNavigationBarType.fixed,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppStyles.bodyLarge.copyWith(color: AppColors.white),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        filled: true,
        fillColor: AppColors.secondary.withValues(alpha: 0.7),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
