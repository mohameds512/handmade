
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/chat/conversation_data.dart';
import 'package:handmade/services/services.dart';

class ConversationController extends GetxController{
  List listConversation = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  ConversationData conversationData = ConversationData(Get.find());
  GetConversations()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await conversationData.GetConversationList(myServices.sharedPreference.getInt("id"));
    statusRequest = handlingData(response);
    listConversation.clear();
    listConversation =response['conversations'];
    update();

  }

  @override
  void onInit() {
    GetConversations();
    super.onInit();
  }


}