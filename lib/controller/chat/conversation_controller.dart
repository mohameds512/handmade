
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/chat/conversation_data.dart';
import 'package:handmade/services/services.dart';

class ConversationController extends GetxController{
  List listConversation = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late StatusRequest statusRequestSearch;
  TextEditingController? search;
  List searchedUsers = [];
  bool searchResolute = true;
  bool isSearch = false;
  late String receiver_id ;

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

  getName(data){
    if(data['user_id_1'] == myServices.sharedPreference.getInt("id")!){
      receiver_id = data['user_id_2'].toString();
       return data['names'][data['user_id_2'].toString()];
    }else{
      receiver_id = data['user_id_1'].toString();
      return data['names'][data['user_id_1'].toString()];
    }
  }
  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }else{
      isSearch = true;
      SearchUsers(val);
    }
    update();
  }

  @override
  SearchUsers(val) async {
    statusRequest = StatusRequest.loading;
    searchedUsers.clear();
    searchResolute = true;
    update();
    var response = await conversationData.searchUsers(val);
    print("response : $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
        searchedUsers.addAll(response["users"]);
    }else{
      searchResolute = false;
    }
    if(searchedUsers.length == 0){
      searchResolute = false;

    }
    update();
  }

  @override
  void onInit() {
    GetConversations();
    search = TextEditingController();
    super.onInit();
  }


}