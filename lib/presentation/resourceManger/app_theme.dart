import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';

class ThemeService {
  void switchTheme() {
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }

  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;
}

class AppThemes {
  static final lightTheme = ThemeData(
    cardColor: AppColors.lightLabelColor,
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(

      bodyLarge: TextStyle(color: AppColors.myBlack),
      bodyMedium: TextStyle(color: AppColors.darkLabelColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColor,
      iconTheme: IconThemeData(color: AppColors.backgroundColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.myBlack),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.myOrange,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final darkTheme = ThemeData(
    cardColor: AppColors.darkLabelColor,
    primaryColor: AppColors.mainDarkColor,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: TextTheme(

      bodyLarge: const TextStyle(color: AppColors.backgroundColor),
      bodyMedium: TextStyle(color: AppColors.lightLabelColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[800],
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange[700],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
