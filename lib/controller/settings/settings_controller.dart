import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/services/services.dart';

abstract class SettingsController extends GetxController{
  LogOut();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  bool? switchValue ;
  @override
  LogOut() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user_${myServices.sharedPreference.getInt("id").toString()}");
    String? currentLanguage = myServices.sharedPreference.getString("lang");
    print(currentLanguage);
    myServices.sharedPreference.clear();
    myServices.sharedPreference.setString("lang", currentLanguage!);

    Get.offAllNamed(AppRoute.login);
    // throw UnimplementedError();
  }

  @override
  muteNotification(){

     switchValue = !switchValue!;
     myServices.sharedPreference.setBool("Notification",switchValue!);

     if(switchValue == true){

       FirebaseMessaging.instance.unsubscribeFromTopic("users");
       FirebaseMessaging.instance.unsubscribeFromTopic("user_${myServices.sharedPreference.getInt("id").toString()}");
     }else{
       FirebaseMessaging.instance.subscribeToTopic("users");
       FirebaseMessaging.instance.subscribeToTopic("user_${myServices.sharedPreference.getInt("id").toString()}");
     }

     update();

  }
  @override
  void onInit() {
    switchValue = myServices.sharedPreference.getBool("Notification");
    super.onInit();
  }
}