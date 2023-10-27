import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:handmade/controller/chat/chat_controller.dart';
import 'package:handmade/controller/notification/notification_controller.dart';
import 'package:handmade/controller/order/order_controller.dart';
requestNotificationPermission()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig(){

  FirebaseMessaging.onMessage.listen((message) {

    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!,message.notification!.body!);
    // refreshNotifications
    if(message.data['pagename'] == 'message'){
      ChatController chatController = Get.find();
      chatController.receiveMessage();
    }
    NotificationController NotfController = Get.find();
    NotfController.refreshNotf();
    refreshOrderPage(message.data);

  });
}


refreshOrderPage(data){
  if(Get.currentRoute == "/pendingorder" && data['pageName'] == "order"){

    OrderController order = Get.find();
    order.refreshOrders();
  }
}