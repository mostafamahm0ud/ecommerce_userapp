import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.bodyContent16Gray,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.bodyContent16Gray,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
  ),
);
