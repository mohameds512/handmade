import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreference;
  Future<MyServices>  init() async {
    // FirebaseOptions options = const FirebaseOptions(
    //   appId: '1:229093272989:android:556f493f8862343bb0d374',
    //   apiKey: 'AIzaSyAAiQ2sdVcYY-xgCIFEd4s6MsV6Cv-uYnQ',
    //   projectId: 'handmade-3c0cf',
    //   messagingSenderId: '229093272989',
    // );
    // await Firebase.initializeApp(options: options);
    sharedPreference = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async{
  await Get.putAsync(() => MyServices().init());
}