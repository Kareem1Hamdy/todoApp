import 'package:flutter/material.dart';
import 'package:todo_app/Colors/app_colors.dart';

class AppTheme{
  static ThemeData lightThemeData=ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryAppColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryTopColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    )
  );

}