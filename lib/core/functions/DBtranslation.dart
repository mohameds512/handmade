import 'package:handmade/services/services.dart';
import 'package:get/get.dart';
TransDB(data){

  MyServices myServices = Get.find();
  // return data[myServices.sharedPreference.getString("lang")];

  String? lang = myServices.sharedPreference.getString("lang");
  // return data['en'];
  if (lang != null && data.containsKey(lang)) {
    return data[lang];
  } else {
    return data['en'];
  }
}