import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

ThemeData themeEnglish  = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.grey[60],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      backgroundColor: AppColor.secWhiteColor,
      titleTextStyle: const TextStyle(color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,fontFamily: "Cairo",fontSize: 20),
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
    ),
    fontFamily: "sans",
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
      appBarTheme: AppBarTheme(
            color: Colors.grey[60],
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: AppColor.secWhiteColor,
        titleTextStyle: const TextStyle( fontFamily: "Cairo",color: AppColor.primaryColor,fontWeight: FontWeight.bold),
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