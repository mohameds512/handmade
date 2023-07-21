import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/services/services.dart';
class MyMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreference.getString("step") == "2"){
      return const RouteSettings(name: AppRoute.home);
    }
    if(myServices.sharedPreference.getString("step") == "1"){
      return const RouteSettings(name: AppRoute.login);
    }


  }
}