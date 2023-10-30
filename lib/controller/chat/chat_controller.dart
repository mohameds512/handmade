
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
  late String receiver_id ;
  late TextEditingController message;
  String? conver_id;
  ScrollController scrollController = ScrollController();
  ChatData chatData = ChatData(Get.find());

  GetChatList()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatData.GetChatList(conver_id);
    statusRequest = handlingData(response);
    ChatList.clear();
    ChatList = response['chatList'];
    update();
    if(response['Conversation']['user_id_1'] == user_id){
      receiver_id = response['Conversation']['user_id_2'].toString();
    }else{
      receiver_id = response['Conversation']['user_id_1'].toString();
    }
  print("receiver_id: $receiver_id");
  }

  sendMessage()async{

    if(message.text == '' ){
      return;
    }
    late String textMessage =message.text;
    ChatList.add({'message':textMessage,'sender_id':user_id});
    message.text = '';
    var response = await chatData.SendMessage(user_id.toString(),receiver_id,conver_id,textMessage);
      // print(response['message']);
      // ChatList.add(response['message']);

      scrollController.jumpTo(scrollController.position.maxScrollExtent);

      update();


  }
  receiveMessage()async{
    print(ChatList.length);
    var response = await chatData.GetChatList(conver_id);
    ChatList.clear();
    ChatList =response['chatList'];
    scrollController.jumpTo(scrollController.position.maxScrollExtent);

    update();

  }
  @override
  void onInit() {
    conver_id = Get.arguments['conver_id'].toString();
    user_id = myServices.sharedPreference.getInt("id")!;
    message = TextEditingController();
    GetChatList();
    super.onInit();
    scrollController = ScrollController();
  }

}