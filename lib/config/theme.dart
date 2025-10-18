import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get clayTheme {
    return ThemeData(
      primaryColor: AppColors.clayGreen,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      fontFamily: 'Poppins',
      
      colorScheme: ColorScheme.light(
        primary: AppColors.clayGreen,
        secondary: AppColors.clayBrown,
        surface: AppColors.cardBeige,
        background: AppColors.backgroundLight,
        error: Colors.red.shade400,
      ),
      
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardBeige,
        selectedItemColor: AppColors.buttonGreen,
        unselectedItemColor: AppColors.textMedium,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonGreen,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 4,
        ),
      ),
      
      cardTheme: CardTheme(
        color: AppColors.cardBeige,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textMedium,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textMedium,
        ),
      ),
    );
  }
}
