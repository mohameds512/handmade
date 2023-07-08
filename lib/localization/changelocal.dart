import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/services/services.dart';

import '../core/constant/apptheme.dart';
class LocaleController extends GetxController {
  Locale? language ;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreference.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreference.getString("lang");
    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }else if(sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    }else if(sharedPrefLang == "du"){
      language = const Locale("du");
      appTheme = themeEnglish;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}