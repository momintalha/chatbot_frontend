import 'package:chatbot_frontend/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeIconbutton {
  ThemeIconbutton._();

  static IconButtonThemeData lightTheme = IconButtonThemeData(
    style: IconButton.styleFrom(backgroundColor: AppColors.darkAccent),
  );

  static IconButtonThemeData darkTheme = IconButtonThemeData(
    style: IconButton.styleFrom(backgroundColor: AppColors.lightAccent),
  );
}
