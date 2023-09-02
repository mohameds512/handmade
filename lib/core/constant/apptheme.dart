import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

ThemeData themeEnglish  = ThemeData(
    appBarTheme:const  AppBarTheme(
        color: AppColor.primaryColor
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
    ),
    fontFamily: "PlayfairDisplay",
    textTheme:  const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black
      ),
      displayMedium :TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black
      ),
      bodyLarge: TextStyle(
          height: 2, color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 18
      ),
    ),
    primarySwatch: Colors.blue
);

ThemeData themeArabic  = ThemeData(
      appBarTheme: const AppBarTheme(
            color: AppColor.primaryColor
      ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
    ),
    fontFamily: "Cairo",
    textTheme:  const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
      displayMedium :TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),
      bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    primarySwatch: Colors.blue
);