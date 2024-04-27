import 'package:flutter/material.dart';

class AppTheme{
  static const whiteColor= Colors.white;
  static const lightBlueColor= Color(0xFF6D8CFC);
  static Color lightGreyColor= Colors.grey[200]!;


  static ThemeData  themeData= ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: lightBlueColor,
    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: whiteColor,
      centerTitle: true
    ),
  );

}