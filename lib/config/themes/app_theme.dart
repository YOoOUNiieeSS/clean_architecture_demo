import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )),
    textTheme: const TextTheme(
      //     button: const TextStyle(
      //   fontSize: 16,
      //   color: Colors.black,
      //   fontWeight: FontWeight.w500,
      // ),
      bodyMedium: TextStyle(
          height: 1.2,
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.w700),
    ),
  );
}
