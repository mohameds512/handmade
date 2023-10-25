
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/chat/chat_data.dart';
import 'package:handmade/services/services.dart';

class ChatController extends GetxController{
  List ChatList = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late int user_id ;
  late TextEditingController message;

  ChatData chatData = ChatData(Get.find());

  GetChatList()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatData.GetChatList(myServices.sharedPreference.getInt("id"));
    statusRequest = handlingData(response);
    ChatList.clear();
    ChatList =response['chatList'];
    update();
  }

  sendMessage()async{
    // if(message.text != null ){
      var response = await chatData.SendMessage(user_id.toString(),'100',message.text);
      print(response['message']);
      ChatList.add(response['message']);
      // ChatList.add({'message':message.text,'sender_id':user_id,'receiver_id':100});
      message.text = '';
      update();
    // }


  }
  @override
  void onInit() {
    user_id = myServices.sharedPreference.getInt("id")!;
    message = TextEditingController();
    GetChatList();
    super.onInit();
  }
}