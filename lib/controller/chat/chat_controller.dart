
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/chat/chat_data.dart';
import 'package:handmade/data/datasource/remote/chat/conversation_data.dart';
import 'package:handmade/services/services.dart';

class ChatController extends GetxController{
  List ChatList = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late int user_id ;
  late String receiver_id ;
  late String receiver_name = '' ;
  late TextEditingController message;
  bool waitConver = false;
  String? conver_id;
  ScrollController scrollController = ScrollController();
  ChatData chatData = ChatData(Get.find());
  ConversationData conversationData = ConversationData(Get.find());

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
    receiver_name = response['names'][receiver_id];
    print("receiver_name: $receiver_name");
    update();
  }

  sendMessage()async{

    if(message.text == '' ){
      return;
    }
    print('conver_id');
    print(conver_id);
    late String textMessage =message.text;
    ChatList.add({'message':textMessage,'sender_id':user_id});
    message.text = '';
    var response = await chatData.SendMessage(user_id.toString(),receiver_id,conver_id,textMessage);
      print('response');
      print(response);

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

  createConversation()async{
    waitConver = true ;
    update();
    var response = await conversationData.addConversation(user_id, receiver_id);

    conver_id = response['conver']['id'].toString();
    waitConver = false ;
    update();

  }

  @override
  void onInit() {
    user_id = myServices.sharedPreference.getInt("id")!;
    conver_id = Get.arguments['conver_id'].toString();
    if(conver_id == 'null' ){
      receiver_id = Get.arguments['receiver_id'].toString();
      createConversation();
    }
    message = TextEditingController();
    if(waitConver == false){
      GetChatList();
    }
    super.onInit();
    scrollController = ScrollController();
  }

}