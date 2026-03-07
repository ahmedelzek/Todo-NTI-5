import 'package:flutter/material.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colors.green,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
  );
}