import 'package:handmade/services/services.dart';
import 'package:get/get.dart';
TransDB(data){
  MyServices myServices = Get.find();
  return data[myServices.sharedPreference.getString("lang")];

}