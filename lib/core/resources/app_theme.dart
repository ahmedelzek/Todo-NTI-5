import 'package:flutter/material.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colors.green,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      color: AppColors.backgroundColor,
      centerTitle: true,
    ),
    useMaterial3: true,
    fontFamily: 'LexendDeca',
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w200,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.grey, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: AppColors.lightGrey,
              width: 1
          )
      ),
    ),
  );
}