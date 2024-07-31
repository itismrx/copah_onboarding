import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:flutter/material.dart';

// Current app theme
ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  textTheme: appTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
      foregroundColor: const WidgetStatePropertyAll(AppColors.whiteColor),
      textStyle:
          const WidgetStatePropertyAll(TextStyle(color: AppColors.whiteColor)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  ),
);

// App's text theme
TextTheme appTextTheme = const TextTheme(
  headlineMedium: TextStyle(
      color: AppColors.blackColor,
      fontFamily: "Futura",
      fontStyle: FontStyle.italic,
      fontSize: 24),
  bodySmall: TextStyle(
      fontFamily: "Circular Sid",
      fontSize: 16,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500),
  bodyMedium: TextStyle(
      fontFamily: "Circular Sid",
      fontSize: 18,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500),
  bodyLarge: TextStyle(
    fontFamily: "Circular Sid",
    fontSize: 20,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  ),
);
