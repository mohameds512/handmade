
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

  @override
  void onInit() {
    user_id = myServices.sharedPreference.getInt("id")!;
    GetChatList();
    super.onInit();
  }
}