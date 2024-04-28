import 'package:flutter/material.dart';

class AppTheme{
  static const whiteColor= Colors.white;
  static const lightBlueColor= Color(0xFF6D8CFC);
  static Color lightGreyColor= Colors.grey[200]!;
  static const Color cardColor = Color(0xFF1C1C2D);
  static const Color inactiveCardColor = Color(0xFF111328);

  static ThemeData  themeData= ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: lightBlueColor,
    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: whiteColor,
      centerTitle: true
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8D8E98),
      ),
      bodyLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w900,
        color: whiteColor,
      ),
    ),
  );

}