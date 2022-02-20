import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.purple,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.gray,
    ),

    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.purple,
    ),
    // colorScheme: AppColors.colorScheme,
    textTheme: AppTextTheme.textTheme,
    scaffoldBackgroundColor: AppColors.colorScheme.background,
    buttonTheme: ButtonThemeData(
      // colorScheme: AppColors.colorScheme,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
        elevation: MaterialStateProperty.all(
          0,
        ),
      ),
    ),
  );
}
