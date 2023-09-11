import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fcmToken = _firebaseMessaging.getToken();

    print("Token: $fcmToken");
  }
}