import 'package:chatbot_frontend/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeText {
  ThemeText._();

  // Light Theme
  static TextTheme lightTheme = TextTheme(
    labelSmall: TextStyle(
      color: Colors.black54,
      fontFamily: 'GoogleSansText',
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: AppColors.lightUserBubbleText,
      fontFamily: 'GoogleSansText',
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: AppColors.lightBotBubbleText,
      fontFamily: 'GoogleSansText',
      fontSize: 20,
    ),
  );

  // Dark Theme
  static TextTheme darktTheme = TextTheme(
    labelSmall: TextStyle(
      color: Colors.white54,
      fontFamily: 'GoogleSansText',
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: AppColors.darkUserBubbleText,
      fontFamily: 'GoogleSansText',
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: AppColors.darkBotBubbleText,
      fontFamily: 'GoogleSansText',
      fontSize: 20,
    ),
  );
}
