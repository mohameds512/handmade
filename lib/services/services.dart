import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreference;
  Future<MyServices>  init() async {
    // FirebaseOptions options = const FirebaseOptions(
    //   appId: '1:229093272989:android:556f493f8862343bb0d374',
    //   apiKey: 'AIzaSyAAiQ2sdVcYY-xgCIFEd4s6MsV6Cv-uYnQ',
    //   projectId: 'handmade-3c0cf',
    //   messagingSenderId: '229093272989',
    // );
    await Firebase.initializeApp();
    sharedPreference = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async{
  await Get.putAsync(() => MyServices().init());
}
Future<void> initUniLinks() async {
  try {
    await getInitialLink();

  } on PlatformException {

  }

  // Listen to incoming links throughout the app lifetime
  linkStream.listen((String? link) {
    print(link);
    if (link != null) {

    }
  });
}