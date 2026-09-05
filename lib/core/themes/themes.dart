import 'package:chatbot_frontend/core/themes/colors/app_colors.dart';
import 'package:chatbot_frontend/core/themes/custom_themes/theme_iconbutton.dart';
import 'package:chatbot_frontend/core/themes/custom_themes/theme_text.dart';
import 'package:flutter/material.dart';

class Themes {
  Themes._();
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(primaryContainer: AppColors.darkUserBubble),
    textTheme: ThemeText.lightTheme,
    iconButtonTheme: ThemeIconbutton.lightTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(primaryContainer: AppColors.lightUserBubble),
    textTheme: ThemeText.darktTheme,
    iconButtonTheme: ThemeIconbutton.darkTheme,
  );
}
